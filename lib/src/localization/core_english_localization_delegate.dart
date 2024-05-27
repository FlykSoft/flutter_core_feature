import 'core_localization_delegate.dart';

class CoreEnglishLocalizationDelegate extends CoreLocalizationDelegate {
  const CoreEnglishLocalizationDelegate();

  @override
  String get badGatewayError => 'Bad gateway. Please try again later.';

  @override
  String get badRequestError =>
      'Bad request. Please check your input and try again.';

  @override
  String get forbiddenError =>
      'Forbidden. You don\'t have permission to access this resource.';

  @override
  String get internalServerError =>
      'Internal server error. Please try again later.';

  @override
  String get notFoundError =>
      'Resource not found. Please check the URL and try again.';

  @override
  String get requestTimeoutError =>
      'Request timed out. Please try again later.';

  @override
  String get serviceUnavailableError =>
      'Service unavailable. Please try again later.';

  @override
  String get tooManyRequestsError =>
      'Too many requests. Please wait and try again later.';

  @override
  String get unauthorizedError =>
      'Unauthorized access. Please log in and try again.';

  @override
  String get unknownApiFailure =>
      'An unknown error occurred. Please try again later.';
}
