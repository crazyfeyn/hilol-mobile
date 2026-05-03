import 'package:commerce_mobile/data/datasources/database/cart_db.dart';
import 'package:commerce_mobile/core/services/session_service.dart';
import 'package:commerce_mobile/data/models/cart_model.dart';
import 'package:commerce_mobile/domain/repositories/cart_repository.dart';
import 'package:dartz/dartz.dart';

class CartRepositoryImpl extends CartRepository {

  @override
  Future<Either<String, List<CartModel>>> fetchCarts() async {
    try {
      if (!SessionService.isAuthenticated) {
        return Right(SessionService.guestCart);
      }
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
      if (!SessionService.isAuthenticated) {
        final guestCart = SessionService.findGuestCartById(id);
        if (guestCart == null) {
          return Left('Guest cart not found');
        }
        return Right(guestCart);
      }
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
      if (!SessionService.isAuthenticated) {
        SessionService.setOrUpdateGuestCart(cart);
        return Right(true);
      }
      await CartDB.setCart(cart);
      return Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> deleteCart(int cartId) async {
    try {
      if (!SessionService.isAuthenticated) {
        SessionService.deleteGuestCartById(cartId);
        return Right(true);
      }
      await CartDB.deleteCartById(cartId);
      return Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> deleteAllCarts() async {
    try {
      if (!SessionService.isAuthenticated) {
        SessionService.clearGuestCart();
        return Right(true);
      }
      await CartDB.deleteAllCarts();
      return Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }
}