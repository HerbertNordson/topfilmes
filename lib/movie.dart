class Movie {
  List<Results> result;

  Movie.fromJson(Map<String, dynamic> json) {
    var arrayResult = json["results"] as List;

    result = arrayResult.map((lista) {
      return Results.fromJson(lista);
    }).toList();
  }
}

class Results {
  String title;
  String urlImage;
  String date;
  var vote;

  Results.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    urlImage = json["poster_path"];
    date = json["release_date"];
    vote = json["vote_average"];
  }
}
