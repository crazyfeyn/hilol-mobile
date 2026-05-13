import 'dart:io';

import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/extension/extensions.dart';
import 'package:commerce_mobile/core/utils/app_constants.dart';
import 'package:commerce_mobile/data/repositories/payment_repository_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tosspayments_widget_sdk_flutter/model/tosspayments_url.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TossPayBottomSheet extends StatefulWidget {
  final String paymentUrl;
  final VoidCallback? onConfirm;
  final VoidCallback? onFailure;

  const TossPayBottomSheet({
    super.key,
    required this.paymentUrl,
    this.onConfirm,
    this.onFailure,
  });

  static Future<T?> bottomSheet<T>({
    required BuildContext context,
    required String paymentUrl,
    VoidCallback? onConfirm,
    VoidCallback? onFailure,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      builder: (_) {
        return TossPayBottomSheet(
          paymentUrl: paymentUrl,
          onConfirm: onConfirm,
          onFailure: onFailure,
        );
      },
    );
  }

  @override
  State<TossPayBottomSheet> createState() => _TossPayBottomSheetState();
}

class _TossPayBottomSheetState extends State<TossPayBottomSheet> {
  late final WebViewController controller;
  final _repository = PaymentRepositoryImpl();
  // Tracks confirmed orderIds to prevent double-firing from duplicate navigation events.
  final _confirmedOrderIds = <String>{};
  bool isLoading = true;

  Future<bool> _handleOverrideUrl(String requestedUrl) async {
    final convertUrl = ConvertUrl(requestedUrl);

    if (Platform.isAndroid) {
      convertUrl.launchApp();
      return true;
    }

    final isHtml = requestedUrl.startsWith('data:text/html');
    final isNetworkUrl = convertUrl.appScheme == 'http' || convertUrl.appScheme == 'https';
    final isIntent = convertUrl.appScheme == 'intent';

    if (isHtml || isIntent) {
      return false;
    } else if (isNetworkUrl) {
      if (Uri.parse(requestedUrl).host.startsWith('payment-widget')) {
        // NOTE (@JooYang): 결제위젯 제품의 /popup-bridge 에서 열리는 무이자할부 페이지는 웹뷰 내부에서 이동하지 않고 외부 앱에서 엽니다.
        // @see {https://www.notion.so/tossteam/iOS-15aa360d33e38011ace8f6bea15c5ccf?pvs=4}
        if (Uri.parse(requestedUrl).path == '/popup-bridge') {
          await convertUrl.launchApp();
          return true;
        }

        return false;
      } else if (isIntent) {
        await convertUrl.launchApp();
      } else {
        await convertUrl.launchApp();
      }
    }

    return true;
  }

  Future<NavigationDecision> _handleTossSuccess(Uri uri) async {
    final paymentKey = uri.queryParameters['paymentKey'] ?? '';
    final orderId = uri.queryParameters['orderId'] ?? '';
    final amount = int.tryParse(uri.queryParameters['amount'] ?? '') ?? 0;

    if (_confirmedOrderIds.contains(orderId)) {
      return NavigationDecision.prevent;
    }
    _confirmedOrderIds.add(orderId);

    final result = await _repository.confirmTossPayment(paymentKey, orderId, amount);

    if (!mounted) return NavigationDecision.prevent;
    NavigationService.pop(context);

    result.fold(
      (_) => widget.onFailure?.call(),
      (success) {
        if (success) {
          widget.onConfirm?.call();
        } else {
          widget.onFailure?.call();
        }
      },
    );

    return NavigationDecision.prevent;
  }

  Future<NavigationDecision> _handleTossFail(Uri uri) async {
    final code = uri.queryParameters['code'] ?? '';
    final message = uri.queryParameters['message'] ?? '';
    final orderId = uri.queryParameters['orderId'] ?? '';

    await _repository.notifyTossFail(code, message, orderId);

    if (!mounted) return NavigationDecision.prevent;
    NavigationService.pop(context);
    widget.onFailure?.call();

    return NavigationDecision.prevent;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print(Uri.parse(widget.paymentUrl).host);
      controller =
          WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..enableZoom(false)
            ..addJavaScriptChannel(
              'CloseWebViewChannel',
              onMessageReceived: (JavaScriptMessage message) {},
            )
            ..setNavigationDelegate(
              NavigationDelegate(
                onProgress: (int progress) {
                  if (progress == 100) {
                    isLoading = false;
                    if (mounted) setState(() {});
                  }
                },
                onNavigationRequest: (NavigationRequest request) async {
                  final url = request.url;
                  final uri = Uri.parse(url);

                  if (url.startsWith(AppConstants.tossPaymentSuccessUrl)) {
                    return _handleTossSuccess(uri);
                  }

                  if (url.startsWith(AppConstants.tossPaymentFailUrl)) {
                    return _handleTossFail(uri);
                  }

                  if (url.contains('PAY_PROCESS_CANCELED')) {
                    NavigationService.pop(context);
                    return NavigationDecision.prevent;
                  }

                  // NOTE(@JooYang): 반드시 rawValue 를 사용해야 한다 @see https://www.notion.so/tossteam/SDK-v3Mobile-12ea360d33e380d8b6a9e17138fc65ce?pvs=4
                  final handled = await _handleOverrideUrl(url);
                  return handled
                      ? NavigationDecision.prevent
                      : NavigationDecision.navigate;
                },
              ),
            )
            ..loadRequest(Uri.parse(widget.paymentUrl));
    });
  }

  @override
  void dispose() {
    _repository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.8.sh(context),
      alignment: Alignment.center,
      child: isLoading
          ? Center(child: CircularProgressIndicator())
          : WebViewWidget(
              controller: controller,
              gestureRecognizers: {
                Factory<VerticalDragGestureRecognizer>(
                  () => VerticalDragGestureRecognizer(),
                ),
              },
            ),
    );
  }
}
