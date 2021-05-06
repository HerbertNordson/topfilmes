import 'package:flutter/material.dart';
import 'package:topfilmes/colors.dart';
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
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 100,
              alignment: Alignment.center,
              color: Colors.black38,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    width: 60,
                    image: AssetImage('imagens/icone.png'),
                  ),
                  Text(
                    'Top movies'.toUpperCase(),
                    style: TextStyle(
                        color: AppColors.gold,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
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
                                    width: 60,
                                    height: 50,
                                    margin: EdgeInsets.all(8),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 50,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 4,
                                            value: snapshot
                                                    .data.result[index].vote
                                                    .toDouble() /
                                                10,
                                            backgroundColor: AppColors.silver,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    AppColors.gold),
                                          ),
                                        ),
                                        Center(
                                            child: Row(children: [
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(5, 0, 0, 0),
                                            child: Image(
                                              image: AssetImage(
                                                  'imagens/estrela.png'),
                                            ),
                                          ),
                                          Text(
                                            snapshot.data.result[index].vote
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.amber,
                                                fontSize: 20),
                                          ),
                                        ]))
                                      ],
                                    )),
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
                                      width: 300,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.black38,
                                      ),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              snapshot.data.result[index].title
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ])),
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
