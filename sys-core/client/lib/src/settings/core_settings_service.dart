import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sys_core/src/settings/modules/module_config.dart';
import 'package:sys_core/src/settings/modules/module_config_item.dart';
import 'package:sys_core/src/storage/settings_repository_service.dart';

class CoreSettingsService extends ChangeNotifier {
  static final CoreSettingsService _instance = CoreSettingsService._internal();

  static CoreSettingsService get instance => _instance;

  CoreSettingsService._internal();

  /// this map contains all [ModuleConfig] classes from all submodules
  /// which have registered their settings here
  final Map<String, ModuleConfig> _moduleConfigs = Map<String, ModuleConfig>();

  List<ModuleConfig> get moduleConfigs => _moduleConfigs.values.toList();

  final SettingsRepositoryService _settingsService = SettingsRepositoryService();

  /// each module which want's to expose its settings have to register
  /// its [ModuleConfig] here
  registerModuleConfig(ModuleConfig configs) async {
    print("ModuleConfig registered : ${configs.moduleID}, $configs}");
    _moduleConfigs[configs.moduleID] = configs;

    //configs are updated through the repository
    configs.configItems.forEach((item) async {
      if (item is ModuleConfigItemDropdown) {
        var value = await _settingsService.getInt(configs.moduleID, item.key);
        configs.setIntValue(item.key, value);
      } else if (item is ModuleConfigItemBool) {
        var value = await _settingsService.getBool(configs.moduleID, item.key);
        configs.setBoolValue(item.key, value);
      }
    });
    notifyListeners();

    //adding listener to save new changes
    configs.addListener(() {
      onModuleChange(configs.moduleID);
    });
  }

  /// this function fires if any config from any submodule has changed
  onModuleChange(String moduleID) {
    // this module has changed so save it to repository
    print("onModuleChange -> moduleID: $moduleID");
    _moduleConfigs[moduleID].configItems.forEach((item) {
      if (item is ModuleConfigItemBool) {
        _settingsService.setBool(moduleID, item.key, item.value);
      } else if (item is ModuleConfigItemDropdown) {
        _settingsService.setInt(moduleID, item.key, item.value);
      }
    });
    notifyListeners();
  }
}
