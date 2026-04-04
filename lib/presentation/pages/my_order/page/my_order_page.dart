import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/extension/extensions.dart';
import 'package:commerce_mobile/core/utils/app_colors.dart';
import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/core/utils/app_snackbar.dart';
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
    NavigationService.routeObserver.subscribe(
      this,
      ModalRoute.of(context)! as PageRoute,
    );
  }

  @override
  void dispose() {
    NavigationService.routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    // Refresh data when returning from payment page
    context.read<MyOrderBloc>().add(MyOrderFetchData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyOrderBloc, MyOrderState>(
      listener: (context, state) {
        if (state.formzStatus == FormzSubmissionStatus.failure) {
          GlobalSnackBar.showError(
            context.tr("LocaleKeys.error_loading_orders"),
          );
        }
      },
      builder: (context, state) {
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
                // Current orders tab
                state.formzStatus.isInProgress
                    ? const Center(child: CircularProgressIndicator())
                    : state.newOrders.isEmpty
                    ? Center(
                      child: Text(context.tr(LocaleKeys.current_order_empty)),
                    )
                    : ListView.separated(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.viewPaddingOf(context).bottom + 12,
                      ),
                      itemCount: state.newOrders.length,
                      itemBuilder: (context, index) {
                        final order = state.newOrders[index];
                        return MyOrderCard(order: order);
                      },
                      separatorBuilder:
                          (context, index) => const SizedBox(height: 12),
                    ),
                // All orders tab
                state.formzStatus.isInProgress
                    ? const Center(child: CircularProgressIndicator())
                    : state.allOrders.isEmpty
                    ? Center(
                      child: Text(context.tr(LocaleKeys.all_order_empty)),
                    )
                    : ListView.separated(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.viewPaddingOf(context).bottom + 12,
                      ),
                      itemCount: state.allOrders.length,
                      itemBuilder: (context, index) {
                        final order = state.allOrders[index];
                        return MyOrderCard(order: order);
                      },
                      separatorBuilder:
                          (context, index) => const SizedBox(height: 12),
                    ),
              ],
            ),
          ),
        );
      },
    );
  }
}
