import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final List<String> entries = <String>['A', 'B', 'C'];
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
                    Fluttertoast.showToast(
                      msg: "This is Center Short Toast $index",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    child: Text("$index"),
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
