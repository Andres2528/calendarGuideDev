import 'package:app_calendar_guide/Pages/dataActividadPage.dart';
import 'package:app_calendar_guide/Pages/openSedeProfesor.dart';
import 'package:app_calendar_guide/main.dart';
import 'package:app_calendar_guide/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Profesor extends StatefulWidget {
  @override
  _Profesor createState() => _Profesor();
}

class _Profesor extends State<Profesor> {

  bool dialVisible = true;

  void setDialVisible(bool value) {
    setState(() {
      dialVisible = value;
    });
  }

  Future<List> getData() async{
    final response = await http.get("http://192.168.0.3/calendar/getdatap.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Bienvenido"),
        backgroundColor: LightColors.kOrange,
      ),
      
      // MENU
          floatingActionButton: SpeedDial(
          // both default to 16
          marginRight: 18,
          marginBottom: 20,
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 22.0),
          // this is ignored if animatedIcon is non null
          // child: Icon(Icons.add),
          visible: dialVisible,
          // If true user is forced to close dial manually 
          // by tapping main button and overlay is not rendered.
          closeManually: false,
          curve: Curves.bounceIn,
          overlayColor: Colors.black,
          overlayOpacity: 0.5,
          onOpen: () => print('OPENING DIAL'),
          onClose: () => print('DIAL CLOSED'),
          tooltip: 'Speed Dial',
          heroTag: 'speed-dial-hero-tag',
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 8.0,
          shape: CircleBorder(),
          children: [
            SpeedDialChild(
              child: Icon(Icons.exit_to_app),
              backgroundColor: Colors.red,
              label: 'Cerrar sesión',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new InicioApp(),
              )),
            ),
            SpeedDialChild(
              child: Icon(Icons.location_on),
              backgroundColor: Colors.orange,
              label: 'Sede',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new Sedep(),
              )),
            ),
            SpeedDialChild(
              child: Icon(Icons.calendar_today),
              backgroundColor: Colors.green,
              label: 'Calendario',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => print('THIRD CHILD'),
            ),
            SpeedDialChild(
              child: Icon(Icons.note),
              backgroundColor: Colors.blue,
              label: 'Actividad',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new Actividad(),
              )),
            )
          ],
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
                  "Profesor: ${list[i]['nombre']}",
                  style: TextStyle(fontSize: 25.0, color: Colors.orangeAccent),
                ),
                leading: new Icon(
                  Icons.person,
                  size: 50.0,
                  color: Colors.orangeAccent,
                ),
                subtitle: new Text(
                  "CC: ${list[i]['cc']}",
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                  
                ),
              ),
            ),
        );
      },
    );
  }
}