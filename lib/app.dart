import 'package:flutter/material.dart';

import 'core/extension/extension.dart';
import 'core/l10n/app_localizations.dart';
import 'core/theme/themes.dart';
import 'router/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: scaffoldMessengerKey,

        /// theme style
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: context.options.themeMode,

        /// locale
        locale: context.options.locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,

        /// pages
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      );
}