

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContadorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContadorState();
  }

}

class _ContadorState extends State<ContadorPage> {

  final _estiloTexto = new TextStyle( fontSize: 25);
  int _conteo = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Número de clicks',
             style: _estiloTexto ,
             ),
            Text('$_conteo',
             style: _estiloTexto,
            )
          ],)
      ),
      floatingActionButton: _buildButtons()
    );
  }

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 30.0,),
        FloatingActionButton(
          child: Icon(Icons.exposure_zero),
          onPressed: () {
            setState(() {
              _conteo = 0;
            });
          },
        ),
        Expanded(child: SizedBox(width: 10.0)),
        FloatingActionButton(
          child: Icon(Icons.remove),
          onPressed: () {
            setState(() {
              _conteo--;
            });
          },
        ),
        SizedBox(width: 10.0),
        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              _conteo++;
            });
          },
        ),
      ],
    );
  }
}