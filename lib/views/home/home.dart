
import 'package:flutterapplearn/models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutterapplearn/network/request.dart';
import 'package:flutterapplearn/views/home/homecomponents/movietile.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("首页"))),
      body: HttpRev(),
    );
  }
}

class HttpRev extends StatefulWidget {
  @override
  _HttpRevState createState() => _HttpRevState();
}

class _HttpRevState extends State<HttpRev> {
  List<MovieItem> movieItems = [];
  @override
  void initState() {
    super.initState();
    HttpRequest.request(
            "https://douban.uieee.com/v2/movie/top250?start=0&count=20")
        .then((res) {
      setState(() {
        final subjects = res.data["subjects"];
        List<MovieItem> movies = [];
        for (var item in subjects) {
          movies.add(MovieItem.fromMap(item));
        }
        this.movieItems = movies;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: movieItems.length,
        itemBuilder: (context, index) {
          return MovieTile(movieItems[index]);
        });
  }
}
