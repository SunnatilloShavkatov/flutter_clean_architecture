import 'dart:io';

sealed class Constants {
  Constants._();

  static const String authUrl = 'https://api.auth.u-code.io';
  static const String baseUrl = 'https://api.admin.u-code.io';

  /// id
  static const String projectId = '25d16930-b1a9-4ae5-ab01-b79cc993f06e';
  static const String environmentId = 'f1fc135e-10c2-4ea9-8183-54cafb0a0486';
  static const String resourceId = '944cd0d2-fc17-4095-b410-8e9d6007ac39';
  static const String apiKey = 'P-MLu5nUkI5FIl2VQ91sV0MeawEMgSdSld';

  static const String clientTypeId = 'f312b956-e6b3-4b45-aa1c-c9d717b3d42f';
  static const String companyId = '07660ee4-78fc-4709-badb-bca9897070a1';
  static const String roledId = '81a2b429-fe32-4781-adf5-aacc94c5ef45';

  static final String appLink = Platform.isIOS
      ? 'https://apps.apple.com/us/app/q-watt-powerbank-sharing/id6444178516'
      : 'https://play.google.com/store/apps/details?id=com.q.watt';
}

class Validations {
  Validations._();

  static const emailEmpty = 'Email cannot be empty';
  static const notEmail = 'This is not email';
  static const passwordEmpty = 'Password cannot be empty';
  static const passwordShort = 'Password too short';
  static const passwordLong = 'Password too long';
  static const firstnameEmpty = 'Firstname cannot be empty';
  static const firstnameShort = 'Firstname too short';
  static const firstnameLong = 'Firstname too long';
  static const lastnameEmpty = 'Last name cannot be empty';
  static const lastnameShort = 'Lastname too short';
  static const lastnameLong = 'Lastname too long';
  static const passwordNotMatch = 'Passwords do not match';
  static const internetFailure = 'No Internet';
  static const somethingWentWrong = 'Something went wrong!';
}

sealed class AppKeys {
  AppKeys._();

  static const String locale = 'locale';
  static const String hasProfile = 'has_profile';
  static const String accessToken = 'access_token';
  static const String firstname = 'firstname';
  static const String lastname = 'lastname';
  static const String email = 'email';
  static const String password = 'password';
  static const String themeMode = 'theme_mode';
}

sealed class Urls {
  Urls._();

  static const signInUrl = '/v1/users/sign_in/';
  static const signUpUrl = '/v1/users/sign_up/';
  static const getCategoryListUrl = '/v1/categories/';
  static const getGuidListUrl = '/v1/guides/';
  static const getArticleUrl = '/v1/articles/';
}

sealed class DatabaseKeys {
  DatabaseKeys._();

  static const categoryList = 'category_list/';
  static const guidList = 'guid_list/';
  static const article = 'article/';
}
