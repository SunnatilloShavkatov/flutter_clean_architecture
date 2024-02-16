import "package:flutter_clean_architecture/core/either/either.dart";
import "package:flutter_clean_architecture/core/error/failure.dart";

typedef UseCase<Type, Params> = Future<Either<Failure, Type>> Function(
  Params params,
);

class NoParams {}
