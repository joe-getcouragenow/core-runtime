import 'package:sys_core/src/api/baseproto.pb.dart';
import 'package:sys_core/src/api/settings.pb.dart';
import 'package:sys_core/src/storage/settings_repository.dart';
import 'package:fixnum/fixnum.dart';

class SettingsRepositoryService {
  ModuleSettingsRepository _moduleSettingsRepository =
      LocalModuleSettingsRepository();

  Future<bool> getBool(String moduleID, String key) async {
    ProtoModuleConfig moduleConfig = await getModuleConfig(moduleID);
    Config config = moduleConfig.configs[key];
    if (config == null) return null;
    return config.ensureVal().boolVal;
  }

  Future<int> getInt(String moduleID, String key) async {
    ProtoModuleConfig moduleConfig = await getModuleConfig(moduleID);
    Config config = moduleConfig.configs[key];
    if (config == null) return null;
    return config.ensureVal().uint64Val.toInt();
  }

  Future setBool(String moduleID, String key, bool value) async {
    ProtoModuleConfig moduleConfig = await getModuleConfig(moduleID);
    moduleConfig.configs[key] = Config()
      ..key = key
      ..val = (ConfigVal()..boolVal = value);
    await _moduleSettingsRepository.setModuleConfig(moduleID, moduleConfig);
  }

  Future setInt(String moduleID, String key, int value) async {
    ProtoModuleConfig moduleConfig = await getModuleConfig(moduleID);
    moduleConfig.configs[key] = Config()
      ..key = key
      ..val = (ConfigVal()..uint64Val = Int64(value));
    await _moduleSettingsRepository.setModuleConfig(moduleID, moduleConfig);
  }

  Future<ProtoModuleConfig> getModuleConfig(String moduleID) {
    return _moduleSettingsRepository.getModuleConfig(moduleID);
  }
}
