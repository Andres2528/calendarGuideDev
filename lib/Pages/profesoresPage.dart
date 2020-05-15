import "package:flutter/material.dart";

class Profesor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text('Pagina Profesor')),
      body: new Column(
        children: <Widget>[
          Text('Estamos en Profesores'),
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