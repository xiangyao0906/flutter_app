import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/entity/HomeEntity.dart';
import 'package:flutter_app/ui/DeviceInfoActivity.dart';
import 'package:flutter_app/ui/QrCodeActivity.dart';
import 'package:flutter_app/ui/UiActivity.dart';
import 'package:flutter_app/ui/UriLauncherActivity.dart';

class FirstFragment extends StatefulWidget {
  @override
  FirstPageState createState() => new FirstPageState();
}

class FirstPageState extends State<FirstFragment> {
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
      body: new Container(
        child: new Padding(
          padding: new EdgeInsets.all(8.0),
          child: Text(title),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _startUiActivity,
        tooltip: '跳转到UiActivity',
        child: Icon(Icons.arrow_forward),
      ),

    );
  }

  _startUiActivity(){

//    Navigator.push(context, MaterialPageRoute(builder: (context)=> UiActivity()));
//    Navigator.push(context, MaterialPageRoute(builder: (context)=> QrActivity()));
//    Navigator.push(context, MaterialPageRoute(builder: (context)=> DeviceInfoActivity()));
//    Navigator.push(context, MaterialPageRoute(builder: (context)=> UrlLauncherActivity(title: "Uri跳转测试",)));


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
