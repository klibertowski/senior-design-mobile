import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

void main() {
  runApp(MaterialApp(
    title: 'App',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BioImpedance Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('BioImpedance Tracker'),
        ),
        body: Column(children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Bioimpedance Tracker App',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
          ),
          Container(
            child: Image.asset('assets/body.jpg'),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.all(50),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NavigationPage()),
                  );
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              )),
        ]),
      ),
    );
  }
}

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Home'),
        //leading: new Container(),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Text(
                    'View Readings',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Readings()),
                          );
                        },
                        shape: StadiumBorder(),
                        child: Icon(
                          Icons.arrow_right,
                          size: 50.0,
                        ))),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Text(
                    'View Graphs',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Graphs()),
                          );
                        },
                        shape: StadiumBorder(),
                        child: Icon(
                          Icons.arrow_right,
                          size: 50.0,
                        ))),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Text(
                    'Bluetooth Settings',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BluetoothSettings()),
                          );
                        },
                        shape: StadiumBorder(),
                        child: Icon(
                          Icons.arrow_right,
                          size: 50.0,
                        ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Readings extends StatefulWidget{
  @override
  _ReadingsWidgetState createState() => _ReadingsWidgetState();
}

class _ReadingsWidgetState extends State<Readings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Readings History'),
        ),
        body: Card(
          child: Text("Past Readings"),
        ));
  }
}

class Graphs extends StatefulWidget{
  @override
  _GraphsWidgetState createState() => _GraphsWidgetState();
}

class _GraphsWidgetState extends State<Graphs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Impedance Graphs'),
        ),
        body: Card(
          child: Text("Put graph here"),
        ));
  }
}
