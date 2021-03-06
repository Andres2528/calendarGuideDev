import 'package:app_calendar_guide/theme/colors/light_colors.dart';
import 'package:app_calendar_guide/widgets/back_button.dart';
import 'package:app_calendar_guide/widgets/my_text_field.dart';
import 'package:app_calendar_guide/widgets/top_container.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;


class AddData extends StatefulWidget {
  @override
  CrearNuevaNota createState() => new CrearNuevaNota();
}

class CrearNuevaNota extends State<AddData>{
    final controllerCcEstudiante = new TextEditingController(text: "");
    final controllerTitulo = new TextEditingController(text: "");
    final controllerDetNota = new TextEditingController(text: "");

  void addData() {
    var url = "http://10.0.2.2/calendary_guide/adddata.php";

    http.post(url, body: {
      "ccEstudiante": controllerCcEstudiante.text,
      "titulo": controllerTitulo.text,
      "detNota": controllerDetNota.text,
   });
  }

  @override
  Widget build(BuildContext context) {
    
          double width = MediaQuery.of(context).size.width;
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  TopContainer(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
                    width: width,
                    child: Column(
                      children: <Widget>[
                        MyBackButton(),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Crear nueva nota',
                              style: TextStyle(
                                  fontSize: 30.0, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                             
                            MyTextField(
                              controller: controllerTitulo,
                              
                            label: 'titulo'),
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                       children: <Widget>[
                                Expanded(
                                  child: MyTextField(
                                    controller: controllerCcEstudiante,
                                    label: 'Identificacion',
                                  ),
                                ),
                              ],
                            )
                          ],
                         )          
                        )  
                                      
                      ],
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      
                        ),
                        SizedBox(height: 20),
                        MyTextField(
                          controller: controllerDetNota,
                          label: 'Descripcion',
                          minLines: 3,
                          maxLines: 3,
                        ),
                        SizedBox(height: 20),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                        
                          ),
                        )
                      ],
                    ),
                  )),
                  Container(
                    height: 80,
                    width: width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[    
                        
                        Container(
                        
                          child: Text(
                            'Crear tarea',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ),
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                          width: width - 40,
                          decoration: BoxDecoration(
                            color: LightColors.kBlue,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
}
