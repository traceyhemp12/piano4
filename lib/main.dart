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

// build the octave section that will be repeated.
// Since every octave is identical we can repeat the octaves with minor adjustments.
  //Under the itemBuilder lets define which octave we are working with by adding: final int i = index * 12;
  double get keyWidth => 80 + (80 * _widthRatio);
  double _widthRatio = 0.0;
  bool _showLabels = true;

//build piano function
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text("Piano 4 Your Brain")),
        drawer: Drawer(child: SafeArea( child: ListView(children: <Widget>[]))),
        body: ListView.builder(
              itemCount: 7,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index){
                final int i = index * 12;
                return SafeArea(
                  child: Stack(children: <Widget>[
                        Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                          _buildKey(24 + i, false),
                          _buildKey(26 + i, false),
                          _buildKey(28 + i, false),
                          _buildKey(29 + i, false),
                          _buildKey(31 + i, false),
                          _buildKey(33 + i, false),
                          _buildKey(35 + i, false),

                        ]),
                        Positioned(
                          left: 0.0,
                          right: 0.0,
                          bottom: 100,
                          top: 0.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                          Container(width: keyWidth * .5),
                            _buildKey(25 + i, true),
                            _buildKey(27 + i, true),
                            Container(width: keyWidth),
                            _buildKey(30 + i, true),
                            _buildKey(32 + i, true),
                            _buildKey(34 + i, true),
                            Container(width: keyWidth * .5),
                        ])),


                  ],),
                );

                return Container();
              },
        )

       
        ),
    );
  }

//build key function
   Widget _buildKey(int midi, bool accidental) {
          if (accidental){
          return Container(
              width: keyWidth,
              color: Colors.black,
              margin: EdgeInsets.symmetric(horizontal: 2.0),
              padding: EdgeInsets.symmetric(horizontal: keyWidth * .1),
            child: Material(
            elevation: 6.0,
            borderRadius: borderRadius,
            shadowColor: Color(0x802196F3),
          ));
          }

          return Container(
            width: keyWidth,
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 2.0)
          );
        }

        static const BorderRadiusGeometry borderRadius = BorderRadius.only(
          bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0));
        
}



