import 'package:app_calendar_guide/Pages/estudiantesPage.dart';
import 'package:app_calendar_guide/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarioE extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendario Unipanamericana',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool dialVisible = true;

  void setDialVisible(bool value) {
    setState(() {
      dialVisible = value;
    });
  }

  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  dynamic selectEvents;

/*Constructor iniciarlizar variables */
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    _controller = CalendarController();
    _events = {};
    selectEvents = [];
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<String, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendario Unipanamericana'),
        backgroundColor: Colors.orange,
      ),

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


      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TableCalendar(
            events: _events,
            locale: 'es',
            initialCalendarFormat: CalendarFormat.week,
            calendarStyle: CalendarStyle(
                todayColor: Colors.orange,
                selectedColor: Theme.of(context).primaryColor,
                todayStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.white)),
            headerStyle: HeaderStyle(
              centerHeaderTitle: true,
              formatButtonDecoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20.0),
              ),
              formatButtonTextStyle: TextStyle(color: Colors.white),
              formatButtonVisible: false,
              formatButtonShowsNext: false,
            ),
            startingDayOfWeek: StartingDayOfWeek.monday,
            onDaySelected: (date, events) {
              setState(() {
                selectEvents = date.weekday;
              });
              
              print(date.day);
            },
            builders: CalendarBuilders(
              selectedDayBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Text(date.day.toString(),
                      style: TextStyle(color: Colors.white))),
              todayDayBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Text(date.day.toString(),
                      style: TextStyle(color: Colors.white))),
            ),
            calendarController: _controller,
          ),
          if (selectEvents == 1.0)
            MenuClases(datos: [
              '18:00',
              '18:00 - 20:00',
              'Sede Sinu - Salón 201',
              'Sistemas operativos'
            ]),
            MenuClases(datos: [
              '20:00',
              '20:00 - 22:00',
              'Sede Sinu - Salón 404',
              'Calculo diferencial'
            ]),
          if (selectEvents == 2.0)
            MenuClases(datos: [
              '18:00',
              '18:00 - 19:00',
              'Sede Sinu - Salón 101',
              'Ingles 2'
            ]),
            MenuClases(datos: [
              '19:00',
              '19:00 - 21:00',
              'Sede Wayu - Salón 101',
              'Emprendimiento'
            ]),
          if (selectEvents == 3.0)
            MenuClases(datos: [
              '18:00',
              '18:00 - 20:00',
              'Sede Bora - Salón 214',
              'Responsabilidad Social'
            ]),
             MenuClases(datos: [
              '20:00',
              '20:00 - 22:00',
              'Sede Wayu - Salón 214',
              'Fisica'
            ]),
          if (selectEvents == 4.0)
            MenuClases(datos: [
              '18:00',
              '18:00 - 20:00',
              'Sede Tayrona - Salón 408',
              'Responsabilidad Social'
            ]),
            MenuClases(datos: [
              '20:00',
              '20:00 - 22:00',
              'Sede Sinu - Salón 204',
              'Estadistica'
            ]),
          if (selectEvents == 5.0)
            MenuClases(datos: [
              '20:00',
              '20:00 - 22:00',
              'Sede Sinu - Salón 104',
              'Emprendimiento'
            ]),
        ],
      )),
    );
  }
}

/* Crea cada item de las clases por día */
class LineaGenerica extends StatelessWidget {
  final lines;
  const LineaGenerica({
    Key key,
    this.lines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
          4,
          (index) => Container(
                height: 2.0,
                width: lines[index],
                color: Color(0xffd0d2d8),
                margin: EdgeInsets.symmetric(vertical: 16.0),
              )),
    );
  }
}

/* Crea cada item de las clases por día */
class MenuClases extends StatelessWidget {
  final datos;
  const MenuClases({
    Key key,
    this.datos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text(
                datos[0].toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              LineaGenerica(
                lines: [20.0, 30.0, 40.0, 10.0],
              ),
            ],
          ),
        ),
        SizedBox(width: 12.0),
        Expanded(
          child: Container(
            height: 100.0,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(left: 4.0),
              color: Color(0xfffcf9f5),
              padding: EdgeInsets.only(left: 16.0, top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 21.0,
                    child: Row(
                      children: <Widget>[
                        Text(datos[1].toString()),
                        VerticalDivider(),
                        Text(datos[2].toString())
                      ],
                    ),
                  ),
                  Text(datos[3].toString(),
                      style: TextStyle(
                        fontSize: 21.0,
                        fontWeight: FontWeight.bold,
                      ))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}