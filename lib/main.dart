import 'package:flutter/material.dart';
import 'index.dart'; // 导入index.dart

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(

      home: new Index(), // 指定去加载 Index页面。

    );
  }
}
