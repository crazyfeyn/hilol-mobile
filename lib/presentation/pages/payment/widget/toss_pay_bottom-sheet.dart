import 'package:commerce_mobile/core/extension/extensions.dart';
import 'package:commerce_mobile/core/services/environment_service.dart';
import 'package:commerce_mobile/core/utils/app_snackbar.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/data/datasources/database/db_service.dart';
import 'package:commerce_mobile/data/models/order_model.dart';
import 'package:commerce_mobile/presentation/widgets/custom_elevated_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tosspayments_widget_sdk_flutter/model/payment_info.dart';
import 'package:tosspayments_widget_sdk_flutter/model/payment_widget_options.dart';
import 'package:tosspayments_widget_sdk_flutter/payment_widget.dart';
import 'package:tosspayments_widget_sdk_flutter/widgets/agreement.dart';
import 'package:tosspayments_widget_sdk_flutter/widgets/payment_method.dart';

class TossPayBottomSheet extends StatefulWidget {
  final OrderData order;
  final VoidCallback? onConfirm;

  const TossPayBottomSheet({super.key, required this.order, this.onConfirm});

  static Future<T?> bottomSheet<T>({
    required BuildContext context,
    required OrderData order,
    VoidCallback? onConfirm,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return TossPayBottomSheet(order: order, onConfirm: onConfirm);
      },
    );
  }

  @override
  State<TossPayBottomSheet> createState() => _TossPayBottomSheetState();
}

class _TossPayBottomSheetState extends State<TossPayBottomSheet> {
  late PaymentWidget _paymentWidget;

  @override
  void initState() {
    super.initState();
    _paymentWidget = PaymentWidget(clientKey: EnvironmentService.clientKey, customerKey: DBService.getUserData()!.id.toString());

    _paymentWidget.renderPaymentMethods(
      selector: 'methods',
      amount: Amount(value: widget.order.totalPrice, currency: Currency.KRW, country: "KR"),
      options: RenderPaymentMethodsOptions(variantKey: "DEFAULT"),
    );

    _paymentWidget.renderAgreement(selector: 'agreement');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.8.sh(context),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  PaymentMethodWidget(
                    paymentWidget: _paymentWidget,
                    selector: 'methods',
                  ),
                  AgreementWidget(
                    paymentWidget: _paymentWidget,
                    selector: 'agreement',
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 8,
              left: 16,
              right: 16,
              bottom: MediaQuery.viewPaddingOf(context).bottom + 8,
            ),
            child: CustomElevatedButton(
              onTap: () async {
                final id = "Hilol${widget.order.orderId}";
                final name = "${widget.order.orderId}-hilol";
                final paymentInfo = PaymentInfo(orderId: id, orderName: name);
                final paymentResult = await _paymentWidget.requestPayment(paymentInfo: paymentInfo);
                if (paymentResult.success != null) {
                  widget.onConfirm?.call();
                } else if (paymentResult.fail != null) {
                  GlobalSnackBar.showError(paymentResult.fail!.errorMessage);
                }
              },
              title: context.tr(LocaleKeys.payment_btn),
            ),
          ),
        ],
      ),
    );
  }
}
