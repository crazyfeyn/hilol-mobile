import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

abstract class AddressRepository {
  Future<Either<String, Position>> getCurrentLocation();
  Future<Either<String, String>> reverseGeocode(LatLng latLng);
  void dispose();
}
