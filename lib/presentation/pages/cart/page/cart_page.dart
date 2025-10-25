import 'package:commerce_mobile/core/extension/extensions.dart';
import 'package:commerce_mobile/core/utils/app_colors.dart';
import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/core/utils/app_styles.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/presentation/pages/cart/bloc/cart_bloc.dart';
import 'package:commerce_mobile/presentation/pages/cart/page/checkout_page.dart';
import 'package:commerce_mobile/presentation/pages/cart/widget/total_price_cart.dart';
import 'package:commerce_mobile/presentation/widgets/custom_elevated_button.dart';
import 'package:commerce_mobile/presentation/widgets/custom_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  static String path = "/cart_page";

  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => CartBloc(), child: CartView());
  }
}

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  WidgetsBinding get _binding => WidgetsBinding.instance;

  void _initState(_) {
    context.read<CartBloc>().add(CartFetchAllCarts());
  }

  @override
  void initState() {
    _binding.addPostFrameCallback(_initState);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CartBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr(LocaleKeys.nav_cart)),
        actions: [
          IconButton(
            onPressed: () => bloc.add(CartDeleteAllCarts()),
            icon: Icon(CupertinoIcons.delete),
          ),
        ],
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.formzStatus.isInProgress) {
            return Center(child: CircularProgressIndicator());
          }

          if (state.carts.isEmpty) {
            return Center(child: Text(context.tr(LocaleKeys.empty_card_text)));
          }

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemCount: state.carts.length,
                  itemBuilder: (context, index) {
                    final cart = state.carts[index];
                    return Dismissible(
                      key: Key(index.toString()),
                      direction: DismissDirection.endToStart,
                      onDismissed: (v) => bloc.add(CartDeleteById(cart.id)),
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Icon(
                          CupertinoIcons.delete,
                          color: Colors.white,
                        ),
                      ),
                      child: Row(
                        spacing: 8,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CustomNetworkImage(
                              width: 64,
                              height: 64,
                              fit: BoxFit.cover,
                              identity: cart.image,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 12,
                              children: [
                                Text(
                                  cart.title ?? '',
                                  style: AppStyles.titleXSSemibold,
                                ),
                                Text(
                                  cart.price?.formatPrice(
                                        cart.currency ?? "",
                                      ) ??
                                      "",
                                  style: AppStyles.labelMDMedium.copyWith(
                                    color: AppColors.primary500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.white100,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              runAlignment: WrapAlignment.center,
                              alignment: WrapAlignment.center,
                              spacing: 8,
                              children: [
                                IconButton(
                                  onPressed:
                                      () => bloc.add(
                                        CartRemoveCountById(cart.id),
                                      ),
                                  icon: Icon(Icons.remove, size: 16),
                                ),
                                Text(
                                  cart.count?.toString() ?? "0",
                                  style: AppStyles.titleXSRegular.copyWith(
                                    color: AppColors.primary500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                IconButton(
                                  onPressed:
                                      (cart.count ?? 0) == (cart.amount ?? 0)
                                          ? null
                                          : () => bloc.add(
                                            CartAddCountById(cart.id),
                                          ),
                                  icon: Icon(Icons.add, size: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 16),
                ),
                SizedBox(height: 32),
                const DottedLine(
                  dashLength: 6,
                  dashGapLength: 4,
                  dashColor: Colors.grey,
                ),
                SizedBox(height: 20),
                TotalPriceCart(
                  currency: state.carts.first.currency,
                  itemCount: state.carts.length,
                  subtotal: state.subtotal,
                  percent: state.percent,
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Visibility(
            visible: state.carts.isNotEmpty,
            child: Padding(
              padding: EdgeInsets.only(
                top: 8,
                left: 16,
                right: 16,
                bottom: MediaQuery.viewPaddingOf(context).bottom + 8,
              ),
              child: CustomElevatedButton(
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CheckoutPage()),
                    ),
                title: context.tr(LocaleKeys.check_out_btn),
              ),
            ),
          );
        },
      ),
    );
  }
}
