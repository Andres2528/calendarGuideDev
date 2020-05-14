import "package:flutter/material.dart";

class Estudiante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text('Pagina Estudiante')),
      body: new Column(
        children: <Widget>[
          Text('Estamos en Estudiantes'),
          RaisedButton(
            child:Text("Salir"),
            onPressed: (){
              Navigator.pushReplacementNamed(context, "/LoginPage");
            },
          )
        ],
      ),
    );
  }
}