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
  //? Whether the order should show payment options (not terminal, not already paid)
  bool get checkingOrderStatusPay {
    return toUpperCase() == 'PROCESSING';
  }

  bool get isCancellable {
    return toUpperCase() == 'PROCESSING';
  }

  /// True when [PUT /api/v1/order/confirm] is not needed before [POST /api/v1/payment/create].
  /// `NEW` (and optional `WAITING`) must call confirm first; the old logic treated `NEW` as
  /// confirmed because it was "not PROCESSING/UPDATED", which caused 400 Order must be confirmed.
  bool get checkingOrderStatusConfirmed {
    final s = toUpperCase();
    if (s == 'NEW' || s == 'WAITING') return false;
    return true;
  }
}
