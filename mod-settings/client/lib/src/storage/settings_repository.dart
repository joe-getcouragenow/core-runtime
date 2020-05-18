import 'package:flutter/cupertino.dart';
import 'package:mod_settings/src/api/baseproto.pb.dart';

//import 'package:hive/hive.dart';
import 'package:mod_settings/src/api/settings.pb.dart';

abstract class ModuleSettingsRepository {
  Future<ProtoModuleConfig> getModuleConfig(String moduleID);

  Future setModuleConfig(String moduleID, ProtoModuleConfig config);

  void dispose();
}

class MockModuleSettingsRepository extends ModuleSettingsRepository {
  Future<void> _jsonLoader;
  List<ProtoModuleConfig> moduleConfigs;

  MockModuleSettingsRepository() {
    _jsonLoader = _loadAsset();
  }

  Future<void> _loadAsset() async {
    // String result =
    //     await DefaultAssetBundle.of(context).loadString("assets/data.json");
    var test = ProtoModuleConfig()
      ..moduleId = "test"
      ..configs["bool2"] = (ConfigVal()..boolVal = true);

    print("test : ${test.writeToJson()}");

    String result = """
{"1":"test","2":[{"1":"key-bool2","2":{"5":true}},{"1":"key-bool","2":{"5":false}}]}  
  """;
    moduleConfigs = List();
    moduleConfigs.add(ProtoModuleConfig.fromJson(result));
  }

  Future<void> _ensureJsonIsLoaded() async {
    if (moduleConfigs == null) await _jsonLoader;
  }

  @override
  Future<ProtoModuleConfig> getModuleConfig(String moduleID) async {
    await _ensureJsonIsLoaded();
    print("getModuleConfig: ${moduleConfigs.first}");
    return moduleConfigs.first;
  }

  @override
  Future setModuleConfig(String moduleID, ProtoModuleConfig config) async {
    await _ensureJsonIsLoaded();
    moduleConfigs.removeLast();
    moduleConfigs.add(config);
  }

  @override
  void dispose() {}
}
/*
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
 */
