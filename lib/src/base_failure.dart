import 'package:core_feature/src/localization/core_localization.dart';

sealed class BaseFailure {
  final String? message;

  const BaseFailure({
    required this.message,
  });

  @override
  String toString() => message ?? localizedMessage;

  String get localizedMessage;
}

// Database error type
sealed class DatabaseFailure extends BaseFailure {
  const DatabaseFailure({
    super.message,
  });

  @override
  String toString() => message ?? localizedMessage;

  @override
  String get localizedMessage;
}

// REST API error type
sealed class ApiFailure extends BaseFailure {
  final int statusCode;

  const ApiFailure({
    required this.statusCode,
    super.message,
  });

  // Specific API error subtypes
  factory ApiFailure.fromStatusCode({
    required int statusCode,
    String? message,
  }) {
    switch (statusCode) {
      case 400:
        return BadRequestError(message: message);
      case 401:
        return UnauthorizedError(message: message);
      case 403:
        return ForbiddenError(message: message);
      case 404:
        return NotFoundError(message: message);
      case 408:
        return RequestTimeoutError(message: message);
      case 429:
        return TooManyRequestsError(message: message);
      case 500:
        return InternalServerError(message: message);
      case 502:
        return BadGatewayError(message: message);
      case 503:
        return ServiceUnavailableError(message: message);
      default:
        return UnknownApiFailure(message: message);
    }
  }

  @override
  String toString() => message ?? localizedMessage;

  @override
  String get localizedMessage;
}

// Specific API error subtypes with additional properties (optional)
class BadRequestError extends ApiFailure {
  final String? validationErrors; // Example: List of validation errors

  const BadRequestError({
    super.message,
    this.validationErrors,
  }) : super(
          statusCode: 400,
        );

  @override
  String get localizedMessage => CoreLocalization.instance.badRequestError;
}

class UnauthorizedError extends ApiFailure {
  const UnauthorizedError({
    super.message,
  }) : super(
          statusCode: 401,
        );

  @override
  String get localizedMessage => CoreLocalization.instance.unauthorizedError;
}

class ForbiddenError extends ApiFailure {
  const ForbiddenError({
    super.message,
  }) : super(
          statusCode: 403,
        );

  @override
  String get localizedMessage => CoreLocalization.instance.forbiddenError;
}

class NotFoundError extends ApiFailure {
  const NotFoundError({
    super.message,
  }) : super(
          statusCode: 404,
        );

  @override
  String get localizedMessage => CoreLocalization.instance.notFoundError;
}

class RequestTimeoutError extends ApiFailure {
  const RequestTimeoutError({
    super.message,
  }) : super(
          statusCode: 408,
        );

  @override
  String get localizedMessage => CoreLocalization.instance.requestTimeoutError;
}

class TooManyRequestsError extends ApiFailure {
  final int? retryAfter;

  const TooManyRequestsError({
    super.message,
    this.retryAfter,
  }) : super(
          statusCode: 429,
        );

  @override
  String get localizedMessage => CoreLocalization.instance.tooManyRequestsError;
}

class InternalServerError extends ApiFailure {
  const InternalServerError({
    super.message,
  }) : super(
          statusCode: 500,
        );

  @override
  String get localizedMessage => CoreLocalization.instance.internalServerError;
}

class BadGatewayError extends ApiFailure {
  const BadGatewayError({
    super.message,
  }) : super(
          statusCode: 502,
        );

  @override
  String get localizedMessage => CoreLocalization.instance.badRequestError;
}

class ServiceUnavailableError extends ApiFailure {
  const ServiceUnavailableError({
    super.message,
  }) : super(
          statusCode: 503,
        );

  @override
  String get localizedMessage =>
      CoreLocalization.instance.serviceUnavailableError;
}

class UnknownApiFailure extends ApiFailure {
  const UnknownApiFailure({
    super.message,
  }) : super(
          statusCode: 0,
        );

  @override
  String get localizedMessage => CoreLocalization.instance.unknownApiFailure;
}
