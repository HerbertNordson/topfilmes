class Movie {
  String titulo;

  Movie.fromJson(Map<String, dynamic> json) {
    titulo = json['title'];
  }
}
