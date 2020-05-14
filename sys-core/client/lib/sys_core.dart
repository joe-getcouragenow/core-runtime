library syscore;

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sys_core/src/settings/modules/hive_proto_module_config_adapter.dart';

export 'package:sys_core/src/device_utils.dart';
export 'package:sys_core/src/i18n/languages.dart';
export 'package:sys_core/src/widgets/gc_master_detail.dart';
export 'package:sys_core/src/settings/core_settings.dart';

coreInit() async {
  Hive.initFlutter();
  Hive.registerAdapter(HiveProtoModuleConfigAdapter());
}