import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/pelicula_provider.dart';
import 'package:peliculas/src/search/search_delegate.dart';
import 'package:peliculas/src/widgets/card_swipper_widget.dart';
import 'package:peliculas/src/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {

  final PeliculaProvider peliculasProvider = new PeliculaProvider();

  @override
  Widget build(BuildContext context) {
    peliculasProvider.getPopular();

    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en cines'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(
                context: context,
                delegate: DataSearch()
              );
            },
            )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swipperDetarjetas(),
            _footer(context)
          ],
        ),
      )
    );
  }

  Widget _swipperDetarjetas() {
    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if(snapshot.hasData)
          return CardSwipper(peliculas: snapshot.data);
        else
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator()
            )
          );
      },
    );
  }

  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left:20.0),
            child: Text(
              'Populares',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          SizedBox(height: 10.0,),
          StreamBuilder(
            stream: peliculasProvider.popularesStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.hasData) {
                return MovieHorizontal(peliculas: snapshot.data, siguientePagina: peliculasProvider.getPopular,);
              }
              else {
              return Container(
                  height: 400.0,
                  child: Center(
                  child: CircularProgressIndicator()
                  )
                );
              }
            },
          ),
        ],
      ),
    );
  }
}