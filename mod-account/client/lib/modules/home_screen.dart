import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Sign Up"),
              onPressed: () => Navigator.of(context).pushNamed("/signup"),
            ),
            SizedBox(
              height: 16,
            ),
            RaisedButton(
              child: Text("Settings"),
              onPressed: () => Navigator.of(context).pushNamed("/settings"),
            )
          ],
        ),
      ),
    );
  }
}
