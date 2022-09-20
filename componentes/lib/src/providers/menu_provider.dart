import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    // cargarData();
  }
  Future<List<dynamic>> cargarData() async {
    final data = await rootBundle.loadString('data/menu-opts.json');
    Map dataMap = json.decode(data);
    //print(dataMap['rutas']);
    opciones = dataMap['rutas'];
    return opciones;
  }
}

final menuProvider = _MenuProvider();
