import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SencondFragment extends StatefulWidget {
  @override
  SencondFragmentState createState() => new SencondFragmentState();
}

class SencondFragmentState extends State<SencondFragment> {
  @override
  Widget build(BuildContext context) {
    var img="http://ggda.oss-cn-beijing.aliyuncs.com/introduction/5433184b1a3fc984d572d82ce9b4d4ef.jpg";
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("想法"),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 10,
            //设置shape，这里设置成了R角
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            //对Widget截取的行为，比如这里 Clip.antiAlias 指抗锯齿
            clipBehavior: Clip.antiAlias,
            semanticContainer: false,

            child: Container(
              child: Image.network(img
              ,fit: BoxFit.fitWidth,
                width: double.maxFinite,
                height: 130,
              )
            ),
          ),
        ));
  }
}
