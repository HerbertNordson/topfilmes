import 'package:flutter/material.dart';
import 'package:topfilmes/movie.dart';
import 'package:topfilmes/movie_controller.dart';

class MovieView extends StatefulWidget {
  @override
  _MovieViewState createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  final controller = MovieController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<Movie>(
            future: controller.movie,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  snapshot.data.titulo,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}
