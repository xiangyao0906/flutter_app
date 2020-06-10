import 'package:AndroidDaily/ui/DeviceInfoActivity.dart';
import 'package:AndroidDaily/ui/PickerImageActivity.dart';
import 'package:AndroidDaily/ui/QrCodeActivity.dart';
import 'package:AndroidDaily/ui/UiActivity.dart';
import 'package:AndroidDaily/ui/UriLauncherActivity.dart';
import 'package:flutter/material.dart';


final List<String> entries = <String>['UiActivity', 'QrActivity', 'DeviceInfoActivity',"PickerImageActivity","UrlLauncherActivity"];
final List<int> colorCodes = <int>[600, 500, 100];



class ThirdFragment extends StatefulWidget {
  @override
  ThirdFragmentState createState() => new ThirdFragmentState();
}

class ThirdFragmentState extends State<ThirdFragment> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("我的"),
        centerTitle: true,
      ),
      body: new Column(
        children: <ListView>[
          ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 10,
                //设置shape，这里设置成了R角
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                //对Widget截取的行为，比如这里 Clip.antiAlias 指抗锯齿
                clipBehavior: Clip.antiAlias,
                semanticContainer: false,
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    switch(index){
                      case 0:
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> UiActivity()));
                        break;
                      case 1:
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> QrActivity()));
                        break;
                      case 2:
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> DeviceInfoActivity()));
                        break;
                      case 3:
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => PickerImageActivity()));
                        break;
                      case 4:Navigator.push(context, MaterialPageRoute(builder: (context)=>UrlLauncherActivity(title:"Url跳轉",)));
                        break;
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    child: Text(entries[index]),
                    height: 50,
                    decoration: new BoxDecoration(
                        color: Color.fromARGB(255, 112, 122, 133)),
                  ),
                ),
              );
            },
            shrinkWrap: true,
          )
        ],
      ),
    );
  }
}
