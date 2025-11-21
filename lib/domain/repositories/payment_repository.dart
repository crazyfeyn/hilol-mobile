import 'package:dartz/dartz.dart';

abstract class PaymentRepository {
  Future<Either<String, String>> createPayment(int id, String paymentMethod);

  void dispose();
}