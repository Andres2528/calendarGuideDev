import 'package:app_calendar_guide/main.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Profesor extends StatefulWidget {
  @override
  _Profesor createState() => _Profesor();
}

class _Profesor extends State<Profesor> {

  Future<List> getData() async{
    final response = await http.get("http://192.168.0.6/calendar/getdatap.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Listado Usuarios"),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.exit_to_app),
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new InicioApp(),
        )),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(30.0),
            child: new Card(
              child: new ListTile(
                title: new Text(
                  list[i]['usuario'],
                  style: TextStyle(fontSize: 25.0, color: Colors.orangeAccent),
                ),
                leading: new Icon(
                  Icons.person_pin,
                  size: 50.0,
                  color: Colors.orangeAccent,
                ),
                subtitle: new Text(
                  "Tipo Usuario : ${list[i]['tipoUsuario']}",
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
              ),
            ),
        );
      },
    );
  }
}