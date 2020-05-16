import 'package:flutter/material.dart';
import 'Pages/login.dart';
import 'theme/colors/light_colors.dart';

void main() => runApp(InicioApp());

class InicioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Calendary guide',
      home:Scaffold(
        body: ClaseInicio(),
     ),
    );
  }
}

class ClaseInicio extends StatelessWidget {
  ClaseInicio({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          children:[
            Container(
              padding: EdgeInsets.only(top: 10.0),
              child: new CircleAvatar(
                backgroundColor: Color(0xF81F7F3),
                child: new Image(
                  width: 300,
                  height: 300,
                  image: new AssetImage("assets/images/Logo.png"), 
                ),
              ),
              width: 210.0,
              height: 400.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle
              ),
            ),
            Container(
              child: FlatButton.icon(
                icon: Icon(Icons.calendar_today), 
                label: Text('Iniciar sesion con office'),
                onPressed: (){
                  Navigator.push(
                    context,MaterialPageRoute(
                      builder: (context) => LoginApp(),
                    ),
                  );
                 },
                color: LightColors.kOrange,
                textColor: Colors.white,
              ),
            ),
          ],
        )
      )
    );
  }
}

