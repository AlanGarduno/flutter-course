import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cards'),),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          cardTipo1(),
          SizedBox(height: 30.0,),
          cardTipo2(),
          SizedBox(height: 30.0,),
          cardTipo1(),
          SizedBox(height: 30.0,),
          cardTipo2(),
          SizedBox(height: 30.0,),
          cardTipo1(),
          SizedBox(height: 30.0,),
          cardTipo2(),
        ],
      ),
    );
  }

  cardTipo1() {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blueAccent,),
            title: Text('Mamlon'),
            subtitle: Text('Alguna de las mejores cosas de la vida son muy myy gratis'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: null,
              ),
              FlatButton(
                child: Text('Aceptar'),
                onPressed: null,
              ),
            ],
          ),
        ],
      ),
    );
  }

  cardTipo2() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          child: Column(
            children: <Widget>[
              FadeInImage(
              image: NetworkImage('https://learn.zoner.com/wp-content/uploads/2018/08/landscape-photography-at-every-hour-part-ii-photographing-landscapes-in-rain-or-shine.jpg'),
              placeholder: AssetImage('assets/jar-loading.gif'),
              fadeInDuration: Duration( milliseconds: 200 ),
              height: 300.0,
              fit: BoxFit.cover,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text('No tengo idea de que poner'),
                )
            ],
          ),
        ),
      ),
    );
  }
}