import 'package:hive/hive.dart';
import 'package:sys_core/src/api/settings.pb.dart';

abstract class ModuleSettingsRepository {
  Future<ProtoModuleConfig> getModuleConfig(String moduleID);

  Future setModuleConfig(String moduleID, ProtoModuleConfig config);

  void dispose();
}

class LocalModuleSettingsRepository extends ModuleSettingsRepository {
  static final String boxName = "LocalModuleSettingsRepository";
  Future<Box> _boxOpener;
  Box _box;

  LocalModuleSettingsRepository() {
    _boxOpener = Hive.openBox(boxName);
    _boxOpener.then((value) => _box = value);
  }

  Future<void> _ensureBoxOpened() async {
    if (_box == null) await _boxOpener;
  }

  Future<ProtoModuleConfig> getModuleConfig(String moduleID) async {
    await _ensureBoxOpened();
    ProtoModuleConfig moduleConfig = _box.get(moduleID);
    if (moduleConfig == null) {
      moduleConfig = ProtoModuleConfig();
      _box.put(moduleID, moduleConfig);
    }
    return moduleConfig;
  }

  Future setModuleConfig(
      String moduleID, ProtoModuleConfig moduleConfig) async {
    await _ensureBoxOpened();
    _box.put(moduleID, moduleConfig);
  }

  @override
  void dispose() {
    _box?.close();
  }
}

