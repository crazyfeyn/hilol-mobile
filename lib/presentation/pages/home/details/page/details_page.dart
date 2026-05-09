import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/extension/extensions.dart';
import 'package:commerce_mobile/core/utils/app_colors.dart';
import 'package:commerce_mobile/core/utils/app_styles.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/presentation/pages/cart/cart/page/cart_page.dart';
import 'package:commerce_mobile/presentation/pages/home/details/bloc/details_bloc.dart';
import 'package:commerce_mobile/presentation/pages/home/widget/carusel_images.dart';
import 'package:commerce_mobile/presentation/widgets/custom_elevated_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ProductDetailsPage extends StatelessWidget {
  static const String path = "/product_details_page";

  final Map<String, dynamic> extra;

  const ProductDetailsPage({super.key, required this.extra});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsBloc(extra["product"]),
      child: DetailsPage(extra: extra),
    );
  }
}

class DetailsPage extends StatefulWidget {
  final Map<String, dynamic> extra;

  const DetailsPage({super.key, required this.extra});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  WidgetsBinding get _binding => WidgetsBinding.instance;

  void _initState(_) {
    context.read<DetailsBloc>().add(
      DetailsEnsureInitial(widget.extra["add"] ?? false),
    );
  }

  @override
  void initState() {
    _binding.addPostFrameCallback(_initState);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DetailsBloc>();
    return Scaffold(
      body: BlocBuilder<DetailsBloc, DetailsState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 0.4.sh(context),
                flexibleSpace: FlexibleSpaceBar(
                  background: ImageCarousel(urls: state.product.images ?? []),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                sliver: SliverList.list(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            state.product.localizedTitle ?? "",
                            style: AppStyles.titleXLSemibold,
                          ),
                        ),
                        Text(
                          state.product.price?.formatPrice(
                                state.product.currency ?? "",
                              ) ??
                              "",
                          style: AppStyles.titleLGSemibold.copyWith(
                            color: AppColors.primary600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Divider(),
                    SizedBox(height: 4),
                    Text(
                      context.tr(LocaleKeys.description),
                      style: AppStyles.titleSMSemibold,
                    ),
                    SizedBox(height: 12),
                    HtmlWidget(
                      state.product.localizedDescription ?? "",
                      textStyle: AppStyles.titleXSRegular,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),

      bottomNavigationBar: BlocBuilder<DetailsBloc, DetailsState>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.only(
              top: 8,
              left: 8,
              right: 8,
              bottom: MediaQuery.viewPaddingOf(context).bottom + 8,
            ),
            child: Row(
              spacing: 16,
              children: [
                Expanded(
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: AppColors.white100,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Row(
                      spacing: 12,
                      children: [
                        IconButton(
                          onPressed:
                              (state.cart?.count ?? 0) == 0
                                  ? null
                                  : () => bloc.add(DetailsRemoveProduct()),
                          icon: Icon(Icons.remove),
                        ),
                        Expanded(
                          child: Text(
                            state.cart?.count?.toString() ?? "0",
                            style: AppStyles.titleLGSemibold,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        IconButton(
                          onPressed:
                              (state.cart?.count ?? 0) ==
                                      (state.product.amount ?? 0)
                                  ? null
                                  : () => bloc.add(DetailsAddProduct()),
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CustomElevatedButton(
                    onTap: () => NavigationService.go(context, CartPage.path),
                    title: context.tr(LocaleKeys.to_cart),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
