import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/entity/HomeEntity.dart';

class Firstpage extends StatefulWidget {
  @override
  FirstPageState createState() => new FirstPageState();
}

class FirstPageState extends State<Firstpage> {
  HomeEntity entity;
  String title = "";

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("首页"),
        centerTitle: true,
      ),
      body: new Center(
        child: new Padding(
          padding: new EdgeInsets.all(8.0),
          child: Text(title),
        ),
      ),
    );
  }

  void getData() async {
    Response response =
        await Dio().get("http://app3.qdaily.com/app3/columns/index/29/0.json");
    entity = HomeEntity.fromJson(response.data);

    setState(() {
      if (entity != null) {
        title = entity.response.feeds[0].post.description;
      }
    });
  }
}
