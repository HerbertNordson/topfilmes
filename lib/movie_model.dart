import 'package:topfilmes/api.dart';
import 'package:topfilmes/internal_storage.dart';
import 'package:topfilmes/movie.dart';

class MovieModel {
  Future<Movie> _movie;

  Future<Movie> get movie => _movie;

  fecthMovie() {
    _movie = API().fetchMovie();
  }

  int id;
  String title;
  final InternalStorage internalStorage = InternalStorage();

  void saveUser() {
    if (id == null) return;
    if (title == null) return;

    internalStorage.saveUser(id, title);
  }
  
}
