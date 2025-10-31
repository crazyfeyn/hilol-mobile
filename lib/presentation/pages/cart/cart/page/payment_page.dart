// import 'package:commerce_mobile/core/extension/extensions.dart';
// import 'package:flutter/material.dart';

// class PaymentPage extends StatefulWidget {
//   static String path = "/payment_page";
//   const PaymentPage({super.key});

//   @override
//   State<PaymentPage> createState() => _PaymentPageState();
// }

// class _PaymentPageState extends State<PaymentPage> {
//   bool isTossSelected = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'Payment',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
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
//                 // Payment Amount
//                 Container(
//                   padding: const EdgeInsets.all(24),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.05),
//                         blurRadius: 10,
//                         offset: const Offset(0, 2),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     children: [
//                       Text(
//                         'Total Amount',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[600],
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       8.hs(),
//                       const Text(
//                         '36002 won',
//                         style: TextStyle(
//                           fontSize: 32,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFF7B68EE),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 24.hs(),

//                 // Payment Method Section
//                 const Text(
//                   'Payment Method',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                 ),
//                 16.hs(),

//                 // Toss Payment Card
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       isTossSelected = !isTossSelected;
//                     });
//                   },
//                   child: AnimatedContainer(
//                     duration: const Duration(milliseconds: 200),
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(
//                         color:
//                             isTossSelected
//                                 ? const Color(0xFF7B68EE)
//                                 : Colors.grey[300]!,
//                         width: isTossSelected ? 2 : 1,
//                       ),
//                       boxShadow: [
//                         BoxShadow(
//                           color:
//                               isTossSelected
//                                   ? const Color(0xFF7B68EE).withOpacity(0.1)
//                                   : Colors.black.withOpacity(0.05),
//                           blurRadius: 10,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: Row(
//                       children: [
//                         // Toss Logo
//                         Container(
//                           width: 56,
//                           height: 56,
//                           decoration: BoxDecoration(
//                             color: const Color(0xFF0064FF),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: const Center(
//                             child: Text(
//                               'toss',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 letterSpacing: -0.5,
//                               ),
//                             ),
//                           ),
//                         ),
//                         16.ws(),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 'Toss Payment',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               4.hs(),
//                               Text(
//                                 'Simple and secure payment',
//                                 style: TextStyle(
//                                   fontSize: 13,
//                                   color: Colors.grey[600],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         // Radio Button
//                         Container(
//                           width: 24,
//                           height: 24,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border: Border.all(
//                               color:
//                                   isTossSelected
//                                       ? const Color(0xFF7B68EE)
//                                       : Colors.grey[400]!,
//                               width: 2,
//                             ),
//                           ),
//                           child:
//                               isTossSelected
//                                   ? Center(
//                                     child: Container(
//                                       width: 14,
//                                       height: 14,
//                                       decoration: const BoxDecoration(
//                                         color: Color(0xFF7B68EE),
//                                         shape: BoxShape.circle,
//                                       ),
//                                     ),
//                                   )
//                                   : null,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 16.hs(),

//                 // Information Note
//                 Container(
//                   padding: const EdgeInsets.all(14),
//                   decoration: BoxDecoration(
//                     color: Colors.blue[50],
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.blue[100]!, width: 1),
//                   ),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Icon(
//                         Icons.info_outline,
//                         color: Colors.blue[700],
//                         size: 20,
//                       ),
//                       10.ws(),
//                       Expanded(
//                         child: Text(
//                           'You will be redirected to Toss Payment to complete your purchase securely.',
//                           style: TextStyle(
//                             fontSize: 13,
//                             color: Colors.blue[900],
//                             height: 1.5,
//                           ),
//                         ),
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
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black,
//                         ),
//                       ),
//                       12.hs(),
//                       _buildSummaryRow('Pepsi x 2', '36000 won'),
//                       8.hs(),
//                       _buildSummaryRow('Delivery Charges', '2 won'),
//                       12.hs(),
//                       Container(height: 1, color: Colors.grey[200]),
//                       12.hs(),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: const [
//                           Text(
//                             'Total',
//                             style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black,
//                             ),
//                           ),
//                           Text(
//                             '36002 won',
//                             style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
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

//           // Pay Now Button
//           Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.05),
//                   blurRadius: 10,
//                   offset: const Offset(0, -2),
//                 ),
//               ],
//             ),
//             child: SizedBox(
//               width: double.infinity,
//               height: 56,
//               child: ElevatedButton(
//                 onPressed:
//                     isTossSelected
//                         ? () {
//                           _showPaymentSuccessDialog(context);
//                         }
//                         : null,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF7B68EE),
//                   disabledBackgroundColor: Colors.grey[300],
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(28),
//                   ),
//                   elevation: 0,
//                 ),
//                 child: Text(
//                   'Pay Now',
//                   style: TextStyle(
//                     color: isTossSelected ? Colors.white : Colors.grey[500],
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

//   void _showPaymentSuccessDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return Dialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(28),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Container(
//                   width: 80,
//                   height: 80,
//                   decoration: BoxDecoration(
//                     color: Colors.green[50],
//                     shape: BoxShape.circle,
//                   ),
//                   child: Icon(
//                     Icons.check_circle,
//                     color: Colors.green[500],
//                     size: 50,
//                   ),
//                 ),
//                 20.hs(),
//                 const Text(
//                   'Payment Successful!',
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 12.hs(),
//                 Text(
//                   'Your order has been placed successfully.',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 15,
//                     color: Colors.grey[600],
//                     height: 1.4,
//                   ),
//                 ),
//                 8.hs(),
//                 Text(
//                   'Order ID: #PEP${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 13,
//                     color: Colors.grey[500],
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 28.hs(),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.of(context).popUntil((route) => route.isFirst);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF7B68EE),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       elevation: 0,
//                     ),
//                     child: const Text(
//                       'Back to Home',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//                 12.hs(),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).popUntil((route) => route.isFirst);
//                   },
//                   child: const Text(
//                     'View Order Details',
//                     style: TextStyle(
//                       color: Color(0xFF7B68EE),
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
