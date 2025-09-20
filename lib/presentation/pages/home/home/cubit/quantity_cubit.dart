import 'package:flutter_bloc/flutter_bloc.dart';

class QuantityCubit extends Cubit<int> {
  final int maxQuantity;

  QuantityCubit({this.maxQuantity = 99}) : super(1);

  void increment() {
    if (state < maxQuantity) {
      emit(state + 1);
    }
  }

  void decrement() {
    if (state > 1) {
      emit(state - 1);
    }
  }

  void reset() {
    emit(1);
  }
}
