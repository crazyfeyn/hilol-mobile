import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/data/models/cart_model.dart';
import 'package:commerce_mobile/data/models/product_model.dart';
import 'package:commerce_mobile/data/repositories/cart_repository_impl.dart';
import 'package:commerce_mobile/data/repositories/product_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'details_event.dart';
part 'details_state.dart';
part 'details_bloc.freezed.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final _productRepository = ProductRepositoryImpl();
  final _repository = CartRepositoryImpl();

  DetailsBloc(ProductModel product) : super(DetailsState(product: product)) {
    on<DetailsEnsureInitial>((event, emit) async {
      if(state.product.id == null) return;
      CartModel? cart;
      final res = await _fetchCartById(state.product.id!);
      if(event.isAdd) {
        cart = await _addCart(res);
      } else {
        cart = res;
      }

      FormzSubmissionStatus formzStatus = FormzSubmissionStatus.inProgress;
      emit(state.copyWith(cart: cart, formzStatus: formzStatus));

      ProductModel product = state.product;
      final result = await _productRepository.fetchProductById(state.product.id!);
      if(result.isRight()) {
        product = result.getOrElse(() => throw Exception("Unexpected error"));
        formzStatus = FormzSubmissionStatus.success;
      } else {
        formzStatus = FormzSubmissionStatus.failure;
      }

      emit(state.copyWith(product: product));
    });

    on<DetailsAddProduct>((event, emit) async {
      final cart = await _addCart(state.cart);
      emit(state.copyWith(cart: cart));
    });

    on<DetailsRemoveProduct>((event, emit) async {
      if(state.cart == null) return;
      final cart = await _removeCart(state.cart!);
      emit(state.copyWith(cart: cart));
    });
  }

  Future<CartModel?> _fetchCartById(int id) async {
    final result = await _repository.fetchCartById(id);
    if(result.isRight()) {
      return result.getOrElse(() => throw Exception("Unexpected error"));
    }

    return null;
  }

  Future<CartModel?> _addCart(CartModel? other) async {
    late CartModel cart;
    if(other != null) {
      int newCount = (other.count ?? 0) + 1;
      final amount = state.product.amount ?? 0;
      newCount = newCount > amount ? amount : newCount;
      cart = other.copyWith(count: newCount, amount: amount);
    } else {
      if((state.product.amount ?? 0) > 0) {
        cart = CartModel(
          id: state.product.id,
          title: state.product.title,
          description: state.product.description,
          brand: state.product.brand,
          amount: state.product.amount,
          currency: state.product.currency,
          price: state.product.price,
          measurementId: state.product.measurementId,
          image: getImage(state.product.images),
          count: 1,
        );
      }
    }

    final result = await _repository.setOrUpdateCart(cart);
    if(result.isRight()) {
      final res = result.getOrElse(() => throw Exception("Unexpected error"));
      if(res) return cart;
    }

    return null;
  }

  Future<CartModel?> _removeCart(CartModel other) async {
    final count = (other.count ?? 0) - 1;
    final cart = other.copyWith(count: count < 0 ? 0 : count, amount: state.product.amount);

    if((cart.count ?? 0) > 0) {
      final result = await _repository.setOrUpdateCart(cart);
      if(result.isRight()) {
        final res = result.getOrElse(() => throw Exception("Unexpected error"));
        if(res) return cart;
      }
    } else {
      await _repository.deleteCart(cart.id!);
    }


    return null;
  }

  String? getImage(List<String>? images) {
    if(images != null && images.isNotEmpty) {
      return images.first;
    }

    return null;
  }
}
