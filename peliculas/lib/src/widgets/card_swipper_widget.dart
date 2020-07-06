import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwipper extends StatelessWidget {
  final List<Pelicula> peliculas;

  CardSwipper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return  Container(
      padding: EdgeInsets.only(top:10),
      child: Swiper(
          itemCount: peliculas.length,
          layout: SwiperLayout.STACK,
          itemWidth:  _screenSize.width * 0.7,
          itemHeight: _screenSize.height * 0.5,
          itemBuilder: (BuildContext context,int index){
            peliculas[index].uid = '${peliculas[index].id}-poster';
            return Hero(
              tag: peliculas[index].uid,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'detalle', arguments: peliculas[index]);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: FadeInImage(
                    image: NetworkImage(peliculas[index].getPosterImg()),
                    placeholder: AssetImage('assets/no-image.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
    );
  }
}