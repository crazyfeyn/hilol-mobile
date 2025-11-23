import 'package:dartz/dartz.dart';

abstract class PaymentRepository {
  Future<Either<String, String>> createPayment(int id, String paymentMethod);

  Future<Either<String, bool>> confirmOrder(int id);

  void dispose();
}