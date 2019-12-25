import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:tonic/tonic.dart';



void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

// If you are running this on the iOS Simulator you will get an error
//It's ok for developing the UI but once we start with the midi you will need to plug in a real ios device.
  
 /* @override
  void initState() {
    FlutterMidi.unmute();
    rootBundle.load("assets/sounds/Piano.sf2").then((sf2) {
      FlutterMidi.prepare(sf2: sf2, name: "Piano.sf2");
    });
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text("Piano 4 Your Brain")),
        drawer: Drawer(
          child: SafeArea( child: ListView(children: <Widget>[],),),
        ),
      ),
    );
  }
}



