import 'package:hive/hive.dart';
import 'package:mod_settings/src/api/settings.pb.dart';


class HiveProtoModuleConfigAdapter extends TypeAdapter<ProtoModuleConfig>{
  @override
  final typeId = 1;

  @override
  ProtoModuleConfig read(BinaryReader reader) {
    return ProtoModuleConfig.fromBuffer(reader.read());
  }

  @override
  void write(BinaryWriter writer, ProtoModuleConfig obj) {
    writer.write(obj.writeToBuffer());
  }
}
