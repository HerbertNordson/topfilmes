import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:topfilmes/movie.dart';

class API {
  String _autorization = 'api.themoviedb.org';
  String _path = '/3/movie/upcoming';

  Future<Movie> fecthMovie() async {
    final response = await http.get(
      Uri.https(_autorization, _path,
          {'api_key': 'a5bc05fb630c9b7fdc560033345fa13e'}),
    );

    if (response.statusCode == 200) {
      return Movie.fromJson(jsonDecode(response.body));
    } else {
      return Future.error('Error: Movie Not Found');
    }
  }
}
/*



*/