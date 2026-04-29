import 'package:commerce_mobile/core/extension/extensions.dart';
import 'package:commerce_mobile/core/utils/app_constants.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TotalPriceCart extends StatelessWidget {
  final int itemCount;
  final double percent;
  final double subtotal;
  final String? currency;

  const TotalPriceCart({
    super.key,
    required this.itemCount,
    required this.percent,
    required this.subtotal,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    final deliveryFee = AppConstants.fixedDeliveryFeeKrw;
    final totalPrice = subtotal + deliveryFee;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr(LocaleKeys.order_summary),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          16.hs(),
          _buildSummaryRow(context.tr(LocaleKeys.items), itemCount.toString()),
          8.hs(),
          _buildSummaryRow(context.tr(LocaleKeys.subtotal), subtotal.formatPrice(currency ?? "")),
          8.hs(),
          _buildSummaryRow(
            context.tr(LocaleKeys.delivery_charges),
            deliveryFee.formatPrice(currency ?? ""),
          ),
          16.hs(),
          Container(height: 1, color: Colors.grey[200]),
          16.hs(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.tr(LocaleKeys.total),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Text(
                totalPrice.formatPrice(currency ?? ""),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
