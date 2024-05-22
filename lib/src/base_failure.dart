// This marker class ensures only defined subclasses can extend Failure.
sealed class BaseFailure {
  final String message;

  const BaseFailure({
    required this.message,
  });

  @override
  String toString() => message;
}

// Database error type
sealed class DatabaseFailure extends BaseFailure {
  const DatabaseFailure({
    required super.message,
  });

  @override
  String toString() => message;
}

// REST API error type
sealed class ApiFailure extends BaseFailure {
  final int statusCode;

  const ApiFailure({
    required this.statusCode,
    required super.message,
  });

  // Specific API error subtypes
  factory ApiFailure.fromStatusCode({
    required int statusCode,
    required String message,
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
  String toString() => message;
}

// Specific API error subtypes with additional properties (optional)
class BadRequestError extends ApiFailure {
  final String? validationErrors; // Example: List of validation errors

  const BadRequestError({
    required super.message,
    this.validationErrors,
  }) : super(
          statusCode: 400,
        );
}

class UnauthorizedError extends ApiFailure {
  const UnauthorizedError({
    required super.message,
  }) : super(
          statusCode: 401,
        );
}

class ForbiddenError extends ApiFailure {
  const ForbiddenError({
    required super.message,
  }) : super(
          statusCode: 403,
        );
}

class NotFoundError extends ApiFailure {
  const NotFoundError({
    required super.message,
  }) : super(
          statusCode: 404,
        );
}

class RequestTimeoutError extends ApiFailure {
  const RequestTimeoutError({
    required super.message,
  }) : super(
          statusCode: 408,
        );
}

class TooManyRequestsError extends ApiFailure {
  final int? retryAfter;

  const TooManyRequestsError({
    required super.message,
    this.retryAfter,
  }) : super(
          statusCode: 429,
        );
}

class InternalServerError extends ApiFailure {
  const InternalServerError({
    required super.message,
  }) : super(
          statusCode: 500,
        );
}

class BadGatewayError extends ApiFailure {
  const BadGatewayError({
    required super.message,
  }) : super(
          statusCode: 502,
        );
}

class ServiceUnavailableError extends ApiFailure {
  const ServiceUnavailableError({
    required super.message,
  }) : super(
          statusCode: 503,
        );
}

class UnknownApiFailure extends ApiFailure {
  const UnknownApiFailure({
    required super.message,
  }) : super(
          statusCode: 0,
        );
}
