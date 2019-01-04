import 'package:flutter/material.dart';

class Firstpage extends StatefulWidget {
  @override
  FirstPageState createState() => new FirstPageState();
}

class FirstPageState extends State<Firstpage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text("首页"),centerTitle: true,),
      body: new Center(
        child: new Text("首页"),
      ),
    );
  }
}
