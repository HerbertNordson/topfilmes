import 'dart:async';

import 'package:topfilmes/movie.dart';
import 'package:topfilmes/movie_model.dart';

class MovieViewModel {
  final model = MovieModel();

  Future<Movie> get movie => model.movie;

  StreamController<Movie> streamFilmes = StreamController();

  loadMovies() {
    model.fecthMovie();
    model.movie.then((value) => {
          streamFilmes.add(value),
        });
  }
}
