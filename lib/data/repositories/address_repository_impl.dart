import 'dart:convert';
import 'dart:io';
import 'package:commerce_mobile/core/utils/app_snackbar.dart';
import 'package:commerce_mobile/data/datasources/network/cancel_token_manager.dart';
import 'package:commerce_mobile/data/datasources/network/network_helper.dart';
import 'package:commerce_mobile/data/datasources/network/network_service.dart';
import 'package:commerce_mobile/data/models/adress_location_image_model.dart';
import 'package:commerce_mobile/data/models/place_search_model.dart';
import 'package:commerce_mobile/domain/repositories/adress_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

class AddressRepositoryImpl extends AddressRepository {
  late final CancelTokenManager cancelTokenManager;
  static const String _kakaoRestApiKey = '6d426efb0e2af39c7bbea7e103c41b29';

  AddressRepositoryImpl() {
    cancelTokenManager = CancelTokenManager();
  }

  @override
  void dispose() => cancelTokenManager.cancelAll();

  @override
  Future<Either<String, Position>> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return const Left('Location permission denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return const Left('Location permission permanently denied');
      }

      final position = await Geolocator.getCurrentPosition(
        // ignore: deprecated_member_use
        desiredAccuracy: LocationAccuracy.high,
      );

      return Right(position);
    } on NetworkException catch (e) {
      if (e.type != NetworkExceptionType.cancelled) {
        GlobalSnackBar.showError(e.message);
      }
      return Left(e.toString());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> reverseGeocode(LatLng latLng) async {
    try {
      final url = Uri.parse(
        'https://dapi.kakao.com/v2/local/geo/coord2address.json?x=${latLng.longitude}&y=${latLng.latitude}&input_coord=WGS84',
      );

      final response = await http.get(
        url,
        headers: {'Authorization': 'KakaoAK $_kakaoRestApiKey'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(data['documents']);
        final documents = data['documents'];
        if (documents != null && documents.isNotEmpty) {
          final address = documents[0]['address'];
          final roadAddress = documents[0]['road_address'];
          if (roadAddress != null) {
            final roadName = roadAddress['road_name'] ?? '';
            final buildingNo = roadAddress['main_building_no'] ?? '';
            final addressString =
                '${roadAddress['region_1depth_name']} ${roadAddress['region_2depth_name']} ${roadAddress['region_3depth_name']} $roadName $buildingNo'
                    .trim();
            return Right(addressString);
          } else if (address != null) {
            final mainAddressNo = address['main_address_no'] ?? '';
            final addressString =
                '${address['region_1depth_name']} ${address['region_2depth_name']} ${address['region_3depth_name']} $mainAddressNo'
                    .trim();
            return Right(addressString);
          }
        }
        return const Left('주소를 찾을 수 없습니다');
      } else {
        return Left('Kakao API Error: ${response.statusCode}');
      }
    } on NetworkException catch (e) {
      if (e.type != NetworkExceptionType.cancelled) {
        GlobalSnackBar.showError(e.message);
      }
      return Left(e.toString());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<PlaceSearchResult>>> searchAddress(
    String query,
  ) async {
    try {
      final url = Uri.parse(
        'https://dapi.kakao.com/v2/local/search/keyword.json?query=$query',
      );

      final response = await http.get(
        url,
        headers: {'Authorization': 'KakaoAK $_kakaoRestApiKey'},
      );

      if (response.statusCode == 200) {
        print(response.body);
        final data = json.decode(response.body);
        final documents = data['documents'] as List<dynamic>? ?? [];

        final results =
            documents.map((doc) {
              return PlaceSearchResult(
                placeName: doc['place_name'] ?? '',
                addressName: doc['address_name'] ?? '',
                roadAddressName: doc['road_address_name'] ?? '',
                x: double.tryParse(doc['x'] ?? '0') ?? 0,
                y: double.tryParse(doc['y'] ?? '0') ?? 0,
                categoryName: '',
              );
            }).toList();

        return Right(results);
      } else {
        return Left('Kakao API Error: ${response.statusCode}');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, UploadLocationImageModel>> uploadLocationImage(int orderId, File imageFile) async {
    try {
      final api = NetworkService.apiOrderUploadLocationImage;
      final cancelToken = cancelTokenManager.getToken(api);
      final response = await NetworkService.multipartImage(api, cancelToken, imageFile.path, { "orderId": orderId });
      final result = UploadLocationImageModel.fromJson(response);
      return Right(result);
    } on NetworkException catch (e) {
      if (e.type != NetworkExceptionType.cancelled) {
        GlobalSnackBar.showError(e.message);
      }
      return Left(e.toString());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
