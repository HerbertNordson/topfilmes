import 'package:flutter/material.dart';
import 'package:topfilmes/movie_controller.dart';
import 'package:topfilmes/movie.dart';

class MovieView extends StatefulWidget {
  @override
  _MovieViewState createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  final controller = MovieController();

  @override
  void initState() {
    super.initState();
    controller.loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<Movie>(
              future: controller.movie,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data.result.length,
                      itemBuilder: (context, index) {
                        var link = 'https://image.tmdb.org/t/p/w300' +
                            snapshot.data.result[index].urlImage;
                        return Card(
                          color: Colors.black,
                          margin: EdgeInsets.fromLTRB(50, 20, 50, 20),
                          child: Container(
                            child: Stack(
                              children: [
                                Container(
                                  child: Image.network(
                                    link,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topRight,
                                  margin: EdgeInsets.all(4),
                                  child: Container(
                                      width: 115,
                                      padding: EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: Colors.black38,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          snapshot.data.result[index].date,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      )),
                                ),
                                Container(
                                  width: 300,
                                  height: 440,
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.black38,
                                      ),
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          snapshot.data.result[index].title
                                              .toUpperCase(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                          ),
                                        ),
                                      )),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text(
                    snapshot.error,
                    style: TextStyle(fontSize: 24, color: Colors.red),
                  );
                }
                return Container();
              }),
        ],
      ),
    );
  }
}
