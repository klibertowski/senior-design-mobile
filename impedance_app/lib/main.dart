import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
          body: Card(
            child: Column(
              children: <Widget>[
                Text('Welcome: Click the button to view info'),
                Image.asset('assets/HomePage.jpg'),
                Container(
                  margin: EdgeInsets.all(50),
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text('Sign In'),
                    )
                  ),
              ]
            ),
          ),
        )
    );
  }
}
