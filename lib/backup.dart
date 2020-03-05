import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Movie {
  int id;
  double rate;
  String title;
  String publishDate;
  List<String> tags;
  String node;
  bool liked;
  String imgurl;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("首页"),
          ),
        ),
        body: Page1(),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
              title: Text("data"),
              icon: Icon(Icons.favorite_border),
              activeIcon: Icon(Icons.favorite)),
          BottomNavigationBarItem(
              title: Text("data"),
              icon: Icon(Icons.favorite_border),
              activeIcon: Icon(Icons.favorite)),
        ]),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          MoiveCard(
              id: 1,
              rate: 9.8,
              title: "肖申克的救赎",
              publishDate: "1995",
              tags: ['犯罪', "剧情"],
              node: "异步经典的影片",
              liked: false,
              imgurl:
                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1583381669688&di=7ab3851c1e82da4a7210b7b652c58bf4&imgtype=0&src=http%3A%2F%2Fimg2.mtime.cn%2Fup%2F1965%2F939965%2F784FC6CA-2372-4F00-B5EE-BEDEDB34A609_500.jpg"),
          MoiveCard(
              id: 2,
              rate: 9.6,
              title: "霸王别姬",
              publishDate: "1993",
              tags: ['剧情', "爱情"],
              node: "霸王别姬",
              liked: false,
              imgurl:
                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1583392484136&di=ecb12c56f5d90ad270aab0feab96784f&imgtype=0&src=http%3A%2F%2Fp1.meituan.net%2Fmovie%2F67d30e5f52b81eef1d1a9c77c7d2fbb330458.jpg%40750w_1l"),
          MoiveCard(
              id: 3,
              rate: 9.5,
              title: "阿甘正传",
              publishDate: "1994",
              tags: ['爱情', "剧情"],
              node: "不要停止奔跑",
              liked: false,
              imgurl:
                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1583392548218&di=a83b39603dbfcca22ba878fb90388818&imgtype=0&src=http%3A%2F%2Fa4.att.hudong.com%2F65%2F28%2F300438640458133058288467642.jpg"),
        ],
      ),
    );
  }
}

class MoiveCard extends StatelessWidget {
  final int id;
  final double rate;
  final String imgurl;
  final String title;
  final String publishDate;
  final List<String> tags;
  final String node;
  final bool liked;

  MoiveCard(
      {this.id,
      this.rate,
      this.imgurl,
      this.title,
      this.publishDate,
      this.tags,
      this.node,
      this.liked});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            NoIndex(id),
            SizedBox(
              height: 10,
            ),
            MovieDetail(imgurl, rate, title, publishDate, tags, liked),
            MovieFoot(node),
          ],
        ),
      ),
    );
  }
}

class NoIndex extends StatelessWidget {
  final int no;
  NoIndex(this.no);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(2),
      child: Container(
        padding: EdgeInsets.fromLTRB(8, 3, 8, 3),
        color: Colors.amber,
        child: Text("No.$no"),
      ),
    );
  }
}

class MovieDetail extends StatelessWidget {
  final double rate;
  final String imgurl;
  final String title;
  final String publishDate;
  final List<String> tags;
  final bool liked;
  MovieDetail(this.imgurl, this.rate, this.title, this.publishDate, this.tags,
      this.liked);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            imgurl,
            width: 90,
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.play_circle_outline,
                    color: Colors.redAccent,
                  ),
                  Text(title,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Text(
                    "($publishDate)",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              ComStars(rate),
              MovieTag(tags)
            ],
          ),
        ),
        Expanded(
            child: DottedLineWidget(
          axis: Axis.vertical,
          height: 120,
          width: 1,
          count: 10,
          lineHeight: 8,
          lineWidth: 1,
          color: Colors.black45,
        )),
        LikedBtn(liked),
      ],
    );
  }
}

class LikedBtn extends StatefulWidget {
  final bool liked;
  LikedBtn(this.liked);
  @override
  _LikedBtnState createState() => _LikedBtnState();
}

class _LikedBtnState extends State<LikedBtn> {
  bool liked = true;
  IconData beLiked() {
    if (liked) return Icons.favorite_border;
    return Icons.favorite;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 70,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
                icon: Icon(
                  beLiked(),
                  color: Colors.amber,
                ),
                onPressed: () {
                  setState(() {
                    liked = !liked;
                  });
                }),
            SizedBox(
              height: 5,
            ),
            Text(
              "想看",
              style: TextStyle(color: Colors.amber),
            )
          ],
        ));
  }
}

class ComStars extends StatelessWidget {
  final double rate;
  ComStars(this.rate);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.star,
                size: 20,
              ),
              Icon(
                Icons.star,
                size: 20,
              ),
              Icon(
                Icons.star,
                size: 20,
              ),
              Icon(
                Icons.star,
                size: 20,
              ),
              Icon(
                Icons.star,
                size: 20,
              )
            ],
          ),
          Text("$rate")
        ],
      ),
    );
  }
}

class MovieTag extends StatelessWidget {
  final List<String> tags;
  String tagmaker() {
    String strtemp = '';
    for (var item in tags) {
      strtemp = strtemp + '/' + item;
      print(strtemp);
    }
    return strtemp;
  }

  MovieTag(this.tags);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(tagmaker()),
    );
  }
}

class DottedLineWidget extends StatelessWidget {
  final Axis axis; // 虚线的方向
  final double width; // 整个虚线的宽度
  final double height; // 整个虚线的高度
  final double lineWidth; // 每根虚线的宽度
  final double lineHeight; // 每根虚线的高度
  final int count; // 虚线内部实线的个数
  final Color color; // 虚线的颜色

  DottedLineWidget({
    Key key,
    @required this.axis,
    this.width,
    this.height,
    this.lineWidth,
    this.lineHeight,
    this.count,
    this.color = const Color(0xffff0000),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Flex(
            direction: this.axis,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(this.count, (int index) {
              return SizedBox(
                width: this.lineWidth,
                height: this.lineHeight,
                child:
                    DecoratedBox(decoration: BoxDecoration(color: this.color)),
              );
            }),
          );
        },
      ),
    );
  }
}

class MovieFoot extends StatelessWidget {
  final String node;
  MovieFoot(this.node);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(5)),
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      padding: EdgeInsets.all(10),
      child: Text(
        node,
        style: TextStyle(color: Colors.black54),
      ),
    );
  }
}
