import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/pelicula_provider.dart';

class DataSearch extends SearchDelegate {

  final peliculas = ['TLOS', 'Titanic'];

  final peliculasRecientes = ['Hola', 'Tes'];

  final peliculasProvider = new PeliculaProvider();

  @override
  List<Widget> buildActions(BuildContext context) {
      return [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: (){
            query = '';
          },
        ),
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: (){
          close(context, null);
        },
      );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      return Container();
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
      if(query.isEmpty) return Container();

      return FutureBuilder(
        future: peliculasProvider.buscarPelicula(query),
        builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
          if(snapshot.hasData) {
            final peliculas = snapshot.data;
            return ListView(
              children: peliculas.map( (pelicula) {
                return ListTile(
                  leading: FadeInImage(
                    image: NetworkImage(pelicula.getPosterImg()),
                    placeholder: AssetImage('assets/loading.gif'),
                    width: 50.0,
                    fit: BoxFit.contain,
                  ),
                  title: Text(pelicula.title),
                  subtitle: Text(pelicula.originalTitle),
                  onTap: (){
                    close(context, null);
                    pelicula.uid = '';
                    Navigator.pushNamed(context, 'detalle', arguments: pelicula);
                  },
                );
              }).toList(),
            );
          }else {
            return CircularProgressIndicator();
          }
        },
      ),
    }

} 