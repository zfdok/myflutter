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
        body: CountCard(),
      ),
    );
  }
}

class CountCard extends StatefulWidget {
  @override
  _CountCardState createState() => _CountCardState();
}

class _CountCardState extends State<CountCard> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  child: Text("+"),
                  onPressed: () {
                    setState(() {
                      count++;
                    });
                  }),
              SizedBox(
                width: 10,
              ),
              RaisedButton(
                  child: Text("-"),
                  onPressed: () {
                    setState(() {
                      count--;
                    });
                  })
            ],
          ),
          Text("当前计数:$count",style: TextStyle(fontSize: 30),),
        ],
      ),
    );
  }
}
