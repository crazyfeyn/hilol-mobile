import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/services/home_refresh_service.dart';
import 'package:commerce_mobile/core/services/session_service.dart';
import 'package:commerce_mobile/core/utils/app_colors.dart';
import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/presentation/pages/home/home/bloc/home_bloc.dart';
import 'package:commerce_mobile/presentation/pages/auth/sign_in/page/sign_in_page.dart';
import 'package:commerce_mobile/presentation/pages/home/home/widget/category_section_card.dart';
import 'package:commerce_mobile/presentation/pages/home/home/widget/product_card.dart';
import 'package:commerce_mobile/presentation/widgets/custom_shimmer.dart';
import 'package:commerce_mobile/presentation/widgets/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  static const String path = "/home_page";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => HomeBloc(), child: HomeView());
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin {
  static const _scrollStorageKey = PageStorageKey<String>(
    'home_products_scroll',
  );
  final controller = TextEditingController();
  final focusNode = FocusNode();
  final scrollController = ScrollController();

  WidgetsBinding get _binding => WidgetsBinding.instance;

  @override
  bool get wantKeepAlive => true;

  void _handleHomeReselected() {
    if (!mounted) return;
    focusNode.unfocus();
    if (controller.text.isNotEmpty) {
      controller.clear(); // Resets UI (category section) back to default.
    }
    context.read<HomeBloc>().add(
      HomeRefreshAll(),
    ); // Force refresh (categories + products)
  }

  void _initState(_) {
    final bloc = context.read<HomeBloc>();
    final s = bloc.state;

    // Only hit the network if we don't have cached data.
    if (s.categories.isEmpty) {
      bloc.add(HomeFetchCategories());
    }
    if (s.products.isEmpty) {
      bloc.add(HomeFetchProducts(null));
    }
  }

  @override
  void initState() {
    _binding.addPostFrameCallback(_initState);
    focusNode.addListener(() => setState(() {}));
    controller.addListener(() => setState(() {}));
    HomeRefreshService.homeReselected.addListener(_handleHomeReselected);
    super.initState();
  }

  @override
  void dispose() {
    HomeRefreshService.homeReselected.removeListener(_handleHomeReselected);
    controller.dispose();
    focusNode.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final bloc = context.read<HomeBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomTextField(
            ctr: controller,
            focusNode: focusNode,
            hintText: context.tr(LocaleKeys.search_here),
            prefixIcon: CupertinoIcons.search,
            onChanged: (text) => bloc.add(HomeSearchProducts(text)),
          ),
        ),
        actions: [
          ValueListenableBuilder<bool>(
            valueListenable: SessionService.authStateNotifier,
            builder: (context, isAuthenticated, _) {
              if (isAuthenticated) return const SizedBox.shrink();
              return TextButton.icon(
                onPressed:
                    () => NavigationService.push(context, SignInPage.path),
                icon: const Icon(CupertinoIcons.person_crop_circle),
                label: Text(context.tr(LocaleKeys.login_btn)),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return CustomScrollView(
            key: _scrollStorageKey,
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 16)),
              if (!focusNode.hasFocus && controller.text.isEmpty) ...[
                SliverToBoxAdapter(child: SizedBox(height: 24)),
                SliverToBoxAdapter(
                  child: CategorySectionCard(
                    isLoading: state.categoryStatus.isInProgress,
                    categories: state.categories,
                    value: state.selectCategoryId,
                    onChanged: (value) => bloc.add(HomeFetchProducts(value)),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 12)),
              ],

              if (state.productStatus.isInProgress)
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CustomShimmer(
                          child: Container(color: AppColors.white100),
                        ),
                      );
                    }, childCount: 12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.7,
                        ),
                  ),
                )
              else
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return ProductCard(product: state.products[index]);
                    }, childCount: state.products.length),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.7,
                        ),
                  ),
                ),

              SliverToBoxAdapter(child: SizedBox(height: 16)),
            ],
          );
        },
      ),
    );
  }
}
