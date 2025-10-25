part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class ProfileFetchData extends ProfileEvent {}

class ProfileEditData extends ProfileEvent {}

class ProfileLogOut extends ProfileEvent {}

class ProfileDelete extends ProfileEvent {}

class ProfileDispose extends ProfileEvent {}
