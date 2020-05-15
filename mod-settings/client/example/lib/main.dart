import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mod_settings/mod_settings.dart';
import 'package:sys_core/sys_core.dart';

void main() async {
  await coreInit();
  runApp(ModularApp(module: AppModule()));
}

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        // we have to inject the concrete implementation of
        // CoreSettingsService here!
        Bind((i) => SettingsService.instance),
      ];

  @override
  Widget get bootstrap => App();

  @override
  List<Router> get routers => [
        Router(
          "/",
          module: SettingsModule(),
        ),
      ];
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: Modular.generateRoute,
      navigatorKey: Modular.navigatorKey,
    );
  }
}
