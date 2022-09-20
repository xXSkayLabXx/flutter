import 'dart:ffi';

import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _fecha = '';
  String _opcionesSeleccionada = 'volar';

  List<String> _poderes = ['volar', 'rayos x', 'super aliento'];

  TextEditingController _inputFieldDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Inputs de Texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _creaFecha(context),
          Divider(),
          _creaDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      //autofocus: true,
      cursorColor: Colors.red,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.red, width: 2.0)),
        counter: Text('cantidad de letras ${_nombre.length}'),
        hintText: 'nombre de la persona',
        labelStyle: TextStyle(color: Colors.red),
        labelText: ('Nombre'),
        helperText: 'solo es el nombre',
        suffixIcon: Icon(
          Icons.accessibility_new_rounded,
          color: Colors.red,
        ),
        icon: Icon(
          Icons.account_circle_outlined,
          color: Colors.red,
        ),
      ),
      onChanged: (value) {
        setState(() {});
        _nombre = value;
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
        //autofocus: true,
        cursorColor: Colors.red,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.red, width: 2.0)),
          hintText: 'Email',
          labelStyle: TextStyle(color: Colors.red),
          labelText: ('Email'),
          helperText: 'solo es el email',
          suffixIcon: Icon(
            Icons.alternate_email_rounded,
            color: Colors.red,
          ),
          icon: Icon(
            Icons.email_rounded,
            color: Colors.red,
          ),
        ),
        onChanged: (value) => setState(() {
              _email = value;
            }));
  }

  Widget _crearPassword() {
    return TextField(
        //autofocus: true,
        cursorColor: Colors.red,
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.red, width: 2.0)),
          hintText: 'Password',
          labelStyle: TextStyle(color: Colors.red),
          labelText: ('Password'),
          helperText: 'solo es el Password',
          suffixIcon: Icon(
            Icons.password_rounded,
            color: Colors.red,
          ),
          icon: Icon(
            Icons.lock_person_rounded,
            color: Colors.red,
          ),
        ),
        onChanged: (value) => setState(() {
              _email = value;
            }));
  }

  Widget _creaFecha(BuildContext context) {
    return TextField(
      //autofocus: true,
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      cursorColor: Colors.red,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.red, width: 2.0)),
        hintText: 'Fecha de nacimiento',
        labelStyle: TextStyle(color: Colors.red),
        labelText: ('Fecha de nacimiento'),
        helperText: 'Fecha de nacimiento',
        suffixIcon: Icon(
          Icons.perm_contact_calendar_rounded,
          color: Colors.red,
        ),
        icon: Icon(
          Icons.calendar_today_rounded,
          color: Colors.red,
        ),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
      locale: Locale('es', 'ES'),
    );
    if (picked != null) {
      setState(() {
        _fecha = picked.day.toString() +
            '/' +
            picked.month.toString() +
            '/' +
            picked.year.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = [];

    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(child: Text(poder), value: poder));
    });
    return lista;
  }

  Widget _creaDropdown() {
    return Row(
      children: [
        Icon(Icons.select_all_rounded),
        SizedBox(width: 20.0),
        DropdownButton(
            value: _opcionesSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: (element) {
              print(element);
              setState(() {
                _opcionesSeleccionada = element!;
              });
            })
      ],
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_opcionesSeleccionada),
    );
  }
}
