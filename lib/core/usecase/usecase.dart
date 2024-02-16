import "package:flutter_clean_architecture/core/either/either.dart";
import "package:flutter_clean_architecture/core/error/failure.dart";

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
