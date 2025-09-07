abstract class Failure {}

class ServerFailure extends Failure {
  String message;
  ServerFailure({required this.message});
}

class CacheFailure extends Failure {}

class NetworkFailure extends Failure {}
