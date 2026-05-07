import 'package:commerce_mobile/data/datasources/database/db_service.dart';
import 'package:commerce_mobile/data/models/cart_model.dart';
import 'package:commerce_mobile/data/repositories/cart_repository_impl.dart';
import 'package:flutter/foundation.dart';

class SessionService {
  SessionService._();

  static bool isAuthenticated = false;
  static final ValueNotifier<bool> authStateNotifier = ValueNotifier<bool>(false);
  static List<CartModel> _guestCart = [];
  static List<CartModel> _pendingCheckoutCart = [];

  static void bootstrap() {
    isAuthenticated = DBService.isLoggedIn();
    authStateNotifier.value = isAuthenticated;
  }

  static void setAuthenticated(bool value) {
    isAuthenticated = value;
    authStateNotifier.value = isAuthenticated;
    if (value) {
      _guestCart = [];
    }
  }

  static List<CartModel> get guestCart => List<CartModel>.from(_guestCart);

  static CartModel? findGuestCartById(int id) {
    final index = _guestCart.indexWhere((element) => element.id == id);
    if (index < 0) return null;
    return _guestCart[index];
  }

  static void setOrUpdateGuestCart(CartModel cart) {
    final index = _guestCart.indexWhere((element) => element.id == cart.id);
    if (index < 0) {
      _guestCart.add(cart);
      return;
    }
    _guestCart[index] = cart;
  }

  static void deleteGuestCartById(int id) {
    _guestCart.removeWhere((element) => element.id == id);
  }

  static void clearGuestCart() {
    _guestCart = [];
  }

  static void savePendingCheckoutFromGuestCart() {
    _pendingCheckoutCart = List<CartModel>.from(_guestCart);
  }

  static bool get hasPendingCheckoutCart => _pendingCheckoutCart.isNotEmpty;

  static Future<void> applyPendingCheckoutAfterLogin() async {
    if (_pendingCheckoutCart.isEmpty) return;
    final repository = CartRepositoryImpl();
    for (final cart in _pendingCheckoutCart) {
      await repository.setOrUpdateCart(cart);
    }
    _pendingCheckoutCart = [];
    clearGuestCart();
  }

  static void clearGuestSessionOnExitIfUnauthenticated() {
    if (isAuthenticated) return;
    _pendingCheckoutCart = [];
    clearGuestCart();
  }
}
