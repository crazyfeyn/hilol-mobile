import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/data/models/cart_model.dart';
import 'package:commerce_mobile/data/repositories/cart_repository_impl.dart';
import 'package:easy_localization/easy_localization.dart' as context;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final _repository = CartRepositoryImpl();

  CartBloc() : super(const CartState()) {
    on<CartFetchAllCarts>((event, emit) async {
      FormzSubmissionStatus formzStatus = FormzSubmissionStatus.inProgress;
      emit(state.copyWith(formzStatus: formzStatus));

      List<CartModel> carts = [];
      final result = await _repository.fetchCarts();
      if (result.isRight()) {
        carts = result.getOrElse(
          () => throw Exception(context.tr(LocaleKeys.unexpected_error)),
        );
        formzStatus = FormzSubmissionStatus.success;
      } else {
        formzStatus = FormzSubmissionStatus.failure;
      }

      emit(
        state.copyWith(
          carts: carts,
          subtotal: _onTotalPrice(carts),
          formzStatus: formzStatus,
        ),
      );
    });

    on<CartAddCountById>((event, emit) async {
      List<CartModel> carts = [];
      carts.addAll(state.carts);

      final index = carts.indexWhere((e) => e.id == event.id);
      final oldCart = carts[index];

      final newCart = oldCart.copyWith(count: (oldCart.count ?? 0) + 1);
      final result = await _repository.setOrUpdateCart(newCart);
      if (result.isRight()) {
        final res = result.getOrElse(
          () => throw Exception(context.tr(LocaleKeys.unexpected_error)),
        );
        if (res) carts[index] = newCart;
      }

      emit(state.copyWith(carts: carts, subtotal: _onTotalPrice(carts)));
    });

    on<CartRemoveCountById>((event, emit) async {
      List<CartModel> carts = [];
      carts.addAll(state.carts);

      final index = carts.indexWhere((e) => e.id == event.id);
      final oldCart = carts[index];

      final newCart = oldCart.copyWith(count: (oldCart.count ?? 0) - 1);

      if ((newCart.count ?? 0) > 0) {
        final result = await _repository.setOrUpdateCart(newCart);
        if (result.isRight()) {
          final res = result.getOrElse(
            () => throw Exception(context.tr(LocaleKeys.unexpected_error)),
          );
          if (res) carts[index] = newCart;
        }
      } else {
        final result = await _repository.deleteCart(newCart.id!);
        if (result.isRight()) {
          final res = result.getOrElse(
            () => throw Exception(context.tr(LocaleKeys.unexpected_error)),
          );
          if (res) carts.removeAt(index);
        }
      }

      emit(state.copyWith(carts: carts, subtotal: _onTotalPrice(carts)));
    });

    on<CartDeleteById>((event, emit) async {
      List<CartModel> carts = [];
      carts.addAll(state.carts);
      final index = carts.indexWhere((e) => e.id == event.id);

      final result = await _repository.deleteCart(event.id!);
      if (result.isRight()) {
        final res = result.getOrElse(
          () => throw Exception(context.tr(LocaleKeys.unexpected_error)),
        );
        if (res) carts.removeAt(index);
      }

      emit(state.copyWith(carts: carts));
    });

    on<CartDeleteAllCarts>((event, emit) async {
      final result = await _repository.deleteAllCarts();
      if (result.isRight()) {
        final res = result.getOrElse(
          () => throw Exception(context.tr(LocaleKeys.unexpected_error)),
        );
        if (res) emit(state.copyWith(carts: [], subtotal: 0.0));
      }
    });
  }

  double _onTotalPrice(List<CartModel> others) {
    double totalPrice = 0.0;
    for (var element in others) {
      totalPrice += (element.price ?? 0) * (element.count ?? 0);
    }

    return totalPrice;
  }
}
