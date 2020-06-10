import 'package:AndroidDaily/entity/models.dart';
import 'package:AndroidDaily/repository/wan_repository.dart';
import 'package:AndroidDaily/widgt/repos_item.dart';
import 'package:AndroidDaily/widgt/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flukit/flukit.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

import 'PickerImageActivity.dart';

class FirstFragment extends StatefulWidget {
  @override
  FirstPageState createState() => new FirstPageState();
}

class FirstPageState extends State<FirstFragment>
    with AutomaticKeepAliveClientMixin {
  String title = "";

  //banner
  List<BannerModel> bannerModel;

  //article
  List<ReposModel> reposModel;

  @override
  void initState() {
    super.initState();
    getData();
    getArticleData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("首页"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            buildBanner(bannerModel),
            buildRepos(context, reposModel)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _startUiActivity,
        tooltip: '跳转到UiActivity',
        child: Icon(Icons.arrow_forward),
      ),
    );
  }

  _startUiActivity() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PickerImageActivity()));
  }

  void getData() async {
    WanRepository().getBanner().then((list) {
      title = list[0].title;
      bannerModel = list;
      setState(() {
        build(context);
      });
    });
  }

  void getArticleData() async {
    WanRepository().getArticleListProject(0).then((list) {
      reposModel = list;
    });
  }

  @override
  bool get wantKeepAlive => true;
}

Widget buildRepos(BuildContext context, List<ReposModel> list) {
  if (ObjectUtil.isEmpty(list)) {
    return new Container(height: 0.0);
  }
  List<Widget> _children = list.map((model) {
    return new ReposItem(
      model,
      isHome: true,
    );
  }).toList();
  return new Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: _children,
  );
}

Widget buildBanner(List<BannerModel> bannerModel) {
  if (ObjectUtil.isEmpty(bannerModel)) {
    return new Container(height: 0.0);
  }
  return new AspectRatio(
    aspectRatio: 16.0 / 9.0,
    child: Swiper(
      indicatorAlignment: AlignmentDirectional.topEnd,
      circular: true,
      interval: const Duration(seconds: 5),
      indicator: NumberSwipeIndicator(),
      children: bannerModel.map((model) {
        return new InkWell(
          onTap: () {
            LogUtil.e("BannerModel: " + model.toString());
          },
          child: new CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: model.imagePath,
            placeholder: (context, url) => ProgressView(),
            errorWidget: (context, url, error) => new Icon(Icons.error),
          ),
        );
      }).toList(),
    ),
  );
}

class NumberSwipeIndicator extends SwiperIndicator {
  @override
  Widget build(BuildContext context, int index, int itemCount) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black45, borderRadius: BorderRadius.circular(20.0)),
      margin: EdgeInsets.only(top: 10.0, right: 5.0),
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
      child: Text("${++index}/$itemCount",
          style: TextStyle(color: Colors.white70, fontSize: 11.0)),
    );
  }
}
