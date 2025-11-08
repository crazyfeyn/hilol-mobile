import 'dart:io';
import 'package:commerce_mobile/data/models/adress_location_image_model.dart';
import 'package:commerce_mobile/data/models/order_model.dart';
import 'package:commerce_mobile/data/models/place_search_model.dart';
import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

abstract class AddressRepository {
  Future<Either<String, Position>> getCurrentLocation();
  Future<Either<String, String>> reverseGeocode(LatLng latLng);
  Future<Either<String, List<PlaceSearchResult>>> searchAddress(String query);
  Future<Either<String, UploadLocationImageModel>> uploadLocationImage({
    required File imageFile,
    required int orderId,
    required String requestUUID,
  });
  Future<Either<String, OrderData>> createOrder({
    required OrderModel orderModel,
    required String requestUUID,
  });
  void dispose();
}
