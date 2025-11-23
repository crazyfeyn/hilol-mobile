import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension NumExtention on num {
  double sh(BuildContext context) => MediaQuery.sizeOf(context).height * this;

  double sw(BuildContext context) => MediaQuery.sizeOf(context).width * this;

  Widget hs() {
    return SizedBox(height: toDouble());
  }

  Widget ws() {
    return SizedBox(width: toDouble());
  }


  String formatPrice(String currency) {
    final isSymbol = RegExp(r'^[^\w]+$').hasMatch(currency);

    if (currency.length == 1 || isSymbol) {
      return "$currency$formatNumber";
    } else {
      return "$formatNumber $currency";
    }
  }

  String get formatNumber {
    final formatter = NumberFormat('#,##0', 'en_US');
    final hasDecimal = this % 1 != 0;

    if (hasDecimal) {
      return '${formatter.format(truncate())}.${toStringAsFixed(2).split('.')[1]}';
    } else {
      return formatter.format(toInt());
    }
  }
}

extension StringExtention on String {
  bool get checkingOrderStatusConfirmed {
    return !(["NEW", "WAITING"].contains(toUpperCase()));
  }

  bool get checkingOrderStatusPay {
    return ["NEW", "WAITING", "CONFIRMED", "PAYMENT_CREATED", "PAYMENT_FAILED"].contains(toUpperCase());
  }
}