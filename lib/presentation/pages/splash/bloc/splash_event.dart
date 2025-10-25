part of 'splash_bloc.dart';

abstract class SplashEvent {}

class SplashFetchUserData extends SplashEvent {}

class SplashDispose extends SplashEvent {}