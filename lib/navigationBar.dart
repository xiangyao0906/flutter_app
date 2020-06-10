import 'package:AndroidDaily/ui/HomePage.dart';
import 'package:AndroidDaily/ui/IdeaPage.dart';
import 'package:AndroidDaily/ui/MinePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 创建一个 带有状态的 Widget Index
class HomeWidget extends StatefulWidget {
  //  固定的写法
  @override
  State<StatefulWidget> createState() => new _HomeWidgetState();
}

// 要让主页面 Index 支持动效，要在它的定义中附加mixin类型的对象TickerProviderStateMixin
class _HomeWidgetState extends State<HomeWidget> {
  int _currentIndex = 0; // 当前界面的索引值
  PageController _pageController = PageController(initialPage: 0);
  DateTime lastTime;


  @override
  Widget build(BuildContext context) {
    // 声明定义一个 底部导航的工具栏
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
        items: [
          _bottomItem("首页", 'assets/images/ic_home_normal.png',
              'assets/images/ic_home_selected.png', 0),
          _bottomItem("想法", 'assets/images/ic_discovery_normal.png',
              'assets/images/ic_discovery_selected.png', 1),
          _bottomItem(
              "我的", 'assets/images/ic_mine_normal.png', 'assets/images/ic_mine_selected.png', 2)
        ],
        currentIndex: _currentIndex, // 当前点击的索引值
        type: BottomNavigationBarType.fixed, // 设置底部导航工具栏的类型：fixed 固定
        onTap: (int index) {
          _pageController.jumpToPage(index);
          // 添加点击事件
          setState(() {
            // 点击之后，需要触发的逻辑事件
            _currentIndex = index;
          });
        });

    return new MaterialApp(
      home: new Scaffold(
        body: new WillPopScope(
            child: Scaffold(
              body: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  FirstFragment(),
                  SencondFragment(),
                  ThirdFragment()
                ],
              ),
            ),
            onWillPop: _onWillPop),
        bottomNavigationBar: bottomNavigationBar, // 底部工具栏
      ),
      theme: new ThemeData(
        primarySwatch: Colors.blue, // 设置主题颜色
      ),
    );
  }

  _bottomItem(String title, String normalIcon, String selectIcon, int index) {
    return BottomNavigationBarItem(
      icon: Image.asset(normalIcon, width: 24, height: 24),
      activeIcon: Image.asset(selectIcon, width: 24, height: 24),
      title: Padding(
          padding: EdgeInsets.only(top: 5),
          child: Text(title,
              style: TextStyle(
                  color:
                  Color(_currentIndex == index ? 0xff000000 : 0xff9a9a9a),
                  fontSize: 14))),
    );
  }

  Future<bool> _onWillPop() async {
    if (lastTime == null ||
        DateTime.now().difference(lastTime) > Duration(seconds: 2)) {
      lastTime = DateTime.now();
      return false;
    } else {
      SystemNavigator.pop();
      return true;
    }
  }
}
