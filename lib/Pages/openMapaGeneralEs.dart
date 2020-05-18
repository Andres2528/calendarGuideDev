import 'package:app_calendar_guide/Pages/openSedeEstudiante.dart';
import 'package:app_calendar_guide/theme/colors/light_colors.dart';
import 'package:app_calendar_guide/widgets/top_container.dart';
import 'package:flutter/material.dart';


class MapGeneralE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Calendary guide',
      home: Scaffold(
    body: MostrarMapa(),
    ),
    );
  }
}
  @override
  class MostrarMapa extends StatelessWidget {
  MostrarMapa({Key key}) : super(key: key);

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
                        height: 500,
                       image: new AssetImage("assets/images/mapaGeneral.jpeg"), 
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
                              builder: (context) => Sedee(),
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
          ],
        ),
    ),
    );
  }
}