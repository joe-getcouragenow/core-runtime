import 'package:flutter/material.dart';

class AccountSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: AspectRatio(
        aspectRatio: 0.5,
        child: Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    color: (Theme.of(context).brightness == Brightness.light)
                        ? Colors.black.withOpacity(0.2)
                        : Colors.white.withOpacity(0.2),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            child: Text("J"),
                            minRadius: 40,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          RaisedButton(
                            child: Text("Set profile photo"),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("John"),
                    subtitle: Text("Name"),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text("+1193384"),
                    subtitle: Text("Phone number"),
                  ),
                  ListTile(
                    leading: Icon(Icons.alternate_email),
                    title: Text("@johnny"),
                    subtitle: Text("Username"),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      maxLength: 70,
                      decoration: InputDecoration(hintText: "Bio"),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
