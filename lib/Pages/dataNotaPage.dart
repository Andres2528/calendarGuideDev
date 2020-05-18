
import 'package:app_calendar_guide/Pages/estudiantesPage.dart';
import 'package:app_calendar_guide/theme/colors/light_colors.dart';
import 'package:app_calendar_guide/widgets/nota_container.dart';
import 'package:flutter/material.dart';

import 'CrearNuevaNota.dart';

class Notas extends StatelessWidget {
  final String tituloE = "";
  final String descripcionE = "";
  final String ccE = "";
    
      @override
      Widget build(BuildContext context) {
        
        return MaterialApp(
          debugShowCheckedModeBanner:false,
          title: 'Calendary guide',
          home: Scaffold(
          body: Mostrar(),
        ),
        );
      }
}

class Mostrar extends StatelessWidget { 
  Mostrar({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new Estudiante(),
            )),
      ),
      body:Form(
      child:Container(
      child: Column(children: <Widget>[
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
                              builder: (context) => AddData(),
                            ),
                          );
                        },
                        child: Center(
                          child: Text(
                            'Agregar notas',
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
                              NotaContainer(
                                title: 'Nota 1',
                                subtitle:
                                    'Hacer un resumen de clase....',
                                boxColor: LightColors.kLightYellow2,
                              ),
                              _dashedText(),
                              NotaContainer(
                                title: 'Nota 2',
                                subtitle: 'Hacer un informe de clase ',
                                boxColor: LightColors.kLavender,
                              ),
                              _dashedText(),
                              NotaContainer(
                                title: 'Nota 3',
                                subtitle: 'Hacer reseña de clase ',
                                boxColor: LightColors.kPalePink,
                              ),
                              _dashedText(),
                              NotaContainer(
                                title: 'Nota 4',
                                subtitle:
                                    'Trabajar en grupo de clase',
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
