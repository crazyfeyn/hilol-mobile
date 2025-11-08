import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/data/models/cart_model.dart';
import 'package:commerce_mobile/data/models/order_model.dart';
import 'package:commerce_mobile/data/repositories/address_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_event.dart';
part 'order_state.dart';
part 'order_bloc.freezed.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final AddressRepositoryImpl _repository;
  OrderModel? _lastFailedOrder;
  String? _lastRequestUUID;

  OrderBloc({AddressRepositoryImpl? repository})
    : _repository = repository ?? AddressRepositoryImpl(),
      super(const OrderState()) {
    on<OrderCreateRequested>(_onCreateOrder);
    on<OrderValidationRequested>(_onValidateOrder);
    on<OrderResetRequested>(_onResetOrder);
    on<OrderRetryRequested>(_onRetryOrder);
    // on<OrderReceiverNameChanged>(_onReceiverNameChanged);
    // on<OrderReceiverPhoneChanged>(_onReceiverPhoneChanged);
    // on<OrderReceiverAddressChanged>(_onReceiverAddressChanged);
    // on<OrderAdditionalInfoChanged>(_onAdditionalInfoChanged);
    // on<OrderProductsChanged>(_onProductsChanged);
    // on<OrderTotalCalculated>(_onCalculateTotal);
    on<OrderErrorCleared>(_onClearError);
    on<OrderDisposed>(_onDispose);
  }

  Future<void> _onCreateOrder(
    OrderCreateRequested event,
    Emitter<OrderState> emit,
  ) async {
    emit(
      state.copyWith(
        formzStatus: FormzSubmissionStatus.inProgress,
        isCreatingOrder: true,
        errorMessage: null,
      ),
    );

    _lastFailedOrder = event.orderModel;
    _lastRequestUUID = event.requestUUID;

    final result = await _repository.createOrder(
      orderModel: event.orderModel,
      requestUUID: event.requestUUID,
    );

    result.fold(
      (error) {
        emit(
          state.copyWith(
            formzStatus: FormzSubmissionStatus.failure,
            isCreatingOrder: false,
            errorMessage: error,
            failedOrder: event.orderModel,
          ),
        );
      },
      (orderData) {
        _lastFailedOrder = null;
        _lastRequestUUID = null;
        emit(
          state.copyWith(
            formzStatus: FormzSubmissionStatus.success,
            isCreatingOrder: false,
            orderData: orderData,
            errorMessage: null,
            failedOrder: null,
          ),
        );
      },
    );
  }

  void _onValidateOrder(
    OrderValidationRequested event,
    Emitter<OrderState> emit,
  ) {
    emit(state.copyWith(isValidating: true, errorMessage: null));

    String? validationError;

    // Validate products
    if (event.orderModel.products.isEmpty) {
      validationError = '주문할 상품을 선택해주세요';
    }
    // Validate receiver name
    else if (event.orderModel.receiverName.isEmpty) {
      validationError = '받는 분 이름을 입력해주세요';
    }
    // Validate phone number
    else if (event.orderModel.receiverPhone.isEmpty) {
      validationError = '받는 분 연락처를 입력해주세요';
    }
    // Validate address
    else if (event.orderModel.receiverAddress.isEmpty) {
      validationError = '배송 주소를 입력해주세요';
    }

    if (validationError != null) {
      emit(
        state.copyWith(
          isValidating: false,
          errorMessage: validationError,
          isOrderValid: false,
        ),
      );
    } else {
      emit(
        state.copyWith(
          isValidating: false,
          errorMessage: null,
          isOrderValid: true,
          orderModel: event.orderModel,
          hasProducts: event.orderModel.products.isNotEmpty,
          hasReceiverInfo:
              event.orderModel.receiverName.isNotEmpty &&
              event.orderModel.receiverPhone.isNotEmpty,
          hasAddress: event.orderModel.receiverAddress.isNotEmpty,
        ),
      );
    }
  }

  void _onResetOrder(OrderResetRequested event, Emitter<OrderState> emit) {
    _lastFailedOrder = null;
    _lastRequestUUID = null;
    emit(const OrderState());
  }

  Future<void> _onRetryOrder(
    OrderRetryRequested event,
    Emitter<OrderState> emit,
  ) async {
    if (_lastFailedOrder != null && _lastRequestUUID != null) {
      add(
        OrderEvent.createOrder(
          orderModel: _lastFailedOrder!,
          requestUUID: _lastRequestUUID!,
        ),
      );
    }
  }

  // void _onCalculateTotal(OrderTotalCalculated event, Emitter<OrderState> emit) {
  //   double total = 0.0;
  //   for (var item in event.cartItems) {
  //     total += item.price * item.quantity;
  //   }
  //   emit(
  //     state.copyWith(
  //       totalPrice: total,
  //       currency: event.cartItems.isNotEmpty ? 'KRW' : '',
  //     ),
  //   );
  // }

  void _onClearError(OrderErrorCleared event, Emitter<OrderState> emit) {
    emit(state.copyWith(errorMessage: null));
  }

  void _onDispose(OrderDisposed event, Emitter<OrderState> emit) {
    _repository.dispose();
  }

  @override
  Future<void> close() {
    _repository.dispose();
    return super.close();
  }
}
