import 'package:commerce_mobile/data/models/barcode_product_model.dart';
import 'package:commerce_mobile/domain/repositories/barcode_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'barcode_event.dart';
part 'barcode_state.dart';

class BarcodeBloc extends Bloc<BarcodeEvent, BarcodeState> {
  final BarcodeRepository barcodeRepository;

  BarcodeBloc({required this.barcodeRepository}) : super(BarcodeInitial()) {
    on<BarcodeScanEvent>(_onScan);
    on<BarcodeResetEvent>(_onReset);
  }

  Future<void> _onScan(
    BarcodeScanEvent event,
    Emitter<BarcodeState> emit,
  ) async {
    emit(BarcodeLoading());
    final result = await barcodeRepository.fetchProductByBarcode(event.code);
    result.fold(
      (error) => emit(BarcodeFailure(error)),
      (product) => emit(BarcodeSuccess(product)),
    );
  }

  void _onReset(BarcodeResetEvent event, Emitter<BarcodeState> emit) {
    emit(BarcodeInitial());
  }

  @override
  Future<void> close() {
    barcodeRepository.dispose();
    return super.close();
  }
}
