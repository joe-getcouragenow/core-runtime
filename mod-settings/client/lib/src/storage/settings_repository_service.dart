import 'package:fixnum/fixnum.dart';
import 'package:flutter/cupertino.dart';
import 'package:mod_settings/src/api/baseproto.pb.dart';
import 'package:mod_settings/src/api/settings.pb.dart';
import 'package:mod_settings/src/storage/settings_repository.dart';

class SettingsRepositoryService {
  ModuleSettingsRepository _moduleSettingsRepository;

  SettingsRepositoryService() {
    _moduleSettingsRepository = MockModuleSettingsRepository();
  }

  Future<bool> getBool(String moduleID, String key) async {
    ProtoModuleConfig moduleConfig = await getModuleConfig(moduleID);
    ConfigVal config = moduleConfig.configs[key];
    if (config == null || !config.hasBoolVal()) return null;
    return config.boolVal;
  }

  Future<int> getInt(String moduleID, String key) async {
    ProtoModuleConfig moduleConfig = await getModuleConfig(moduleID);
    ConfigVal config = moduleConfig.configs[key];
    if (config == null || !config.hasUint64Val()) return null;
    return config.uint64Val.toInt();
  }

  Future setBool(String moduleID, String key, bool value) async {
    ProtoModuleConfig moduleConfig = await getModuleConfig(moduleID);
    moduleConfig.configs[key] = ConfigVal()..boolVal = value;
    await _moduleSettingsRepository.setModuleConfig(moduleID, moduleConfig);
  }

  Future setInt(String moduleID, String key, int value) async {
    ProtoModuleConfig moduleConfig = await getModuleConfig(moduleID);
    moduleConfig.configs[key] = ConfigVal()..uint64Val = Int64(value);
    await _moduleSettingsRepository.setModuleConfig(moduleID, moduleConfig);
  }

  Future<ProtoModuleConfig> getModuleConfig(String moduleID) {
    return _moduleSettingsRepository.getModuleConfig(moduleID);
  }
}
