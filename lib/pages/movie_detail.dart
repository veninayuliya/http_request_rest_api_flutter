// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:http_request_rest_api_flutter/models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath;
    } else {
      path =
          'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Details"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.orange, Colors.yellow]),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  height: height / 1.5,
                  child: Image.network(path),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
                  child: Text(
                    movie.title,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  child: Text(
                    movie.overview,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ),
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 30),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
