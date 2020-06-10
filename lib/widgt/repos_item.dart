import 'package:AndroidDaily/entity/models.dart';
import 'package:AndroidDaily/navigator_util.dart';
import 'package:AndroidDaily/res/colors.dart';
import 'package:AndroidDaily/res/styles.dart';
import 'package:AndroidDaily/utils.dart';
import 'package:AndroidDaily/widgt/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ReposItem extends StatelessWidget {
  const ReposItem(
    this.model, {
    this.labelId,
    Key key,
    this.isHome,
  }) : super(key: key);
  final String labelId;
  final ReposModel model;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {
        NavigatorUtil.pushWeb(context,
            title: model.title, url: model.link, isHome: isHome);
      },
      child: new Container(
          height: 160.0,
          padding: EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 10),
          child: new Row(
            children: <Widget>[
              new Expanded(
                  child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    model.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.listTitle,
                  ),
                  Gaps.vGap10,
                  new Expanded(
                    flex: 1,
                    child: new Text(
                      model.desc,
                      maxLines: 3,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.listContent,
                    ),
                  ),
                  Gaps.vGap5,
                  new Row(
                    children: <Widget>[

                      new Text(
                        model.author,
                        style: TextStyles.listExtra,
                      ),
                      Gaps.hGap10,
                      new Text(
                        Utils.getTimeLine(context, model.publishTime),
                        style: TextStyles.listExtra,
                      ),
                    ],
                  )
                ],
              )),
              new Container(
                width: 72,
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 10.0),
                child: new CachedNetworkImage(
                  width: 72,
                  height: 128,
                  fit: BoxFit.fill,
                  imageUrl: model.envelopePic,
                  placeholder: (BuildContext context, String url) {
                    return new ProgressView();
                  },
                  errorWidget:
                      (BuildContext context, String url, Object error) {
                    return new Icon(Icons.error);
                  },
                ),
              )
            ],
          ),
          decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border(
                  bottom:
                      new BorderSide(width: 0.33, color: Colours.divider)))),
    );
  }
}
