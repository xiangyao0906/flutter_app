import 'package:flutter/material.dart';

class SencondPage extends StatefulWidget {
  @override
  SencondPageState createState() => new SencondPageState();
}

class SencondPageState extends State<SencondPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("想法"),
          centerTitle: true,
        ),
        body: new Column(
          children: <Widget>[
            Text('Deliver features faster'),
            Text('Craft beautiful UIs'),
            Expanded(
              child: FittedBox(
                fit: BoxFit.contain, // otherwise the logo will be tiny
                child: const FlutterLogo(),
              ),
            ),
          ],
        ));
  }
}
