import 'package:app_calendar_guide/Pages/crearNuevaActividad.dart';
import 'package:app_calendar_guide/Pages/profesoresPage.dart';
import 'package:app_calendar_guide/theme/colors/light_colors.dart';
import 'package:app_calendar_guide/widgets/actividad_container.dart';
import 'package:app_calendar_guide/widgets/back_button.dart';
import 'package:flutter/material.dart';

class Actividad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Calendary guide',
      home: Scaffold(
    body: MostrarA(),
    ),
    );
  }
  }
class MostrarA extends StatelessWidget {
  MostrarA({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new Profesor(),
            )),
      ),
      body:Form(
      child:Container(
      child: Column(children: <Widget>[

            
              MyBackButton(),
              SizedBox(height: 30.0),
              Row(
        
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[                  
                    Text(                
                      'Hoy',
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.w700),
                    ), 
                    
                     Container(
                       margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
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
                              builder: (context) => AddDataActividad(),
                            ),
                          );
                        },
                        child: Center(
                          child: Text(
                            'Agregar actividad',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ),
                        
                      ),
                    ),
                  ]),
      
             Expanded(
                          flex: 5,
                          child: ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: <Widget>[
                              ActividadContainer(
                                title: 'Actividad 1',
                                subtitle:
                                    'Actividad 1 de clase',
                                boxColor: LightColors.kLightYellow2,
                              ),
                              _dashedText(),
                              ActividadContainer(
                                title: 'Actividad 2',
                                subtitle: 'Actividad 2 de clase',
                                boxColor: LightColors.kLavender,
                              ),
                               _dashedText(),
                              ActividadContainer(
                                title: 'Actividad 3',
                                subtitle: 'Actividad 3 de clase',
                                boxColor: LightColors.kPalePink,
                              ),
                               _dashedText(),
                              ActividadContainer(
                                title: 'Actividad 4',
                                subtitle:
                                    'Actividad 4 de clase',
                                boxColor: LightColors.kLightGreen,
                              ),
                            ],
                          ),
                        )

          ],
        ),
   
    ),
      ),
    );
  }

}
Widget _dashedText() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        '------------------------------------------',
        maxLines: 1,
        style:
            TextStyle(fontSize: 20.0, color: Colors.black12, letterSpacing: 5),
      ),
    );
  }
