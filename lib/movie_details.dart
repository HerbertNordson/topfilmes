import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:topfilmes/colors.dart';
import 'package:topfilmes/internal_storage.dart';
import 'package:topfilmes/movie_view.dart';

class MovieDetailsParameters {
  String imagem;
  String titulo;
  var votos;
  String data;
  String descricao;
  int id;

  MovieDetailsParameters(
      this.imagem, this.titulo, this.votos, this.data, this.descricao, this.id);
}

class MovieDetails extends StatefulWidget {
  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    final parameters =
        ModalRoute.of(context).settings.arguments as MovieDetailsParameters;
    return Container(
      color: Colors.black,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 2.3,
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 10),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.9,
                        constraints: BoxConstraints(maxWidth: 450),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.9,
                          child: Image.network(
                            parameters.imagem,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: MediaQuery.of(context).size.height * 0.06,
                        margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
                        constraints: BoxConstraints(maxWidth: 60),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            color: AppColors.gold),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MovieView()));
                          },
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              'Votlar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.black38,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    constraints: BoxConstraints(maxWidth: 450),
                    child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          "${parameters.titulo}",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.white),
                        )),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    constraints: BoxConstraints(maxWidth: 450),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          constraints: BoxConstraints(maxWidth: 120),
                          padding: EdgeInsets.all(2),
                          child: Text(
                            "${parameters.data}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 38,
                                color: AppColors.silver),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          constraints: BoxConstraints(maxWidth: 120),
                          child: Text(
                            "${parameters.votos}" + " Score",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 38,
                                color: AppColors.gold),
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            constraints: BoxConstraints(maxWidth: 120),
                            child: TextButton(
                              onPressed: () {
                                InternalStorage();

                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title:
                                            Text('Adicionando aos Favoritos'),
                                        content: Text(
                                          'Filme favoritado!',
                                          style: TextStyle(),
                                          textAlign: TextAlign.center,
                                        ),
                                      );
                                    });
                              },
                              child: Icon(
                                Icons.star,
                                color: AppColors.silver,
                                size: 80,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    constraints: BoxConstraints(maxWidth: 450),
                    child: Text(
                      "${parameters.descricao}",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
