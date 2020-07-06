import 'package:flutter/material.dart';
import 'package:peliculas/src/models/actores_models.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/pelicula_provider.dart';

class PeliculaDetallePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;
    
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppbar(pelicula),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height:10.0 ,),
                _posterTitulo(pelicula),
                _descipcion(pelicula),
                _crearCasting(pelicula),
              ]
            ),
          ),
        ],
      ),
    );
  }

 Widget _crearAppbar(Pelicula pelicula) {
   return SliverAppBar(
     elevation: 2.0,
     backgroundColor: Colors.indigo,
     expandedHeight: 200,
     floating: false,
     pinned: true,
     flexibleSpace: FlexibleSpaceBar(
       title: Text(
         pelicula.title,
         style: TextStyle(fontSize: 16, color: Colors.white),
        ),
       centerTitle: true,
       background: FadeInImage(
         image: NetworkImage(pelicula.getBackgroundImg()),
         placeholder: AssetImage('assets/loading.gif'),
         fadeInDuration: Duration(milliseconds: 150),
         fit: BoxFit.cover,
       ),
     ),
   );
  }

  Widget _posterTitulo(Pelicula pelicula) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Hero(
            tag:pelicula.uid,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage(pelicula.getPosterImg()),
                width: 150.0,
              )
            ),
          ),
          SizedBox(width: 20.0,),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(pelicula.title, style: TextStyle(fontSize: 20), overflow: TextOverflow.ellipsis,),
                Text(pelicula.originalTitle, style: TextStyle(fontSize: 10), overflow: TextOverflow.ellipsis),
                Row(
                  children: <Widget>[
                    Icon(Icons.star),
                    Text(pelicula.voteAverage.toString())
                  ],
                )
              ],
            )
          ),
        ],
      ),
    );
  }

  Widget _descipcion(Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
        pelicula.overview,
        textAlign: TextAlign.justify,
        ),
    );
  }

  Widget _crearCasting(Pelicula pelicula) {
    final peliculasProvider = new PeliculaProvider();
    return FutureBuilder(
      future: peliculasProvider.getCast(pelicula.id),
      builder: (BuildContext context, AsyncSnapshot<List<Actor>> snapshot) {
        if(snapshot.hasData) {
          return _crearActores(snapshot.data);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _crearActores(List<Actor> data) {

    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: data.length,
        pageSnapping: false,
        controller: PageController(
          viewportFraction: 0.3,
          initialPage: 1,
        ),
        itemBuilder: (context, i) => _crearTarjetaActor(data[i])
      ),
    );
  }

  Widget _crearTarjetaActor(Actor actor) {
    return Container(
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              image: NetworkImage(actor.getProfilePhoto()),
              placeholder: AssetImage('assets/no-image.jpg'),
              height: 150.0,
              fit: BoxFit.cover,
            ),
          ),
          Text(actor.name, overflow: TextOverflow.ellipsis,)
        ],
      ),
    );
  }
}