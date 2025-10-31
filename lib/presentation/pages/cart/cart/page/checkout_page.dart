// import 'package:commerce_mobile/core/extension/extensions.dart';
// import 'package:commerce_mobile/presentation/pages/cart/page/payment_page.dart';
// import 'package:flutter/material.dart';

// class CheckoutPage extends StatelessWidget {
//   static String path = "/checkout_page";
//   const CheckoutPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text('Checkout'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.more_vert, color: Colors.black),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.all(16),
//               children: [
//                 // Delivery Address
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             'Delivery Address',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black,
//                             ),
//                           ),
//                           TextButton(
//                             onPressed: () {},
//                             child: const Text(
//                               'Change',
//                               style: TextStyle(
//                                 color: Color(0xFF7B68EE),
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       8.hs(),
//                       Text(
//                         'Jeonju, Jeollabuk-do',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.grey[800],
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       4.hs(),
//                       Text(
//                         'South Korea',
//                         style: TextStyle(fontSize: 14, color: Colors.grey[600]),
//                       ),
//                     ],
//                   ),
//                 ),
//                 16.hs(),

//                 // Order Items
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Order Items',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black,
//                         ),
//                       ),
//                       16.hs(),
//                       _buildOrderItem(
//                         title: 'Pepsi',
//                         quantity: 2,
//                         price: 36000,
//                       ),
//                     ],
//                   ),
//                 ),
//                 16.hs(),

//                 // Order Summary
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Order Summary',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black,
//                         ),
//                       ),
//                       16.hs(),
//                       _buildSummaryRow('Subtotal', '36000 won'),
//                       8.hs(),
//                       _buildSummaryRow('Delivery Charges', '2 won'),
//                       16.hs(),
//                       Container(height: 1, color: Colors.grey[200]),
//                       16.hs(),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: const [
//                           Text(
//                             'Total',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black,
//                             ),
//                           ),
//                           Text(
//                             '36002 won',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               color: Color(0xFF7B68EE),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // Proceed to Payment Button
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: SizedBox(
//               width: double.infinity,
//               height: 56,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const PaymentPage(),
//                     ),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF7B68EE),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(28),
//                   ),
//                   elevation: 0,
//                 ),
//                 child: const Text(
//                   'Proceed to Payment',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildOrderItem({
//     required String title,
//     required int quantity,
//     required int price,
//   }) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           '$title x $quantity',
//           style: TextStyle(fontSize: 14, color: Colors.grey[800]),
//         ),
//         Text(
//           '$price won',
//           style: const TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//             color: Colors.black,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildSummaryRow(String label, String value) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
//         Text(
//           value,
//           style: const TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//             color: Colors.black,
//           ),
//         ),
//       ],
//     );
//   }
// }
