import 'package:core_feature/src/base_failure.dart';
import 'package:dartz/dartz.dart' show Either;

/// [S] is success
/// [P] is parameters

abstract class BaseUseCase<S, P> {
  Future<Either<BaseFailure, S>> call(
    final P param,
  );
}