import 'package:commerce_mobile/core/extension/extensions.dart';
import 'package:commerce_mobile/core/utils/app_snackbar.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/presentation/widgets/custom_elevated_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tosspayments_widget_sdk_flutter/model/payment_info.dart';
import 'package:tosspayments_widget_sdk_flutter/model/payment_widget_options.dart';
import 'package:tosspayments_widget_sdk_flutter/payment_widget.dart';
import 'package:tosspayments_widget_sdk_flutter/widgets/agreement.dart';
import 'package:tosspayments_widget_sdk_flutter/widgets/payment_method.dart';

class TossPayBottomSheet extends StatefulWidget {
  final double amount;

  const TossPayBottomSheet({super.key, required this.amount});

  static Future<T?> bottomSheet<T>(BuildContext context, double amount) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return TossPayBottomSheet(amount: amount);
      }
    );
  }

  @override
  State<TossPayBottomSheet> createState() => _TossPayBottomSheetState();
}

class _TossPayBottomSheetState extends State<TossPayBottomSheet> {
  late PaymentWidget _paymentWidget;
  PaymentMethodWidgetControl? _paymentMethodWidgetControl;
  AgreementWidgetControl? _agreementWidgetControl;

  @override
  void initState() {
    super.initState();
    _paymentWidget = PaymentWidget(
      clientKey: "test_gck_docs_Ovk5rk1EwkEbP0W43n07xlzm",
      customerKey: "Xjnez2NTuSqQnSxoQBd6K",
      // 결제위젯에 브랜드페이 추가하기
      // paymentWidgetOptions: PaymentWidgetOptions(brandPayOption: BrandPayOption("리다이렉트 URL")) // Access Token 발급에 사용되는 리다이렉트 URL
    );
    _paymentWidget
        .renderPaymentMethods(
        selector: 'methods',
        amount: Amount(value: widget.amount, currency: Currency.KRW, country: "KR"),
        options: RenderPaymentMethodsOptions(variantKey: "DEFAULT")
    ).then((control) async {
      _paymentMethodWidgetControl = control;
    });
    _paymentWidget
        .renderAgreement(selector: 'agreement')
        .then((control) {
      _agreementWidgetControl = control;
    });
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
                  AgreementWidget(paymentWidget: _paymentWidget, selector: 'agreement'),
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
                final paymentResult = await _paymentWidget.requestPayment(paymentInfo: const PaymentInfo(orderId: 'JM8_NiCEpFOgcnzTUSVNS', orderName: 'Futbolka va yana 2 kishini tashlang'));
                if (paymentResult.success != null) {
                  GlobalSnackBar.showSuccess("To'lov muvaffaqiyatli amalga oshirildi");
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
