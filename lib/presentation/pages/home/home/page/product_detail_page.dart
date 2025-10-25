// import 'package:commerce_mobile/core/extension/extensions.dart';
// import 'package:commerce_mobile/core/utils/app_enums.dart';
// import 'package:commerce_mobile/data/models/product_model.dart';
// import 'package:commerce_mobile/presentation/pages/home/home/bloc/home_bloc.dart';
// import 'package:commerce_mobile/presentation/pages/home/home/cubit/quantity_cubit.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class ProductDetailPage extends StatelessWidget {
//   static const String path = "/product_detail";
//   final ProductModel product;
//
//   const ProductDetailPage({super.key, required this.product});
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create:
//               (_) => HomeBloc()..add(HomeEvent.fetchProductById(product.id)),
//         ),
//         BlocProvider(create: (_) => QuantityCubit(maxQuantity: product.amount)),
//       ],
//       child: ProductDetailView(product: product),
//     );
//   }
// }
//
// class ProductDetailView extends StatefulWidget {
//   final ProductModel product;
//
//   const ProductDetailView({super.key, required this.product});
//
//   @override
//   State<ProductDetailView> createState() => _ProductDetailViewState();
// }
//
// class _ProductDetailViewState extends State<ProductDetailView> {
//   int quantity = 1;
//   int selectedImageIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HomeBloc, HomeState>(
//       listener: (context, state) {
//         if (state.formzStatus.isFailure) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(context.tr("failed_to_load")),
//               backgroundColor: Colors.red,
//             ),
//           );
//         }
//       },
//       builder: (context, state) {
//         return Scaffold(
//           backgroundColor: Colors.white,
//           body: CustomScrollView(
//             slivers: [
//               _buildAppBar(context),
//               SliverToBoxAdapter(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _buildProductImages(),
//                     _buildProductInfo(),
//                     _buildDescription(),
//                     _buildQuantitySelector(),
//                     _buildAddToCartSection(context),
//                     20.hs(),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildAppBar(BuildContext context) {
//     return SliverAppBar(
//       expandedHeight: 0,
//       floating: true,
//       pinned: false,
//       backgroundColor: Colors.white,
//       elevation: 0,
//       leading: IconButton(
//         onPressed: () => Navigator.of(context).pop(),
//         icon: Container(
//           padding: const EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             shape: BoxShape.circle,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 blurRadius: 10,
//                 offset: const Offset(0, 2),
//               ),
//             ],
//           ),
//           child: const Icon(
//             Icons.arrow_back_ios,
//             color: Colors.black,
//             size: 18,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildProductImages() {
//     List<String> images = widget.product.images;
//
//     if (images.isEmpty) {
//       return Container(
//         height: 300,
//         width: double.infinity,
//         color: Colors.grey[100],
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.shopping_bag_outlined,
//               size: 80,
//               color: Colors.grey[400],
//             ),
//             10.hs(),
//             Text(
//               context.tr("no_image"),
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey[600],
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//
//     return Column(
//       children: [
//         Container(
//           height: 300,
//           width: double.infinity,
//           color: Colors.grey[50],
//           child: Image.network(
//             images[selectedImageIndex],
//             fit: BoxFit.contain,
//             errorBuilder: (context, error, stackTrace) {
//               return Center(
//                 child: Icon(
//                   Icons.broken_image,
//                   size: 80,
//                   color: Colors.grey[400],
//                 ),
//               );
//             },
//             loadingBuilder: (context, child, loadingProgress) {
//               if (loadingProgress == null) return child;
//               return const Center(child: CircularProgressIndicator());
//             },
//           ),
//         ),
//         if (images.length > 1) ...[
//           15.hs(),
//           Container(
//             height: 80,
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: ListView.separated(
//               scrollDirection: Axis.horizontal,
//               itemCount: images.length,
//               separatorBuilder: (context, index) => 10.ws(),
//               itemBuilder: (context, index) {
//                 final isSelected = selectedImageIndex == index;
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       selectedImageIndex = index;
//                     });
//                   },
//                   child: Container(
//                     width: 80,
//                     height: 80,
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: isSelected ? Colors.blue : Colors.grey[300]!,
//                         width: isSelected ? 2 : 1,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child: Image.network(
//                         images[index],
//                         fit: BoxFit.cover,
//                         errorBuilder: (context, error, stackTrace) {
//                           return Container(
//                             color: Colors.grey[100],
//                             child: Icon(
//                               Icons.broken_image,
//                               color: Colors.grey[400],
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ],
//     );
//   }
//
//   Widget _buildProductInfo() {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             widget.product.brand,
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.grey[600],
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           Text(
//             widget.product.title,
//             style: const TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//           ),
//           10.hs(),
//           Row(
//             children: [
//               Text(
//                 "${widget.product.price.toStringAsFixed(0)} ${widget.product.currency}",
//                 style: const TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue,
//                 ),
//               ),
//               const Spacer(),
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 6,
//                 ),
//                 decoration: BoxDecoration(
//                   color:
//                       widget.product.amount > 0
//                           ? Colors.green[100]
//                           : Colors.red[100],
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Text(
//                   widget.product.amount > 0
//                       ? context
//                           .tr("in_stock")
//                           .replaceAll(
//                             "{count}",
//                             widget.product.amount.toString(),
//                           )
//                       : context.tr("out_of_stock"),
//                   style: TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600,
//                     color:
//                         widget.product.amount > 0
//                             ? Colors.green[700]
//                             : Colors.red[700],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildDescription() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             context.tr("description"),
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//           ),
//           10.hs(),
//           Text(
//             widget.product.description,
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.grey[700],
//               height: 1.5,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildQuantitySelector() {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             context.tr("quantity"),
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//           ),
//           15.hs(),
//           Row(
//             children: [
//               _buildQuantityButton(
//                 icon: Icons.remove,
//                 onPressed: () => context.read<QuantityCubit>().decrement(),
//               ),
//               Container(
//                 width: 60,
//                 height: 45,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey[300]!),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Center(
//                   child: BlocBuilder<QuantityCubit, int>(
//                     builder: (context, quantity) {
//                       return Text(
//                         '$quantity',
//                         style: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//               _buildQuantityButton(
//                 icon: Icons.add,
//                 onPressed: () => context.read<QuantityCubit>().increment(),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildAddToCartSection(BuildContext context) {
//     final isOutOfStock = widget.product.amount <= 0;
//
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 10,
//             offset: const Offset(0, -2),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           BlocBuilder<QuantityCubit, int>(
//             builder: (context, quantity) {
//               final totalPrice = (widget.product.price) * quantity;
//               return Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     context.tr("total_price"),
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   Text(
//                     "${totalPrice.toStringAsFixed(0)} ${widget.product.currency}",
//                     style: const TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//           15.hs(),
//           Row(
//             children: [
//               Expanded(
//                 flex: 2,
//                 child: BlocBuilder<QuantityCubit, int>(
//                   builder: (context, quantity) {
//                     return ElevatedButton(
//                       onPressed:
//                           isOutOfStock
//                               ? null
//                               : () => _addToCart(context, quantity),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor:
//                             isOutOfStock ? Colors.grey : Colors.blue,
//                         foregroundColor: Colors.white,
//                         padding: const EdgeInsets.symmetric(vertical: 15),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         elevation: 0,
//                       ),
//                       child: Text(
//                         isOutOfStock
//                             ? context.tr("out_of_stock")
//                             : context.tr("add_to_cart"),
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               15.ws(),
//               Expanded(
//                 child: BlocBuilder<QuantityCubit, int>(
//                   builder: (context, quantity) {
//                     return OutlinedButton(
//                       onPressed:
//                           isOutOfStock
//                               ? null
//                               : () => _buyNow(context, quantity),
//                       style: OutlinedButton.styleFrom(
//                         foregroundColor:
//                             isOutOfStock ? Colors.grey : Colors.blue,
//                         side: BorderSide(
//                           color: isOutOfStock ? Colors.grey : Colors.blue,
//                           width: 2,
//                         ),
//                         padding: const EdgeInsets.symmetric(vertical: 15),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       child: Text(
//                         context.tr("buy_now"),
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _addToCart(BuildContext context, int quantity) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(
//           context
//               .tr("added_to_cart")
//               .replaceAll("{quantity}", quantity.toString())
//               .replaceAll("{title}", widget.product.title),
//         ),
//         backgroundColor: Colors.green,
//         duration: const Duration(seconds: 2),
//       ),
//     );
//   }
//
//   void _buyNow(BuildContext context, int quantity) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(
//           context
//               .tr("proceed_checkout")
//               .replaceAll("{quantity}", quantity.toString())
//               .replaceAll("{title}", widget.product.title),
//         ),
//         backgroundColor: Colors.blue,
//         duration: const Duration(seconds: 2),
//       ),
//     );
//   }
//
//   Widget _buildQuantityButton({
//     required IconData icon,
//     required VoidCallback onPressed,
//   }) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         width: 45,
//         height: 45,
//         margin: const EdgeInsets.symmetric(horizontal: 10),
//         decoration: BoxDecoration(
//           color: Colors.grey[100],
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(color: Colors.grey[300]!),
//         ),
//         child: Icon(icon, color: Colors.black, size: 20),
//       ),
//     );
//   }
// }
