part of 'barcode_bloc.dart';

abstract class BarcodeEvent {}

class BarcodeScanEvent extends BarcodeEvent {
  final String code;
  BarcodeScanEvent(this.code);
}

class BarcodeResetEvent extends BarcodeEvent {}
