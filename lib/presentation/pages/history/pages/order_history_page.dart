// import 'package:commerce_mobile/data/models/order_model.dart';
// import 'package:flutter/material.dart';

// // Order History Page
// class OrderHistoryPage extends StatelessWidget {
//   static String path = "/order_history_page";
//   const OrderHistoryPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Order History'), centerTitle: true),
//       body: Center(child: Text('Empty')),
//       // body: ListView.separated(
//       //   padding: const EdgeInsets.all(16),
//       //   itemCount: _mockOrders.length,
//       //   separatorBuilder: (context, index) => 16.hs(),
//       //   itemBuilder: (context, index) {
//       //     final order = _mockOrders[index];
//       //     return buildOrderCard(context, order);
//       //   },
//       // ),
//     );
//   }
// }

// // Mock Data
// final List<OrderModel> _mockOrders = [
//   OrderModel(
//     id: '2024001',
//     date: 'Aug 25, 2025',
//     total: 1299.99,
//     paymentMethod: 'Credit Card',
//     cardLastFour: '4532',
//     cardType: 'Visa',
//     deliveryAddress: DeliveryAddress(
//       name: 'John Smith',
//       phone: '+1 (555) 123-4567',
//       street: '123 Main Street, Apt 4B',
//       city: 'New York',
//       postalCode: '10001',
//       country: 'USA',
//     ),
//     products: [
//       OrderProductModel(
//         name: 'iPhone 15 Pro',
//         brand: 'Apple',
//         price: 999.99,
//         quantity: 1,
//         imagePath: 'assets/iphone.jpg',
//         nickname: 'My Daily Driver',
//       ),
//       OrderProductModel(
//         name: 'AirPods Pro',
//         brand: 'Apple',
//         price: 249.99,
//         quantity: 1,
//         imagePath: 'assets/airpods.jpg',
//         nickname: 'Music Companion',
//       ),
//       OrderProductModel(
//         name: 'Phone Case',
//         brand: 'OtterBox',
//         price: 49.99,
//         quantity: 1,
//         imagePath: 'assets/case.jpg',
//         nickname: 'Phone Protector',
//       ),
//     ],
//   ),
//   OrderModel(
//     id: '2024002',
//     date: 'Aug 20, 2025',
//     total: 899.99,
//     paymentMethod: 'Credit Card',
//     cardLastFour: '7890',
//     cardType: 'Mastercard',
//     deliveryAddress: DeliveryAddress(
//       name: 'John Smith',
//       phone: '+1 (555) 123-4567',
//       street: '123 Main Street, Apt 4B',
//       city: 'New York',
//       postalCode: '10001',
//       country: 'USA',
//     ),
//     products: [
//       OrderProductModel(
//         name: 'MacBook Air M3',
//         brand: 'Apple',
//         price: 899.99,
//         quantity: 1,
//         imagePath: 'assets/macbook.jpg',
//         nickname: 'Work Beast',
//       ),
//     ],
//   ),
//   OrderModel(
//     id: '2024003',
//     date: 'Aug 15, 2025',
//     total: 299.98,
//     paymentMethod: 'Debit Card',
//     cardLastFour: '1234',
//     cardType: 'Visa Debit',
//     deliveryAddress: DeliveryAddress(
//       name: 'John Smith',
//       phone: '+1 (555) 123-4567',
//       street: '456 Oak Avenue',
//       city: 'Brooklyn',
//       postalCode: '11201',
//       country: 'USA',
//     ),
//     products: [
//       OrderProductModel(
//         name: 'Wireless Mouse',
//         brand: 'Logitech',
//         price: 79.99,
//         quantity: 1,
//         imagePath: 'assets/mouse.jpg',
//         nickname: 'Click Master',
//       ),
//       OrderProductModel(
//         name: 'Mechanical Keyboard',
//         brand: 'Keychron',
//         price: 219.99,
//         quantity: 1,
//         imagePath: 'assets/keyboard.jpg',
//         nickname: 'Typing Machine',
//       ),
//     ],
//   ),
// ];
