import 'package:flutter/material.dart';
import 'package:sys_core/sys_core.dart';

class SettingsViewNew extends StatefulWidget {
  final CoreSettingsService coreSettings;

  const SettingsViewNew({Key key, @required this.coreSettings})
      : assert(coreSettings != null),
        super(key: key);

  @override
  _SettingsViewNewState createState() => _SettingsViewNewState();
}

class _SettingsViewNewState extends State<SettingsViewNew> {
  CoreSettingsService _coreSettings;

  @override
  void initState() {
    super.initState();
    print("widget.coresettings: ${widget.coreSettings}");
    _coreSettings = widget.coreSettings;

    if (_coreSettings != null) {
      _coreSettings.addListener(_updateUI);
    } else {
      print("CoreSettingsSerive is null!");
    }
  }

  @override
  void dispose() {
    super.dispose();
    _coreSettings.removeListener(_updateUI);
  }

  _updateUI() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_coreSettings.moduleConfigs.isEmpty)
      return Scaffold(
        body: Center(
          child: Text("No settings found"),
        ),
      );

    var moduleSettings = _coreSettings.moduleConfigs.first;

    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: AspectRatio(
          aspectRatio: 0.5,
          child: ListView(
            children: <Widget>[
              for (moduleSettings in _coreSettings.moduleConfigs)
                ..._getModuleSettingsList(moduleSettings),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getModuleSettingsList(ModuleConfig moduleSettings) {
    return [
      ListTile(
        title: Text(
          moduleSettings.moduleName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      ...moduleSettings.configItems.map((item) {
        if (item is ModuleConfigItemBool) {
          return SwitchListTile(
              title: Text(item.description),
              value: moduleSettings.getBoolValue(item.key),
              onChanged: (v) => moduleSettings.setBoolValue(item.key, v));
        } else if (item is ModuleConfigItemDropdown) {
          return ListTile(
            title: Text(item.description),
            trailing: DropdownButton<int>(
              value: item.value,
              onChanged: (int value) {
                moduleSettings.setIntValue(item.key, value);
              },
              items: item.items
                  .map((String v) => DropdownMenuItem<int>(
                        value: item.items.indexOf(v),
                        child: Text(v),
                      ))
                  .toList(),
            ),
            onTap: () {},
          );
        } else {
          throw UnimplementedError();
        }
      }).toList(),
      Divider(
        color: Colors.black,
        thickness: 3,
      ),
    ];
  }
}
