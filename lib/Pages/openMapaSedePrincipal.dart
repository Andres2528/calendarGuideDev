import 'package:app_calendar_guide/Pages/openSedeProfesor.dart';
import 'package:app_calendar_guide/theme/colors/light_colors.dart';
import 'package:app_calendar_guide/widgets/top_container.dart';
import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';


class MapSedeP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Calendary guide',
      home: Scaffold(
    body: MostrarSede(),
    ),
    );
  }
}
  @override
  class MostrarSede extends StatelessWidget {
  MostrarSede({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:Form(
    child: Column(
          children: <Widget>[
            TopContainer(           
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 0,
                  ),
                  SizedBox(height: 0),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        
                   child: new Image(
                        width: 600,
                        height: 400,
                        
                       image: new AssetImage("assets/images/mapaPlaza.jpeg"), 
                        ),  
                      ),
                    ],
                   )
                  )
                ],
              ),
            ),
            
            Expanded(
                child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: (
                Container(
                // padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
                    margin: EdgeInsets.symmetric(vertical: 30.0),
                      height: 40.0,
                      width: 120,
                      decoration: BoxDecoration(
                        color: LightColors.kGreen,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Sedep(),
                            ),
                          );
                        },
                        child: Center(
                          child: Text(
                            'Atras',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ),

                      ),
                    )
              ),
            )
            ),
             Expanded(
                child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: (
                Container(
                // padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
                    margin: EdgeInsets.symmetric(vertical: 30.0),
                      height: 50.0,
                      width: 280,
                      decoration: BoxDecoration(
                        color: LightColors.kGreen,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: FlatButton(
                        onPressed: () {                          
                          //launch("https://www.google.com/maps/place/Compensar+Unipanamericana/@4.6210599,-74.075252,17z/data=!3m1!4b1!4m5!3m4!1s0x8e3f9983c4bef867:0xd211fabe829e3ea5!8m2!3d4.6210599!4d-74.0730633");
                        },
                        child: Center(
                          child: Text(
                            'Ver ubicacion en google maps',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    )
              ),
            )
            ),
          ],
        )
      )
    );
  }
}
