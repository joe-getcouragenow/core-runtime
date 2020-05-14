import 'package:flutter_modular/flutter_modular.dart';
import 'package:mod_account/core/core.dart';
import 'package:mod_account/modules/home_screen.dart';
import 'package:mod_account/modules/settings/account_settings.dart';
import 'package:mod_account/modules/signup/views/signup_view.dart';

class AccountModule extends ChildModule {
  static String baseRoute;

  AccountModule(String baseRoute) {
    if (baseRoute == '/') {
      baseRoute = '';
    }
    assert(baseRoute != null);
    AccountModule.baseRoute = baseRoute;
  }

  @override
  List<Bind> get binds => [Bind((i) => Paths(baseRoute))];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomeScreen()),
        Router('/signup', child: (_, args) => SignUpView()),
        Router('/settings', child: (_, args) => AccountSettings()),
      ];

  static Inject get to => Inject<AccountModule>.of();
}
