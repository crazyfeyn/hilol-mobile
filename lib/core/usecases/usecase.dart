import 'package:commerce_mobile/core/error/failure.dart';
import 'package:dartz/dartz.dart';

// ignore: avoid_types_as_parameter_names
abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
