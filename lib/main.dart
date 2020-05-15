import 'dart:convert';

import 'package:flutter/material.dart';
import 'Pages/estudiantesPage.dart';
import 'Pages/profesoresPage.dart';
import 'package:http/http.dart' as http;

void main() => runApp(LoginApp());

String username;

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/profesoresPage': (BuildContext context) => new Profesor(),
        '/estudiantesPage': (BuildContext context) => new Estudiante(),
        '/LoginPage': (BuildContext context) => LoginPage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController controllerUser = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();

  String mensaje = '';

  Future<List> login() async {
    final respuesta = await http.post("http://192.168.0.8/calendar/login.php", body: {
      "usuario": controllerUser.text,
      "contrasenia": controllerPass.text,
    });
    
    var datauser = json.decode(respuesta.body);
  
    if(datauser.length == 0){
      setState(() {
        mensaje = "usuario o contraseña incorrecta";
      });
    } else {
        if (datauser[0]['idTipoUsuario'] == '2'){
          Navigator.push(context,MaterialPageRoute(
              builder:(context)=> Estudiante(),
            ),
          );
        } else if (datauser[0]['idTipoUsuario'] == '1') {
            Navigator.push(context,MaterialPageRoute(
              builder:(context) => Profesor(),
            ),
          );
        }
        setState(() {
          username = datauser[0]['usuario']; 
        });
      }
    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Form(
        child: Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/images/digital.jpg"),
              fit: BoxFit.cover 
            )
          ),
          child: Column(
            children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(top: 20.0),
                  child: new CircleAvatar(
                    backgroundColor: Color(0xF81F7F3),
                    child: new Image(
                      width: 300,
                      height: 300,
                      image: new AssetImage("assets/images/Logo.png"), 
                    ),
                  ),
                  width: 210.0,
                  height: 210.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height /2,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                    top: 93
                  ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          padding: EdgeInsets.only(
                            top: 4, left: 16, right: 16, bottom: 4
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5
                              )
                            ]
                          ),
                          child: TextFormField(
                            controller: controllerUser,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                              hintText: 'Email'
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: 50,
                          margin: EdgeInsets.only(
                            top: 32
                          ),
                          padding: EdgeInsets.only(
                            top: 4, left: 16, right: 16, bottom: 4
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5
                              )
                            ]
                          ),
                          child: TextField(
                            controller: controllerPass,
                            obscureText: true,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.vpn_key, 
                                color: Colors.black,
                              ),
                              hintText: 'Contraseña'
                            ),
                          ),
                        ),
                        Spacer(),
                        new RaisedButton(
                          child: new Text("Ingresar"),
                          color: Colors.blueAccent,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)
                          ),
                          onPressed: (){
                            login();
                            Navigator.pop(context);
                          },
                        ),
                        Text(mensaje,
                        style: TextStyle(fontSize: 25.0, color: Colors.red),
                        )
                      ],
                    ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
