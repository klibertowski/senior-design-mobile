import 'dart:ui' ;

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:async';

final String TARGET_DEVICE_NAME = "RN4870-1792";
final String SERVICE_UUID = "";
final String CHAR_UUID = "";
Stream<List<int>> readStream;
BluetoothDevice targetDevice;
BluetoothCharacteristic targetCharacteristic;

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
  static var data = [
    ImpedanceReading(1, 12),
    ImpedanceReading(2, 42),
    ImpedanceReading(3, 50),
    ImpedanceReading(4, 50),
    ImpedanceReading(5, 40),
    ImpedanceReading(6, 30),
    ImpedanceReading(7, 45),
    ImpedanceReading(8, 10),
    ImpedanceReading(9, 32)
  ];

  static var series = [
    charts.Series<ImpedanceReading,int>(
      domainFn: (ImpedanceReading zData, _) => zData.day,
      measureFn: (ImpedanceReading zData, _) => zData.z,
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      id: 'Impedance',
      data: data,
    ),
  ];

  static var chart = charts.LineChart(
    series,
    animate: true,
    behaviors: [
      new charts.ChartTitle('Day',
        behaviorPosition: charts.BehaviorPosition.bottom,
        titleOutsideJustification: charts.OutsideJustification.middleDrawArea),
    new charts.ChartTitle('Impedance',
        behaviorPosition: charts.BehaviorPosition.start,
        titleOutsideJustification: charts.OutsideJustification.middleDrawArea)
    ],
  );

  var chartWidget = Padding(
    padding: EdgeInsets.all(32.0),
    child: SizedBox(
      height: 200.0,
      child: chart,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Impedance Graphs'),
        ),
        body: Column(children: <Widget>[
          Text("Put graph here"),
          chartWidget,
        ],
        ));
  }
}

class ImpedanceReading {
  final int day;
  final int z;

  ImpedanceReading(this.day, this.z);
}

class BluetoothSettings extends StatefulWidget{
  @override
  _BluetoothSettingsState createState() => _BluetoothSettingsState();
}

class _BluetoothSettingsState extends State<BluetoothSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bluetooth Settings'),
        ),
        body: Column(children: <Widget>[
          Text('Stuff'),
          RaisedButton(
            child: Text('Connect'),
            onPressed: connectBluetooth,
          ),
          Text('test'),
          StreamBuilder<List<int>>(
            stream: readStream,  //here we're using our char's value
            initialData: [],
            builder: (BuildContext context, AsyncSnapshot<List<int>> snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              return Center(
                child: Text(readStream.toString())
              );
            }
            else{
              return SizedBox(
                child: Text('HELLLLLLLO'),
              );
            }
            },
          )
        ],
        )

    );
  }
}

void connectBluetooth() async{

  //make instance
  FlutterBlue bluetooth = FlutterBlue.instance;
  StreamSubscription<ScanResult> scanSub;

  scanSub = bluetooth.scan().listen((scanResult){
    if(scanResult.device.name == TARGET_DEVICE_NAME){
      targetDevice = scanResult.device;
      connectToDevice(targetDevice);
      bluetooth.stopScan();
      scanSub?.cancel();
      scanSub = null;
    }
  });

  List<BluetoothService> services = await targetDevice.discoverServices();
  services.forEach((service){
    if(service.uuid.toString() == SERVICE_UUID){
      service.characteristics.forEach((characteristic){
        if(characteristic.uuid.toString() == CHAR_UUID){
          targetCharacteristic = characteristic;
          readStream = targetCharacteristic.value;
          targetCharacteristic.setNotifyValue(!targetCharacteristic.isNotifying);
        }
      });
    }
  });
}

connectToDevice(BluetoothDevice targetDevice) async{
  await targetDevice.connect();
}

