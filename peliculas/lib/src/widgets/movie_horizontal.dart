import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {

  final List<Pelicula> peliculas;

  final _pageController = new PageController(
      initialPage: 1,
      viewportFraction: 0.3,
  );

  final Function siguientePagina;

  MovieHorizontal({@required this.peliculas, @required this.siguientePagina});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if(_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200) {
        siguientePagina();
      }
    });

    return Container(
      height: _screenSize.height * 0.20,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        itemCount: peliculas.length,
        itemBuilder: (context, i) {
          return _creaTarjeta(context, peliculas[i]);
        },
      ),
    );
  }

 Widget _creaTarjeta(BuildContext context, Pelicula pelicula) {
  pelicula.uid = '${pelicula.id}-tarjeta';
  final tarjeta = Container(
    margin: EdgeInsets.only(right: 15.0),
    child: Column(
    children: <Widget>[
      Hero(
        tag: pelicula.uid,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: FadeInImage(
          image:  NetworkImage(pelicula.getPosterImg()),
            placeholder: AssetImage('assets/no-image.jpg'),
            fit: BoxFit.cover,
            height: 100.0,
            ),
          ),
      ),
        SizedBox(),
        Center(
          child: Text(
          pelicula.title,
          style: TextStyle(fontSize: 8),
          )
        )
      ],
    )
  ); 
  return GestureDetector(
    child: tarjeta,
    onTap: (){
      Navigator.pushNamed(context, 'detalle', arguments: pelicula);
    },
  );
 }

 List<Widget> _tarjetas() {
   return peliculas.map((pelicula) {
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image:  NetworkImage(pelicula.getPosterImg()),
                placeholder: AssetImage('assets/no-image.jpg'),
                fit: BoxFit.cover,
                height: 100.0,
              ),
            ),
            SizedBox(),
            Center(
              child: Text(
                pelicula.title,
                style: TextStyle(fontSize: 8),
                )
            )
          ],
        )
      ); 
   }).toList();
 }
}