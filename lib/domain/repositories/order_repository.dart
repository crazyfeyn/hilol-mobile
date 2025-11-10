import 'package:commerce_mobile/data/models/order_model.dart';
import 'package:dartz/dartz.dart';

abstract class OrderRepository {
  Future<Either<String, List<OrderData>>> fetchMyOrders();

  Future<Either<String, OrderData>> fetchMyOrder(int id);

  Future<Either<String, bool>> cancelMyOrder(int id);

  void dispose();
}
