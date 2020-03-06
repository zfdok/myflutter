import 'package:flutter/material.dart';


class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("我的"))),
      body: Container(
        child: TestHttp(),
      ),
    );
  }
}

class TestHttp extends StatefulWidget {
  @override
  _TestHttpState createState() => _TestHttpState();
}

class _TestHttpState extends State<TestHttp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('notnow'),
    );
  }
}
