part of 'barcode_bloc.dart';

abstract class BarcodeState {}

class BarcodeInitial extends BarcodeState {}

class BarcodeLoading extends BarcodeState {}

class BarcodeSuccess extends BarcodeState {
  final BarcodeProductModel product;
  BarcodeSuccess(this.product);
}

class BarcodeFailure extends BarcodeState {
  final String message;
  BarcodeFailure(this.message);
}
