import 'package:flutter/material.dart';
import 'package:flutterapplearn/models/home_model.dart';
class MovieTile extends StatelessWidget {
  final MovieItem movie;
  MovieTile(this.movie);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            NoIndex(movie.rank),
            SizedBox(
              height: 10,
            ),
            MovieDetail(movie),
            MovieFoot(movie.originalTitle),
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
  final MovieItem movie;
  MovieDetail(this.movie);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            movie.imageURL,
            width: 90,
          ),
        ),
        Expanded(child: Container(
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
                  Text(movie.title,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Text(
                    "(${movie.playDate})",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              ComStars(movie.rating),
              Text(movie.genres.toString()+movie.director.name)
            ],
          ),
        ),),
        Container(
          width: 80,
          padding: EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
              IconButton(
            icon: Icon(Icons.favorite), onPressed: null),
            Text("想看")
            ],
          )
        )
      ],
    );
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
class MovieFoot extends StatelessWidget {
  final String node;
  MovieFoot(this.node);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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