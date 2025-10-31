import 'package:commerce_mobile/core/utils/app_colors.dart';
import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/core/utils/app_styles.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/data/models/cart_model.dart';
import 'package:commerce_mobile/presentation/pages/cart/payment/bloc/payment_bloc.dart';
import 'package:commerce_mobile/presentation/pages/cart/payment/widget/toss_pay_bottom-sheet.dart';
import 'package:commerce_mobile/presentation/widgets/custom_elevated_button.dart';
import 'package:commerce_mobile/presentation/widgets/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentPage extends StatelessWidget {
  static const String path = "/payment-page";

  final Map<String, dynamic> extra;

  const PaymentPage({super.key, required this.extra});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentBloc(extra),
      child: PaymentView(),
    );
  }
}

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  final _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        final bloc = context.read<PaymentBloc>();

        return Scaffold(
          appBar: AppBar(title: Text(context.tr(LocaleKeys.payment))),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              spacing: 20,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr(LocaleKeys.deliver_address),
                      style: AppStyles.titleLGSemibold,
                    ),
                    ListTile(
                      dense: true,
                      minLeadingWidth: 0,
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(CupertinoIcons.location, size: 20),
                      title: Text(
                        state.address.receiverName ?? "",
                        style: AppStyles.titleSMMedium,
                      ),
                      subtitle: Text(
                        state.address.address ?? "",
                        style: AppStyles.bodySMRegular.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ),

                    SizedBox(height: 12),
                    CustomTextField(
                      title: context.tr(LocaleKeys.comment_title),
                      hintText: context.tr(LocaleKeys.comment_hint),
                      ctr: _commentController,
                      minLines: 2,
                      maxLines: null,
                    ),
                  ],
                ),
                Column(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr(LocaleKeys.payment_type),
                      style: AppStyles.titleLGSemibold,
                    ),
                    SizedBox(
                      height: 72,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.methods.length,
                        itemBuilder: (context, index) {
                          final method = state.methods[index];
                          final isSelect = state.method == method.method;
                          return GestureDetector(
                            onTap: () {
                              if(method.isSoon) return;
                              bloc.add(PaymentChangeMethod(method.method));
                            },
                            child: Container(
                              height: 72,
                              width: 128,
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8,),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(width: 1, color: isSelect ? AppColors.primary600 : Colors.grey),
                              ),
                              child: Column(
                                spacing: 4,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(method.icon),
                                        if(method.isSoon)
                                          Text(context.tr(LocaleKeys.soon), style: AppStyles.labelSmRegular.copyWith(color: AppColors.black400)),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    context.tr(method.title),
                                    style: AppStyles.labelLGMedium,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(width: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
              top: 8,
              left: 16,
              right: 16,
              bottom: MediaQuery.viewPaddingOf(context).bottom + 8,
            ),
            child: CustomElevatedButton(
              onTap: () async {
                if(state.method == PaymentMethod.tossBank) {
                  TossPayBottomSheet.bottomSheet(context, _onTotalPrice(state.carts));
                }
              },
              title: context.tr(LocaleKeys.order_btn),
            ),
          ),
        );
      },
    );
  }

  double _onTotalPrice(List<CartModel> others) {
    double totalPrice = 0.0;
    for(var element in others) {
      totalPrice += (element.price ?? 0) * (element.count ?? 0);
    }

    return totalPrice;
  }
}

