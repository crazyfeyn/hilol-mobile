// import 'package:commerce_mobile/core/extension/extensions.dart';
// import 'package:commerce_mobile/core/utils/app_assets.dart';
// import 'package:commerce_mobile/core/utils/app_enums.dart';
// import 'package:commerce_mobile/data/models/product_category_model.dart';
// import 'package:commerce_mobile/presentation/pages/home/home/bloc/home_bloc.dart';
// import 'package:commerce_mobile/presentation/pages/home/home/widgets/build_banner_widget.dart';
// import 'package:commerce_mobile/presentation/pages/home/home/widgets/product_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:carousel_slider/carousel_slider.dart';
//
// class HomePage extends StatelessWidget {
//   static const String path = "/home_page";
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create:
//           (_) =>
//               HomeBloc()
//                 ..add(const HomeEvent.fetchAllProducts())
//                 ..add(const HomeEvent.fetchAllProductCategories()),
//       child: const HomeView(),
//     );
//   }
// }
//
// class HomeView extends StatefulWidget {
//   const HomeView({super.key});
//
//   @override
//   State<HomeView> createState() => _HomeViewState();
// }
//
// class _HomeViewState extends State<HomeView> {
//   int selectedCategoryIndex = 0;
//
//   @override
//   void deactivate() {
//     context.read<HomeBloc>().add(const HomeEvent.dispose());
//     super.deactivate();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HomeBloc, HomeState>(
//       listener: (context, state) {
//         if (state.formzStatus.isFailure) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('Failed to load data'),
//               backgroundColor: Colors.red,
//             ),
//           );
//         }
//       },
//       builder: (context, state) {
//         final bloc = context.read<HomeBloc>();
//
//         return Scaffold(
//           backgroundColor: Colors.grey[50],
//           body: SafeArea(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   // Search Bar
//                   Container(
//                     margin: const EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 10,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.1),
//                           spreadRadius: 1,
//                           blurRadius: 10,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: const TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Search here',
//                         prefixIcon: Icon(
//                           Icons.search,
//                           color: Colors.grey,
//                           size: 24,
//                         ),
//                         border: InputBorder.none,
//                         contentPadding: EdgeInsets.symmetric(vertical: 15),
//                       ),
//                     ),
//                   ),
//                   20.hs(),
//
//                   // Carousel Banner
//                   CarouselSlider(
//                     options: CarouselOptions(
//                       height: 200,
//                       aspectRatio: 16 / 9,
//                       viewportFraction: 0.9,
//                       autoPlay: true,
//                       autoPlayInterval: const Duration(seconds: 10),
//                       enlargeCenterPage: true,
//                     ),
//                     items: [
//                       buildBanner(
//                         AppAssets.images.meatImage,
//                         "Get Winter Discount",
//                         "20% Off",
//                         "For Children",
//                         Colors.deepPurple,
//                       ),
//                       buildBanner(
//                         null,
//                         "Summer Sale\n30% Off",
//                         null,
//                         null,
//                         Colors.pink,
//                       ),
//                       buildBanner(
//                         null,
//                         "New Arrivals\nCheck Now!",
//                         null,
//                         null,
//                         Colors.green,
//                       ),
//                     ],
//                   ),
//                   20.hs(),
//
//                   // Categories Section
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'Shop by Category',
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         _buildCategoriesSection(state, bloc),
//                       ],
//                     ),
//                   ),
//                   30.hs(),
//
//                   // Products Grid
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: _buildProductsGrid(state),
//                   ),
//                   const SizedBox(height: 20),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildCategoriesSection(HomeState state, HomeBloc bloc) {
//     if (state.categories.isEmpty && state.formzStatus.isInProgress) {
//       return const SizedBox(
//         height: 100,
//         child: Center(child: CircularProgressIndicator()),
//       );
//     }
//
//     if (state.categories.isEmpty) {
//       return SizedBox(
//         height: 100,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'No categories available',
//                 style: TextStyle(color: Colors.grey[600]),
//               ),
//               const SizedBox(height: 8),
//               TextButton(
//                 onPressed:
//                     () => bloc.add(const HomeEvent.fetchAllProductCategories()),
//                 child: const Text('Retry'),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//
//     // Combine "All" category with API categories
//     final allCategories = [
//       ProductCategoryModel(
//         id: 0,
//         title: 'All',
//         description: 'All products',
//         imageIdentity: '',
//       ),
//       ...state.categories,
//     ];
//
//     return SizedBox(
//       height: 100,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemCount: allCategories.length,
//         separatorBuilder: (context, index) => const SizedBox(width: 12),
//         itemBuilder: (context, index) {
//           final category = allCategories[index];
//           final isSelected = selectedCategoryIndex == index;
//
//           return GestureDetector(
//             onTap: () {
//               selectedCategoryIndex = index;
//
//               if (category.id == 0) {
//                 bloc.add(HomeEvent.fetchAllProducts());
//               } else {
//                 bloc.add(HomeEvent.fetchProductByCategory(category.id));
//               }
//             },
//             child: _buildCategoryItem(category, isSelected),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildCategoryItem(ProductCategoryModel category, bool isSelected) {
//     // Get default values for icon and color since your API model might not have them
//     final defaultIcon = _getDefaultIcon(category.title);
//     final defaultColor = _getDefaultColor(category.title);
//
//     return Column(
//       children: [
//         Container(
//           width: 70,
//           height: 70,
//           decoration: BoxDecoration(
//             color: isSelected ? defaultColor : Colors.white,
//             borderRadius: BorderRadius.circular(20),
//             border: Border.all(
//               color: isSelected ? defaultColor : Colors.grey[200]!,
//               width: 2,
//             ),
//           ),
//           child: Icon(
//             defaultIcon,
//             color: isSelected ? Colors.white : defaultColor,
//             size: 28,
//           ),
//         ),
//         const SizedBox(height: 8),
//         SizedBox(
//           width: 70,
//           child: Text(
//             category.title,
//             style: TextStyle(
//               fontSize: 10,
//               fontWeight: FontWeight.w500,
//               color: isSelected ? defaultColor : Colors.grey[600],
//             ),
//             textAlign: TextAlign.center,
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildProductsGrid(HomeState state) {
//     if (state.formzStatus.isInProgress && state.products.isEmpty) {
//       return const SizedBox(
//         height: 200,
//         child: Center(child: CircularProgressIndicator()),
//       );
//     }
//
//     if (state.products.isEmpty) {
//       return SizedBox(
//         height: 200,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 Icons.shopping_bag_outlined,
//                 size: 64,
//                 color: Colors.grey[400],
//               ),
//               const SizedBox(height: 16),
//               Text(
//                 'No products found',
//                 style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 0.75,
//         crossAxisSpacing: 15,
//         mainAxisSpacing: 15,
//       ),
//       itemCount: state.products.length,
//       itemBuilder: (context, index) {
//         final product = state.products[index];
//         return buildProductCard(product);
//       },
//     );
//   }
//
//   // Helper methods to provide default icons and colors for categories
//   IconData _getDefaultIcon(String categoryTitle) {
//     final title = categoryTitle.toLowerCase();
//     if (title.contains('all')) return Icons.grid_view;
//     if (title.contains('fruit')) return Icons.apple;
//     if (title.contains('vegetable')) return Icons.eco;
//     if (title.contains('dairy') || title.contains('milk')) {
//       return Icons.local_drink;
//     }
//     if (title.contains('meat')) return Icons.restaurant;
//     if (title.contains('bakery') || title.contains('bread')) return Icons.cake;
//     if (title.contains('snack')) return Icons.cookie;
//     if (title.contains('beverage') || title.contains('drink')) {
//       return Icons.local_cafe;
//     }
//     return Icons.category; // Default icon
//   }
//
//   Color _getDefaultColor(String categoryTitle) {
//     final title = categoryTitle.toLowerCase();
//     if (title.contains('all')) return const Color(0xFF7B68EE);
//     if (title.contains('fruit')) return const Color(0xFFF59E0B);
//     if (title.contains('vegetable')) return const Color(0xFF10B981);
//     if (title.contains('dairy') || title.contains('milk')) {
//       return const Color(0xFF3B82F6);
//     }
//     if (title.contains('meat')) return const Color(0xFFEF4444);
//     if (title.contains('bakery') || title.contains('bread')) {
//       return const Color(0xFF8B5CF6);
//     }
//     if (title.contains('snack')) return const Color(0xFFF97316);
//     if (title.contains('beverage') || title.contains('drink')) {
//       return const Color(0xFF06B6D4);
//     }
//     return const Color(0xFF6B7280); // Default color
//   }
// }

import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/services/session_service.dart';
import 'package:commerce_mobile/core/utils/app_colors.dart';
import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/presentation/pages/home/home/bloc/home_bloc.dart';
import 'package:commerce_mobile/presentation/pages/auth/sign_in/page/sign_in_page.dart';
import 'package:commerce_mobile/presentation/pages/home/home/widget/banner_widget_card.dart';
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

class _HomeViewState extends State<HomeView> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  WidgetsBinding get _binding => WidgetsBinding.instance;

  void _initState(_) {
    context.read<HomeBloc>().add(HomeFetchCategories());
    context.read<HomeBloc>().add(HomeFetchProducts(null));
  }

  @override
  void initState() {
    _binding.addPostFrameCallback(_initState);
    focusNode.addListener(() => setState(() {}));
    controller.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void deactivate() {
    context.read<HomeBloc>().add(HomeDispose());
    controller.dispose();
    focusNode.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
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
                onPressed: () =>
                    NavigationService.push(context, SignInPage.path),
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
