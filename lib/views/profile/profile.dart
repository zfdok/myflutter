import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("我的"))),
      body: Container(
        child: Text("Profile"),
      ),
    );
  }
}
