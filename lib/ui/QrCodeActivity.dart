import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrActivity extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new QrBody();
  }
}

class QrBody extends State{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: QrImage(
          data: "https://pub.dev/packages/qr_flutter#-readme-tab-",
          size: 200,
          version: QrVersions.auto,
        ),
      ),
    );
  }
}