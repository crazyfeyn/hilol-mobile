import 'package:commerce_mobile/data/datasources/database/cart_db.dart';
import 'package:commerce_mobile/data/models/cart_model.dart';
import 'package:commerce_mobile/domain/repositories/cart_repository.dart';
import 'package:dartz/dartz.dart';

class CartRepositoryImpl extends CartRepository {

  @override
  Future<Either<String, List<CartModel>>> fetchCarts() async {
    try {
      final response = await CartDB.fetchCarts();
      final carts = response.map<CartModel>((json) => CartModel.fromMap(json)).toList();
      return Right(carts);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, CartModel>> fetchCartById(int id) async {
    try {
      final response = await CartDB.fetchCartById(id);
      final cart = CartModel.fromMap(response!);
      return Right(cart);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> setOrUpdateCart(CartModel cart) async {
    try {
      await CartDB.setCart(cart);
      return Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> deleteCart(int cartId) async {
    try {
      await CartDB.deleteCartById(cartId);
      return Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> deleteAllCarts() async {
    try {
      await CartDB.deleteAllCarts();
      return Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }
}