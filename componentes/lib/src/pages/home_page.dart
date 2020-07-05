import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icon_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Componentes')),
      body: _generateList()
    );
  }

  Widget _generateList() {

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) { 
        
        return ListView(
          children: _generateItems(snapshot.data, context),
        );
      },  
    );
  }

  List<Widget> _generateItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((item) { 
      final Widget widgetTem = ListTile(
        title: Text(item['texto']),
        leading: getIcon(item['icon']),
        trailing:  Icon(Icons.keyboard_arrow_right, color: Colors.cyan),
        onTap: () {
          Navigator.pushNamed(context, item['ruta']);
        },

      );
      opciones..add(widgetTem)
              ..add(Divider());
    });

    return opciones;
  }

}