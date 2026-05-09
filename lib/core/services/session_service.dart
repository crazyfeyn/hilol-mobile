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
    _guestCart = DBService.getGuestCartData();
    _pendingCheckoutCart = DBService.getPendingCheckoutCartData();
  }

  static void setAuthenticated(bool value) {
    isAuthenticated = value;
    authStateNotifier.value = isAuthenticated;
    if (value) {
      _guestCart = [];
      DBService.clearGuestCartData();
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
      DBService.setGuestCartData(_guestCart);
      return;
    }
    _guestCart[index] = cart;
    DBService.setGuestCartData(_guestCart);
  }

  static void deleteGuestCartById(int id) {
    _guestCart.removeWhere((element) => element.id == id);
    DBService.setGuestCartData(_guestCart);
  }

  static void clearGuestCart() {
    _guestCart = [];
    DBService.clearGuestCartData();
  }

  static void savePendingCheckoutFromGuestCart() {
    _pendingCheckoutCart = List<CartModel>.from(_guestCart);
    DBService.setPendingCheckoutCartData(_pendingCheckoutCart);
  }

  static bool get hasPendingCheckoutCart => _pendingCheckoutCart.isNotEmpty;

  static Future<void> applyPendingCheckoutAfterLogin() async {
    if (_pendingCheckoutCart.isEmpty) return;
    final repository = CartRepositoryImpl();
    for (final cart in _pendingCheckoutCart) {
      await repository.setOrUpdateCart(cart);
    }
    _pendingCheckoutCart = [];
    await DBService.clearPendingCheckoutCartData();
    clearGuestCart();
  }

  static void clearGuestSessionOnExitIfUnauthenticated() {
    if (isAuthenticated) return;
    _pendingCheckoutCart = [];
    DBService.clearPendingCheckoutCartData();
    clearGuestCart();
  }
}
