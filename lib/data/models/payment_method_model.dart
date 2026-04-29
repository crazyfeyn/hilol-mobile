import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:flutter/cupertino.dart';


class PaymentMethodModel {
  final PaymentMethod method;
  final IconData icon;
  final String title;
  final bool isSoon;

  PaymentMethodModel({required this.method, required this.icon, required this.title, this.isSoon = true});
}