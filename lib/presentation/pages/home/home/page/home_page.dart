import 'package:commerce_mobile/core/extension/extensions.dart';
import 'package:commerce_mobile/core/utils/app_assets.dart';
import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/data/models/product_category_model.dart';
import 'package:commerce_mobile/data/models/product_model.dart';
import 'package:commerce_mobile/presentation/pages/home/home/bloc/home_bloc.dart';
import 'package:commerce_mobile/presentation/pages/home/home/widgets/build_banner_widget.dart';
import 'package:commerce_mobile/presentation/pages/home/home/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  static const String path = "/home_page";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc()..add(const HomeEvent.fetchAllProducts()),
      child: const HomeView(),
    );
  }
}

int selectedCategoryIndex = 0;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void deactivate() {
    context.read<HomeBloc>().add(const HomeEvent.dispose());
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.formzStatus.isFailure) {}
      },
      builder: (context, state) {
        final bloc = context.read<HomeBloc>();

        return Scaffold(
          backgroundColor: Colors.grey[50],
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Search here',
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 24,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                  20.hs(),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.9,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 10),
                      enlargeCenterPage: true,
                    ),
                    items: [
                      buildBanner(
                        AppAssets.images.meatImage,
                        "Get Winter Discount",
                        "20% Off",
                        "For Children",
                        Colors.deepPurple,
                      ),
                      buildBanner(
                        null,
                        "Summer Sale\n30% Off",
                        null,
                        null,
                        Colors.pink,
                      ),
                      buildBanner(
                        null,
                        "New Arrivals\nCheck Now!",
                        null,
                        null,
                        Colors.green,
                      ),
                    ],
                  ),
                  20.hs(),

                  // Categories
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Shop by Category',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 100,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            separatorBuilder:
                                (context, index) => const SizedBox(width: 12),
                            itemBuilder: (context, index) {
                              final category = categories[index];
                              final isSelected = selectedCategoryIndex == index;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedCategoryIndex = index;
                                  });
                                  if (category.id == 0) {
                                    bloc.add(
                                      const HomeEvent.fetchAllProducts(),
                                    );
                                  }
                                  // else {
                                  //   bloc.add(
                                  //     HomeEvent.fetchProductByCategory(
                                  //       category.id,
                                  //     ),
                                  //   );
                                  // }
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        color:
                                            isSelected
                                                ? category.color
                                                : Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color:
                                              isSelected
                                                  ? category.color
                                                  : Colors.grey[200]!,
                                          width: 2,
                                        ),
                                      ),
                                      child: Icon(
                                        category.icon,
                                        color:
                                            isSelected
                                                ? Colors.white
                                                : category.color,
                                        size: 28,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      category.name,
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            isSelected
                                                ? category.color
                                                : Colors.grey[600],
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  30.hs(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child:
                        state.formzStatus.isInProgress && state.products.isEmpty
                            ? const Center(child: CircularProgressIndicator())
                            : GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.75,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15,
                                  ),
                              itemCount: state.products.length,
                              itemBuilder: (context, index) {
                                final product = state.products[index];
                                return buildProductCard(product);
                              },
                            ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  final List<ProductCategoryModel> categories = [
    ProductCategoryModel(
      id: 0,
      name: 'All',
      icon: Icons.grid_view,
      color: const Color(0xFF7B68EE),
    ),
    ProductCategoryModel(
      id: 1,
      name: 'Fruits',
      icon: Icons.apple,
      color: const Color(0xFFF59E0B),
    ),

    ProductCategoryModel(
      id: 2,
      name: 'Vegetables',
      icon: Icons.eco,
      color: const Color(0xFF10B981),
    ),
    ProductCategoryModel(
      id: 3,
      name: 'Milk & Dairy',
      icon: Icons.local_drink,
      color: const Color(0xFF3B82F6),
    ),
    ProductCategoryModel(
      id: 4,
      name: 'Meat',
      icon: Icons.restaurant,
      color: const Color(0xFFEF4444),
    ),
    ProductCategoryModel(
      id: 5,
      name: 'Bakery',
      icon: Icons.cake,
      color: const Color(0xFF8B5CF6),
    ),
    ProductCategoryModel(
      id: 6,
      name: 'Snacks',
      icon: Icons.cookie,
      color: const Color(0xFFF97316),
    ),
    ProductCategoryModel(
      id: 7,
      name: 'Beverages',
      icon: Icons.local_cafe,
      color: const Color(0xFF06B6D4),
    ),
  ];
}
