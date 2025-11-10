import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/utils/app_colors.dart';
import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/presentation/pages/my_order/bloc/my_order_bloc.dart';
import 'package:commerce_mobile/presentation/pages/my_order/widget/my_order_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrderPage extends StatelessWidget {
  static const String path = "/my_order_page";

  const MyOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyOrderBloc()..add(MyOrderFetchData()),
      child: MyOrderView(),
    );
  }
}

class MyOrderView extends StatefulWidget {
  const MyOrderView({super.key});

  @override
  State<MyOrderView> createState() => _MyOrderViewState();
}

class _MyOrderViewState extends State<MyOrderView> with RouteAware {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    NavigationService.routeObserver.subscribe(this, ModalRoute.of(context)! as PageRoute);
  }

  @override
  void deactivate() {
    context.read<MyOrderBloc>().add(MyOrderDispose());
    super.deactivate();
  }

  @override
  void dispose() {
    NavigationService.routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    context.read<MyOrderBloc>().add(MyOrderFetchData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrderBloc, MyOrderState>(
      builder: (context, state) {
        final bloc = context.read<MyOrderBloc>();

        return DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: AppColors.black50,
            appBar: AppBar(
              title: Text(context.tr(LocaleKeys.my_orders)),
              bottom: TabBar(
                labelColor: AppColors.primary700,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerHeight: 0,
                tabs: [
                  Tab(text: context.tr(LocaleKeys.current_orders)),
                  Tab(text: context.tr(LocaleKeys.all_orders)),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                if (state.formzStatus.isInProgress)
                  Center(child: CircularProgressIndicator())
                else if (state.newOrders.isEmpty)
                  Center(
                    child: Text(context.tr(LocaleKeys.current_order_empty)),
                  )
                else
                  ListView.separated(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.viewPaddingOf(context).bottom + 12,
                    ),
                    itemCount: state.newOrders.length,
                    itemBuilder: (context, index) {
                      final order = state.newOrders[index];

                      return MyOrderCard(
                        order: order,
                        onDelete: (value) => bloc.add(MyOrderCancel(value)),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 12),
                  ),
                if (state.formzStatus.isInProgress)
                  Center(child: CircularProgressIndicator())
                else if (state.allOrders.isEmpty)
                  Center(child: Text(context.tr(LocaleKeys.all_order_empty)))
                else
                  ListView.separated(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.viewPaddingOf(context).bottom + 12,
                    ),
                    itemCount: state.allOrders.length,
                    itemBuilder: (context, index) {
                      final order = state.allOrders[index];

                      return MyOrderCard(
                        order: order,
                        onDelete: (value) => bloc.add(MyOrderCancel(value)),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 12),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';
//
// class MyOrderPage extends StatefulWidget {
//   static const String path = "/my_order_page";
//
//   const MyOrderPage({super.key});
//
//   @override
//   State<MyOrderPage> createState() => _MyOrderPageState();
// }
//
// class _MyOrderPageState extends State<MyOrderPage> {
//   final List<Map<String, dynamic>> orders = [
//     {
//       'id': 'ORD-2025-001',
//       'date': '9 Nov 2025',
//       'status': 'Delivered',
//       'total': 45.99,
//       'products': [
//         {'name': 'Nike Air Max 270', 'qty': 1, 'price': 25.99},
//         {'name': 'Puma T-Shirt', 'qty': 2, 'price': 10.00},
//       ],
//     },
//     {
//       'id': 'ORD-2025-002',
//       'date': '7 Nov 2025',
//       'status': 'In Progress',
//       'total': 28.50,
//       'products': [
//         {'name': 'Adidas Sneakers', 'qty': 1, 'price': 28.50},
//       ],
//     },
//     {
//       'id': 'ORD-2025-003',
//       'date': '3 Nov 2025',
//       'status': 'Cancelled',
//       'total': 19.75,
//       'products': [
//         {'name': 'Cap', 'qty': 1, 'price': 9.75},
//         {'name': 'Socks', 'qty': 2, 'price': 5.00},
//       ],
//     },
//   ];
//
//   Color getStatusColor(String status) {
//     switch (status) {
//       case 'Delivered':
//         return Colors.green;
//       case 'In Progress':
//         return Colors.orange;
//       case 'Cancelled':
//         return Colors.red;
//       default:
//         return Colors.grey;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'My Orders',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 2,
//       ),
//       body: ListView.separated(
//         physics: const BouncingScrollPhysics(),
//         padding: const EdgeInsets.all(16),
//         itemCount: orders.length,
//         separatorBuilder: (context, index) => const SizedBox(height: 12),
//         itemBuilder: (context, index) {
//           final order = orders[index];
//           return Card(
//             elevation: 3,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // --- Order Info ---
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         order['id'],
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 12, vertical: 6),
//                         decoration: BoxDecoration(
//                           color:
//                           getStatusColor(order['status']).withOpacity(0.1),
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Text(
//                           order['status'],
//                           style: TextStyle(
//                             color: getStatusColor(order['status']),
//                             fontWeight: FontWeight.w600,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     'Date: ${order['date']}',
//                     style: const TextStyle(color: Colors.grey),
//                   ),
//                   const SizedBox(height: 12),
//
//                   // --- Product List ---
//                   const Text(
//                     'Products:',
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold, fontSize: 15),
//                   ),
//                   const SizedBox(height: 8),
//                   ListView.builder(
//                     itemCount: order['products'].length,
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemBuilder: (context, i) {
//                       final product = order['products'][i];
//                       return Container(
//                         margin: const EdgeInsets.only(bottom: 8),
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 12, vertical: 8),
//                         decoration: BoxDecoration(
//                           color: Colors.grey[100],
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               flex: 3,
//                               child: Text(
//                                 product['name'],
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.w600),
//                               ),
//                             ),
//                             Expanded(
//                               flex: 1,
//                               child: Text(
//                                 'x${product['qty']}',
//                                 textAlign: TextAlign.center,
//                                 style: const TextStyle(color: Colors.grey),
//                               ),
//                             ),
//                             Expanded(
//                               flex: 1,
//                               child: Text(
//                                 '\$${product['price']}',
//                                 textAlign: TextAlign.end,
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//
//                   const Divider(height: 24),
//
//                   // --- Total + Button ---
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //   children: [
//                   //     Text(
//                   //       'Total: \$${order['total']}',
//                   //       style: const TextStyle(
//                   //         fontWeight: FontWeight.bold,
//                   //         fontSize: 16,
//                   //       ),
//                   //     ),
//                   //     ElevatedButton.icon(
//                   //       onPressed: () {},
//                   //       icon: const Icon(Icons.replay),
//                   //       label: const Text('Reorder'),
//                   //       style: ElevatedButton.styleFrom(
//                   //         backgroundColor: Colors.blueAccent,
//                   //         shape: RoundedRectangleBorder(
//                   //           borderRadius: BorderRadius.circular(10),
//                   //         ),
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
