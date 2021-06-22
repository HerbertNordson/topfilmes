import 'package:flutter/material.dart';
import 'package:topfilmes/colors.dart';
import 'package:topfilmes/movie_controller.dart';
import 'package:topfilmes/movie.dart';
import 'package:topfilmes/movie_details.dart';

class MovieView extends StatefulWidget {
  @override
  _MovieViewState createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  final controller = MovieViewModel();

  @override
  void initState() {
    super.initState();
    controller.loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black87,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.1,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    width: MediaQuery.of(context).size.width * 0.1,
                    image: AssetImage('imagens/icone.png'),
                  ),
                  FittedBox(
                    fit: BoxFit.fill,
                    child: Text(
                      'Top movies'.toUpperCase(),
                      style: TextStyle(
                          color: AppColors.gold, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )),
          StreamBuilder<Movie>(
              stream: controller.streamFilmes.stream,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.active) {
                  return CircularProgressIndicator();
                }

                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data.result.length,
                      itemBuilder: (context, index) {
                        return Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.7,
                            margin: EdgeInsets.fromLTRB(0, 40, 0, 40),
                            constraints: BoxConstraints(maxWidth: 450),
                            child: InkWell(
                              child: Card(
                                color: Colors.transparent,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                10,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        child: Image.network(
                                          'https://image.tmdb.org/t/p/w300' +
                                              snapshot
                                                  .data.result[index].urlImage,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Container(
                                          margin: EdgeInsets.all(8),
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.1,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.1,
                                                constraints: BoxConstraints(
                                                    maxWidth: 100,
                                                    minWidth: 80),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  child:
                                                      CircularProgressIndicator(
                                                    strokeWidth: 4,
                                                    value: snapshot.data
                                                            .result[index].vote
                                                            .toDouble() /
                                                        10,
                                                    backgroundColor:
                                                        AppColors.silver,
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                                Color>(
                                                            AppColors.gold),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                  child: Row(children: [
                                                Container(
                                                  child: Image(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        'imagens/estrela.png'),
                                                  ),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.08,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.1,
                                                  constraints: BoxConstraints(
                                                    maxWidth: 80,
                                                    minWidth: 60,
                                                    maxHeight: 100,
                                                  ),
                                                  child: FittedBox(
                                                    fit: BoxFit.contain,
                                                    child: Text(
                                                      snapshot.data
                                                          .result[index].vote
                                                          .toString(),
                                                      style: TextStyle(
                                                        color: Colors.amber,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]))
                                            ],
                                          )),
                                      Container(
                                        alignment: Alignment.topRight,
                                        margin: EdgeInsets.all(4),
                                        child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            padding: EdgeInsets.all(6),
                                            constraints: BoxConstraints(
                                              maxWidth: 200,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.black38,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: Text(
                                                snapshot
                                                    .data.result[index].date,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            )),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomCenter,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1,
                                            decoration: BoxDecoration(
                                              color: Colors.black38,
                                            ),
                                            child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: Text(
                                                snapshot
                                                    .data.result[index].title
                                                    .toUpperCase(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                final parameters = MovieDetailsParameters(
                                    'https://image.tmdb.org/t/p/w300' +
                                        snapshot.data.result[index].urlImage,
                                    snapshot.data.result[index].title,
                                    snapshot.data.result[index].vote,
                                    snapshot.data.result[index].date,
                                    snapshot.data.result[index].description);
                                Navigator.pushNamed(context, 'Details',
                                    arguments: parameters);
                              },
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
