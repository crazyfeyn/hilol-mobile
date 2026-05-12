import 'package:commerce_mobile/data/models/cart_model.dart';
import 'package:dartz/dartz.dart';

abstract class CartRepository {
  Future<Either<String, List<CartModel>>> fetchCarts();

  Future<Either<String, CartModel?>> fetchCartById(int id);

  Future<Either<String, bool>> setOrUpdateCart(CartModel cart);

  Future<Either<String, bool>> deleteCart(int cartId);

  Future<Either<String, bool>> deleteAllCarts();
  Future<Either<String, List<CartModel>>> fetchAndValidateCarts();
}
