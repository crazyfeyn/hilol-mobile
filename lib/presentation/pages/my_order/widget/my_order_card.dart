import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/utils/app_colors.dart';
import 'package:commerce_mobile/core/utils/app_snackbar.dart';
import 'package:commerce_mobile/core/utils/app_styles.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/data/models/order_model.dart';
import 'package:commerce_mobile/presentation/pages/payment/page/payment_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyOrderCard extends StatefulWidget {
  final OrderData order;
  final Function(int)? onDelete;

  const MyOrderCard({super.key, required this.order, this.onDelete});

  @override
  State<MyOrderCard> createState() => _MyOrderCardState();
}

class _MyOrderCardState extends State<MyOrderCard> {
  late OrderData order;
  bool isShow = false;

  @override
  void initState() {
    order = widget.order;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MyOrderCard oldWidget) {
    order = widget.order;
    if (mounted) setState(() {});
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final isNew = order.orderStatus.toUpperCase() == "NEW";
    return Container(
      color: AppColors.white50,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  style: AppStyles.titleSMSemibold.copyWith(
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(text: context.tr(LocaleKeys.order_number, args: [order.orderId.toString()])),
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: order.orderId.toString()));
                          GlobalSnackBar.showSuccess(context.tr(LocaleKeys.success_clipboard));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Icon(
                            Icons.copy,
                            size: 16,
                            color: AppColors.primary700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: getStatusColor(
                    order.orderStatus,
                  ).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  getStatusName(context, order.orderStatus),
                  style: AppStyles.labelMDRegular,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          infoWidget("${context.tr(LocaleKeys.phone_number)}:", order.receiverPhone),
          SizedBox(height: 16),
          infoWidget("${context.tr(LocaleKeys.receiver_name)}:", order.receiverName),
          SizedBox(height: 16),
          infoWidget("${context.tr(LocaleKeys.address_title)}:", order.receiverAddress),
          SizedBox(height: 16),
          infoWidget("${context.tr(LocaleKeys.total_price)}:", order.totalPrice.toString()),
          if(isNew)
            ...[
              SizedBox(height: 32),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => widget.onDelete?.call(order.orderId),
                  child: RichText(
                    text: TextSpan(
                      style: AppStyles.titleXSMedium.copyWith(
                        color: AppColors.primary600,
                      ),
                      children: [
                        WidgetSpan(
                          child: Icon(
                            CupertinoIcons.delete,
                            size: 16,
                            color: AppColors.primary600,
                          ),
                        ),
                        TextSpan(text: "Buyurtmani bekor qilish"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          SizedBox(height: 8),
          Divider(),
          Column(
            spacing: 8,
            children: [
              if (isShow)
                ...List.generate(order.products.length, (i) {
                  final product = order.products[i];
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      spacing: 12,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            product.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          'x${product.amount}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        Text(
                          '${product.price}',
                          textAlign: TextAlign.end,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (isNew)
                    GestureDetector(
                      onTap: () => NavigationService.push(context, PaymentPage.path, extra: order),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary500,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          context.tr(LocaleKeys.payment_btn),
                          style: AppStyles.titleSMMedium.copyWith(
                            color: AppColors.white50,
                          ),
                        ),
                      ),
                    ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isShow = !isShow),
                      child: Text(
                        isShow ? context.tr(LocaleKeys.lockdown) : context.tr(LocaleKeys.show_product),
                        style: AppStyles.titleSMMedium.copyWith(
                          color: AppColors.primary600,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget infoWidget(String title, String prompt) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Expanded(
          child: Text(prompt, textAlign: TextAlign.end),
        ),
      ],
    );
  }

  Color getStatusColor(String status) {
    switch (status.toUpperCase()) {
      case 'NEW':
        return Colors.orange;
      case 'WAITING':
        return Colors.amber;
      case 'CONFIRMED':
        return Colors.blue;
      case 'CANCELLED':
        return Colors.red;
      case 'PAYMENT_CREATED':
        return Colors.indigo;
      case 'PAYMENT_FAILED':
        return Colors.redAccent;
      case 'PAYMENT_PENDING':
        return Colors.orangeAccent;
      case 'PAYMENT_SUCCEEDED':
        return Colors.green;
      case 'DELIVERED':
        return Colors.teal;
      case 'COMPLETED':
        return Colors.greenAccent;
      default:
        return Colors.grey;
    }
  }

  String getStatusName(BuildContext context, String status) {
    switch (status.toUpperCase()) {
      case 'NEW':
        return context.tr(LocaleKeys.new_status);
      case 'WAITING':
        return context.tr(LocaleKeys.waiting_status);
      case 'CONFIRMED':
        return context.tr(LocaleKeys.confirmed_status);
      case 'CANCELLED':
        return context.tr(LocaleKeys.cancelled_status);
      case 'PAYMENT_CREATED':
        return context.tr(LocaleKeys.payment_created_status);
      case 'PAYMENT_FAILED':
        return context.tr(LocaleKeys.payment_failed_status);
      case 'PAYMENT_PENDING':
        return context.tr(LocaleKeys.payment_pending_status);
      case 'PAYMENT_SUCCEEDED':
        return context.tr(LocaleKeys.payment_succeeded_status);
      case 'DELIVERED':
        return context.tr(LocaleKeys.delivered_status);
      default:
        return context.tr(LocaleKeys.completed_status);
    }
  }
}
