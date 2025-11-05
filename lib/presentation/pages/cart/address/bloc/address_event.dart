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

class AddressSearchQueryChanged extends AddressEvent {
  final String query;
  AddressSearchQueryChanged(this.query);

  List<Object?> get props => [query];
}

// When search results are successfully fetched
class AddressSearchResultsLoaded extends AddressEvent {
  final List<PlaceSearchResult> results;
  AddressSearchResultsLoaded(this.results);

  List<Object?> get props => [results];
}

// When an error occurs while searching
class AddressSearchErrorOccurred extends AddressEvent {
  final String message;
  AddressSearchErrorOccurred(this.message);

  List<Object?> get props => [message];
}

// When user selects a search result (place)
class AddressSearchPlaceSelected extends AddressEvent {
  final PlaceSearchResult place;
  AddressSearchPlaceSelected(this.place);

  List<Object?> get props => [place];
}

// When user clears the search field
class AddressSearchCleared extends AddressEvent {}
