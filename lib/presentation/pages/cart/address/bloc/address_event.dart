part of 'address_bloc.dart';

abstract class AddressEvent {}

class AddressMapInitialized extends AddressEvent {}

class AddressLocationSelected extends AddressEvent {
  final LatLng latLng;

  AddressLocationSelected(this.latLng);
}

class AddressCurrentLocationRequested extends AddressEvent {}

class AddressChanged extends AddressEvent {
  final String address;

  AddressChanged(this.address);
}

class AddressPhoneNumberChanged extends AddressEvent {
  final String phoneNumber;

  AddressPhoneNumberChanged(this.phoneNumber);
}

class AddressReceiverNameChanged extends AddressEvent {
  final String receiverName;

  AddressReceiverNameChanged(this.receiverName);
}

class AddressHomeNumberChanged extends AddressEvent {
  final String homeNumber;

  AddressHomeNumberChanged(this.homeNumber);
}

class AddressEntrancePasswordChanged extends AddressEvent {
  final String entrancePassword;

  AddressEntrancePasswordChanged(this.entrancePassword);
}

class AddressSubmitted extends AddressEvent {
  final List<CartModel> carts;

  AddressSubmitted(this.carts);
}

class AddressErrorShown extends AddressEvent {}

class AddressDispose extends AddressEvent {}
