import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UiActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new UiActivityBody();
  }
}

class UiActivityBody extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("UiActivity"),
      ),
      body: new Container(
        width: double.infinity,
        color: Colors.deepOrange,
        padding: new EdgeInsets.all(20),
        child: MaterialButton(onPressed: () {
          Fluttertoast.showToast(
            msg: "This is Center Short Toast",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
          );
        },

          color: Colors.blue,
          focusColor: Colors.white,
        child: Text("Toast"),),

      ),
    );
  }
}
