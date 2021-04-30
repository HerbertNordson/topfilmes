import 'dart:math';
import 'package:topfilmes/movie.dart';
import 'package:topfilmes/movie_model.dart';

class MovieController {
  final model = MovieModel();

  Future<Movie> get movie => model.movie;

  loadMovies() {
    model.fecthMovies();
  }
}
