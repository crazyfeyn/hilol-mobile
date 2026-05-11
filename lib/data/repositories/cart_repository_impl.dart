import 'package:commerce_mobile/data/datasources/database/cart_db.dart';
import 'package:commerce_mobile/core/services/session_service.dart';
import 'package:commerce_mobile/core/utils/app_snackbar.dart';
import 'package:commerce_mobile/data/datasources/network/network_helper.dart';
import 'package:commerce_mobile/data/datasources/network/network_service.dart';
import 'package:commerce_mobile/data/models/cart_model.dart';
import 'package:commerce_mobile/domain/repositories/cart_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CartRepositoryImpl extends CartRepository {
  @override
  Future<Either<String, List<CartModel>>> fetchCarts() async {
    try {
      if (!SessionService.isAuthenticated) {
        return Right(SessionService.guestCart);
      }
      final response = await CartDB.fetchCarts();
      final carts =
          response.map<CartModel>((json) => CartModel.fromMap(json)).toList();
      return Right(carts);
    } catch (e) {
      GlobalSnackBar.showError('Failed to fetch carts: ${e.toString()}');
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, CartModel>> fetchCartById(int id) async {
    try {
      if (!SessionService.isAuthenticated) {
        final guestCart = SessionService.findGuestCartById(id);
        if (guestCart == null) {
          GlobalSnackBar.showError('Guest cart not found');
          return Left('Guest cart not found');
        }
        return Right(guestCart);
      }
      final response = await CartDB.fetchCartById(id);
      final cart = CartModel.fromMap(response!);
      return Right(cart);
    } catch (e) {
      GlobalSnackBar.showError('Failed to fetch cart: ${e.toString()}');
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
      GlobalSnackBar.showError('Failed to update cart: ${e.toString()}');
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
      GlobalSnackBar.showError('Failed to delete cart item: ${e.toString()}');
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
      GlobalSnackBar.showError('Failed to clear cart: ${e.toString()}');
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<CartModel>>> fetchAndValidateCarts() async {
    try {
      if (!SessionService.isAuthenticated) {
        return Right(SessionService.guestCart);
      }

      final response = await CartDB.fetchCarts();
      final carts =
          response.map<CartModel>((json) => CartModel.fromMap(json)).toList();

      final List<CartModel> validCarts = [];
      final List<int> invalidIds = [];

      for (final cart in carts) {
        if (cart.id == null) continue;
        final exists = await _checkProductExists(cart.id!);
        if (exists) {
          validCarts.add(cart);
        } else {
          invalidIds.add(cart.id!);
        }
      }

      for (final id in invalidIds) {
        await CartDB.deleteCartById(id);
      }

      return Right(validCarts);
    } catch (e) {
      GlobalSnackBar.showError('Failed to validate cart: ${e.toString()}');
      return Left(e.toString());
    }
  }

  Future<bool> _checkProductExists(int productId) async {
    try {
      final cancelToken = CancelToken();
      final response = await NetworkService.get(
        NetworkService.apiGetProductById,
        cancelToken,
        {'productId': productId},
      );
      return response?['data'] != null;
    } on NetworkException catch (e) {
      if (e.type == NetworkExceptionType.notFound) {
        GlobalSnackBar.showError('Product no longer available');
        return false;
      }
      // Network error — don't remove item, don't show snackbar (same as address repo pattern)
      return true;
    } catch (e) {
      return true;
    }
  }
}
