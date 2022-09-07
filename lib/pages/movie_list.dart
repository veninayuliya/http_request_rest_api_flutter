import 'package:flutter/material.dart';
import 'package:http_request_rest_api_flutter/pages/movie_detail.dart';
import 'package:http_request_rest_api_flutter/service/http_service.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int? moviesCount;
  late List movies;
  late HttpService service;

  String imgPath = 'https://image.tmdb.org/t/p/w500';

  Future initialize() async {
    movies = [];
    movies = (await service.getPopularMovies())!;
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Popular Movies"),
        ),
        body: ListView.builder(
          itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
          itemBuilder: (context, int position) {
            return Card(
              color: Colors.teal[200],
              elevation: 2.0,
              child: ListTile(
                leading: Image.network(imgPath + movies[position].posterPath),
                title: Text(movies[position].title),
                subtitle: Text(
                  'Rating = ' + movies[position].voteAverage.toString(),
                ),
                onTap: () {
                  MaterialPageRoute route = MaterialPageRoute(
                      builder: (_) => MovieDetail(movies[position]));
                  Navigator.push(context, route);
                },
              ),
            );
          },
        ));
  }
}
