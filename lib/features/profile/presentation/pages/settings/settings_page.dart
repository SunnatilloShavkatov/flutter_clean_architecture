import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_clean_architecture/core/extension/extension.dart";
import "package:flutter_clean_architecture/router/app_routes.dart";

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("settings".tr(context: context))),
    body: Center(
      child: GestureDetector(
        onTap: () {
          showBottomSheet(
            context: context,
            builder: (BuildContext ctx) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: const Text("English"),
                  onTap: () {
                    unawaited(localSource.setLocale("en"));
                    context.setLocale(const Locale("en"));
                    Navigator.pop(ctx);
                  },
                ),
                ListTile(
                  title: const Text("Russian"),
                  onTap: () {
                    unawaited(localSource.setLocale("ru"));
                    context.setLocale(const Locale("ru"));
                    Navigator.pop(ctx);
                  },
                ),
                ListTile(
                  title: const Text("Uzbek"),
                  onTap: () {
                    unawaited(localSource.setLocale("ru"));
                    context.setLocale(const Locale("uz"));
                    Navigator.pop(ctx);
                  },
                ),
              ],
            ),
          );
        },
        child: const Text("Locale"),
      ),
    ),
  );
}
