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
      appBar: new AppBar(title: new Text("想法"),centerTitle: true,),
      body: new Center(
        child: new Text("想法"),
      ),
    );
  }
}
