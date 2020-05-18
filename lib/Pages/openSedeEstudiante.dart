import 'package:app_calendar_guide/Pages/estudiantesPage.dart';
import 'package:app_calendar_guide/Pages/openMapaGeneralEs.dart';
import 'package:app_calendar_guide/Pages/openMapaSedePrincipalEs.dart';
import 'package:app_calendar_guide/main.dart';
import 'package:app_calendar_guide/theme/colors/light_colors.dart';
import 'package:app_calendar_guide/widgets/top_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Sedee extends StatefulWidget {
  @override
  _SedeeState createState() => _SedeeState();
}

class _SedeeState extends State<Sedee> {

  bool dialVisible = true;

  void setDialVisible(bool value) {
    setState(() {
      dialVisible = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      
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
              child: Icon(Icons.arrow_back),
              backgroundColor: Colors.orange,
              label: 'Atras',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new Estudiante(),
              )),
            ),
          ],
        ),

      body: Form(
        child: Column(
        children: <Widget>[ 
          TopContainer(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 40),        
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
                        child: Text('Sedes Unipanamericana',
                        style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 40),
                              ), 
                      )
                    ],
                   )
                  )
                ],
              ),
             ),
            Expanded(child:(
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 40), 
              child: Column(
                children: <Widget>[
                Expanded(         
                  child: SingleChildScrollView(
                 padding: EdgeInsets.symmetric(horizontal: 20),
                   child: (
                  Container(                
                      height: 40.0,
                      width: 220,
                      decoration: BoxDecoration(
                        color: LightColors.kGreen,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapSedeE(),
                            ),
                          );
                        },
                        child: Center(
                          child: Text(
                            'Sede principal',
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
                      height: 40.0,
                      width: 220,
                      decoration: BoxDecoration(
                        color: LightColors.kGreen,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapGeneralE(),
                            ),
                          );
                        },
                        child: Center(
                          child: Text(
                            'Sede Tairona',
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
                      height: 40.0,
                      width: 220,
                      decoration: BoxDecoration(
                        color: LightColors.kGreen,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapGeneralE(),
                            ),
                          );
                        },
                        child: Center(
                          child: Text(
                            'Sede Wayúu',
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
                      height: 40.0,
                      width: 220,
                      decoration: BoxDecoration(
                        color: LightColors.kGreen,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapGeneralE(),
                            ),
                          );
                        },
                        child: Center(
                          child: Text(
                            'Sede Sinú',
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
                      height: 40.0,
                      width: 220,
                      decoration: BoxDecoration(
                        color: LightColors.kGreen,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapGeneralE(),
                            ),
                          );
                        },
                        child: Center(
                          child: Text(
                            'Sede U´wa',
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
                 )
                ],
              ),
            )
          )   
         ),
       ],
       )
      ) 
    );
  }
}