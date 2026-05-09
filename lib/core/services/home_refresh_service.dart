import 'package:flutter/foundation.dart';

/// Triggers a forced refresh when the user re-selects (double taps) the Home tab.
class HomeRefreshService {
  HomeRefreshService._();

  /// HomeView listens to this.
  static final ValueNotifier<int> homeReselected = ValueNotifier<int>(0);

  static void triggerHomeReselect() {
    homeReselected.value++;
  }
}

