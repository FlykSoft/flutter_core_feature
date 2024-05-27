import 'core_localization_delegate.dart';

class CoreArabicLocalizationDelegate extends CoreLocalizationDelegate {
  const CoreArabicLocalizationDelegate();

  @override
  String get badGatewayError =>
      'بوابة غير صالحة. يرجى المحاولة مرة أخرى لاحقًا.';

  @override
  String get badRequestError =>
      'طلب غير صالح. يرجى التحقق من المدخلات والمحاولة مرة أخرى.';

  @override
  String get forbiddenError => 'ممنوع. ليس لديك إذن للوصول إلى هذا المورد.';

  @override
  String get internalServerError =>
      'خطأ في الخادم الداخلي. يرجى المحاولة مرة أخرى لاحقًا.';

  @override
  String get notFoundError =>
      'المورد غير موجود. يرجى التحقق من عنوان URL والمحاولة مرة أخرى.';

  @override
  String get requestTimeoutError =>
      'انتهت مهلة الطلب. يرجى المحاولة مرة أخرى لاحقًا.';

  @override
  String get serviceUnavailableError =>
      'الخدمة غير متوفرة. يرجى المحاولة مرة أخرى لاحقًا.';

  @override
  String get tooManyRequestsError =>
      'طلبات كثيرة جدًا. يرجى الانتظار والمحاولة مرة أخرى لاحقًا.';

  @override
  String get unauthorizedError =>
      'وصول غير مصرح به. يرجى تسجيل الدخول والمحاولة مرة أخرى.';

  @override
  String get unknownApiFailure =>
      'حدث خطأ غير معروف. يرجى المحاولة مرة أخرى لاحقًا.';
}
