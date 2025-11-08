part of 'payment_bloc.dart';

abstract class PaymentEvent {}

class PaymentChangeMethod extends PaymentEvent {
  final PaymentMethod method;

  PaymentChangeMethod(this.method);
}

class PaymentSendRequest extends PaymentEvent {}