import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("data"),
        ),
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  MyWidget() {
    print("MyWidget的构造函数被调用");
  }
  @override
  _MyWidgetState createState() {
    print("MyWidget的createState函数被调用");
    return _MyWidgetState();
  }
}

class _MyWidgetState extends State<MyWidget> {
  int counter = 0;
  _MyWidgetState() {
    print("_MyWidgetState的构造函数被调用");
  }
  void initState() {
    super.initState();
    print("_MyWidgetState的initState函数被调用");
  }

  @override
  void didChangeDependencies() {
    print("_MyWidgetState的didChangeDependencies函数被调用");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(MyWidget oldWidget) {
    print("_MyWidgetState的didUpdateWidget函数被调用");
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print("_MyWidgetState的build函数被调用");
    return Center(
      child: Column(
        children: <Widget>[
          RaisedButton(
              child: Text("+"),
              onPressed: () {
                setState(() {
                  counter++;
                });
              }),
          Text("counter:$counter")
        ],
      ),
    );
  }
}
