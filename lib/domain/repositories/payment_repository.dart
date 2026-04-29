import 'package:dartz/dartz.dart';
import 'package:commerce_mobile/data/models/payment_model.dart';

abstract class PaymentRepository {
  Future<Either<String, CreatePaymentData>> createPayment(
    int id,
    String paymentMethod,
  );

  Future<Either<String, bool>> confirmOrder(int id);

  void dispose();
}