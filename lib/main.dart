import 'package:flutter/material.dart';
import 'package:flutterapplearn/views/group/group.dart';
import 'package:flutterapplearn/views/mall/mall.dart';
import 'package:flutterapplearn/views/profile/profile.dart';
import 'package:flutterapplearn/views/subject/subject.dart';
import './components/my_bottom_bar.dart';
import './views/home/home.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
      theme: ThemeData(primaryColor: Colors.green),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          MyHome(),
          MySubject(),
          MyGroup(),
          MyMall(),
          MyProfile()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          MyBottomBar('首页', Icon(Icons.home), Icon(Icons.home)),
          MyBottomBar('影音', Icon(Icons.movie), Icon(Icons.movie_filter)),
          MyBottomBar('小组', Icon(Icons.group), Icon(Icons.group_work)),
          MyBottomBar(
              '市场', Icon(Icons.local_mall), Icon(Icons.store_mall_directory)),
          MyBottomBar('我的', Icon(Icons.person_outline), Icon(Icons.person)),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
