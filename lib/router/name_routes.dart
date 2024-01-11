part of 'app_routes.dart';

sealed class Routes {
  Routes._();

  static const String initial = '/';

  /// Auth
  static const String auth = '/auth';

  /// Home
  static const String home = '/home';
  static const String payments = '/payments';

  /// Catalog
  static const String catalog = '/catalog';

  /// my notes
  static const String myNotes = '/my-notes';

  /// Profile
  static const String profile = '/profile';
  static const String settings = '/settings';

  /// internet connection
  static const String noInternet = '/no-internet';
}
