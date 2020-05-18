import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
//import 'package:hive/hive.dart';
import 'package:mod_settings/mod_settings.dart';
import 'package:mod_settings/src/view/settings_view.dart';
import 'package:mod_settings/src/storage/hive_proto_module_config_adapter.dart';
import 'package:sys_core/sys_core.dart';

class SettingsModule extends ChildModule {
  SettingsModule() {
//    Hive.registerAdapter(HiveProtoModuleConfigAdapter());
  }

  @override
  List<Bind> get binds => [
        Bind((i) {
          var moduleConfig = ModuleConfig(
            moduleID: "mod-settings",
            moduleName: "mod-settings-title",
            items: [
              ModuleConfigItemBool("key-bool2", true, "second flag here"),
              ModuleConfigItemBool("key-bool", true, "test flag here"),
              ModuleConfigItemDropdown("key-dropdown", 4,
                  "this is an complete different dropdown from another module",
                  items: ["eins", "zwei", "drei", "vier", "fünf"]),
            ],
          );
          // register the module settings here:
          Modular.get<CoreSettingsService>().registerModuleConfig(moduleConfig);
          return moduleConfig;
        }, lazy: false)
      ];

  @override
  List<Router> get routers => [
        Router("/",
            child: (_, args) => SettingsViewNew(
                coreSettings: Modular.get<CoreSettingsService>())),
      ];

  static Inject get to => Inject<SettingsModule>.of();
}
