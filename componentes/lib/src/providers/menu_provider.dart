import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;


class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider();

  Future<List<dynamic>>cargarData() async {
    var data = await rootBundle.loadString('data/data.json');
    Map<String, dynamic> dataMap = json.decode(data);
    opciones = dataMap['rutas'];

    return opciones;
  }
}

final menuProvider = new _MenuProvider();