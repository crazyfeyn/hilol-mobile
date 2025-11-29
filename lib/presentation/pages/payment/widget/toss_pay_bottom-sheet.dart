import 'dart:io';

import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/extension/extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tosspayments_widget_sdk_flutter/model/tosspayments_url.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TossPayBottomSheet extends StatefulWidget {
  final String paymentUrl;
  final VoidCallback? onConfirm;

  const TossPayBottomSheet({
    super.key,
    required this.paymentUrl,
    this.onConfirm,
  });

  static Future<T?> bottomSheet<T>({
    required BuildContext context,
    required String paymentUrl,
    VoidCallback? onConfirm,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      builder: (_) {
        return TossPayBottomSheet(paymentUrl: paymentUrl, onConfirm: onConfirm);
      },
    );
  }

  @override
  State<TossPayBottomSheet> createState() => _TossPayBottomSheetState();
}

class _TossPayBottomSheetState extends State<TossPayBottomSheet> with WidgetsBindingObserver {
  late final WebViewController controller;
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

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
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
                  final requestWebUri = request.url;

                  if(request.url.contains("PAY_PROCESS_CANCELED")) {
                    NavigationService.pop(context);

                    return NavigationDecision.navigate;
                  }

                  // NOTE(@JooYang): 반드시 rawValue 를 사용해야 한다 @see https://www.notion.so/tossteam/SDK-v3Mobile-12ea360d33e380d8b6a9e17138fc65ce?pvs=4
                  var handled = await _handleOverrideUrl(requestWebUri);
                  if (handled) {
                    return NavigationDecision.prevent;
                  } else {
                    return NavigationDecision.navigate;
                  }
                },
              ),
            )
            ..loadRequest(Uri.parse(widget.paymentUrl));
    });
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && mounted) {
      NavigationService.pop(context);
      widget.onConfirm?.call();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.8.sh(context),
      alignment: Alignment.center,
      child:
          isLoading
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
