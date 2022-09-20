//import 'package:componentes/src/pages/alert_page.dart';
import 'package:flutter/material.dart';
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    //print(menuProvider.opciones);

    //menuProvider.cargarData();

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    data.forEach((element) {
      final widetTemps = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        onTap: () {
          /*  final route = MaterialPageRoute(builder: (context) => AlertPage());
          Navigator.push(context, route);*/

          Navigator.pushNamed(context, element['ruta']);
        },
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.red,
        ),
      );

      opciones
        ..add(widetTemps)
        ..add(Divider());
    });
    return opciones;
  }
}
