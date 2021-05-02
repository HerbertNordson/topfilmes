import 'package:topfilmes/api.dart';
import 'package:topfilmes/movie.dart';

class MovieModel {
  Future<Movie> _movie;

  Future<Movie> get movie => _movie;

  fecthMovie() {
    _movie = API().fetchMovie();
  }
}
