import 'dart:ffi';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart' as frs;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double results = 0;
  frs.RangeSlider range;

  String dollars = '';
  AudioCache player = new AudioCache();

  String tax = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            leading: IconButton(
              alignment: Alignment.center,
              icon: Icon(Icons.menu),
              iconSize: 30.0,
              onPressed: () {},
            )),
        body: Container(
            child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                  color: Color(0xFF837af4),
                  child: Column(children: <Widget>[
                    upperText(),
                    SizedBox(height: 30.0),
                    Text('$results\$',

                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold)),
                    SizedBox(height: 11.0),
                  ])),
              Row(
                children: <Widget>[
                  Container(
                    height: 70.0,
                    width: 70.0,
                    padding: EdgeInsets.all(5.0),
                    alignment: Alignment.center,
                    child: Text('$tax'),
                    decoration: BoxDecoration(
                      color: Color(0xFFa2e896),
                      /*    borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),

                       */
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 70,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 3,
                            color: Color(0xFF837af4),
                          ),
                          Container(
                            height: 64.0,
                            width: double.infinity,
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              '$dollars \$',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40.0),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(
                                      1, 0), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 3,
                            color: Color(0xFF323846),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: 300,
                color: Color(0xFF323846),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: frs.RangeSlider(
                        min: 0.0,
                        max: 100.0,
                        lowerValue: _lowerValueFormatter,
                        upperValue: _upperValueFormatter,
                        divisions: 100,
                        showValueIndicator: true,
                        valueIndicatorMaxDecimals: 1,
                        valueIndicatorFormatter: (int index, double value) {
                          String twoDecimals = value.toStringAsFixed(0);
                          return '$twoDecimals %';
                        },
                        onChanged:
                            (double newLowerValue, double newUpperValue) {
                          setState(() {
                            _lowerValueFormatter = newLowerValue;
                            tax = 'TAX\n $newLowerValue %';
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            numberBox('1', 0),
                            numberBox('2', 1),
                            numberBox('3', 2),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            numberBox('4', 3),
                            numberBox('5', 4),
                            numberBox('6', 5),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            numberBox('7', 6),
                            numberBox('8', 7),
                            numberBox('9', 8),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            numberBox('.', 9),
                            numberBox('0', 10),
                            backspaceIconBox(),
                            enterIconBox(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )));
  }

  Container upperText() {
    return Container(
        margin: EdgeInsets.only(top: 40.0, left: 30.0, right: 30.0),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Divider(
              color: Colors.white,
              thickness: 1,
              indent: 40,
            )),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text('FINAL PRICE'),
              ),
            ),
            Expanded(
                child: Divider(
              color: Colors.white,
              thickness: 1,
              endIndent: 40,
            )),
          ],
        ));
  }

  Expanded numberBox(String number, int buttonNumber) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: FlatButton(
            onPressed: () {
              setState(() {
                if (buttonNumber <= 10) _playNote(buttonNumber);

                for (var i = 0; i <= 12; i++) {
                  if (i != buttonNumber) {
                    list[i] = 1;
                    colors[i] = Colors.white;
                  }
                }
                list[buttonNumber] = 10;
                colors[buttonNumber] = Colors.black;
                dollars = dollars + '$number';
              });
            },
            child: Text(
              '$number',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
              maxLines: 1,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Color(0xFF323846),
          // borderRadius: BorderRadius.only(
          //     topLeft: Radius.circular(10),
          //     topRight: Radius.circular(10),
          //     bottomLeft: Radius.circular(10),
          //     bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: colors[buttonNumber].withOpacity(0.6),
              spreadRadius: list[buttonNumber],
              blurRadius: list[buttonNumber],
              offset: Offset(list[buttonNumber],
                  list[buttonNumber]), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }

  Expanded backspaceIconBox() {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: FlatButton(
            onPressed: () {
              setState(() {
                for (var i = 0; i <= 12; i++) {
                  if (i != 11) {
                    list[i] = 1;
                    colors[i] = Colors.white;
                  }
                }
                list[11] = 10;
                colors[11] = Colors.black;
                dollars = '';
                results = 0.0;
                tax = '';
              });
            },
            child: Icon(Icons.backspace),
          ),
        ),
        decoration: BoxDecoration(
          color: Color(0xFF323846),
          // borderRadius: BorderRadius.only(
          //     topLeft: Radius.circular(10),
          //     topRight: Radius.circular(10),
          //     bottomLeft: Radius.circular(10),
          //     bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: colors[11].withOpacity(0.6),
              spreadRadius: list[11],
              blurRadius: list[11],
              offset: Offset(list[11], list[11]), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }

  Expanded enterIconBox() {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: FlatButton(
            onPressed: () {
              setState(() {
                for (var i = 0; i <= 12; i++) {
                  if (i != 12) {
                    list[i] = 1;
                    colors[i] = Colors.white;
                  }
                }
                list[12] = 10;
                colors[12] = Colors.black;
                try {
                  results = double.parse(dollars) -
                      (double.parse(dollars) * _lowerValueFormatter / 100) ;
                } catch (e) {}
              });
            },
            child: Icon(Icons.assignment_turned_in),
          ),
        ),
        decoration: BoxDecoration(
          color: Color(0xFF323846),
          boxShadow: [
            BoxShadow(
              color: colors[12].withOpacity(0.6),
              spreadRadius: list[12],
              blurRadius: list[12],
              offset: Offset(list[12], list[12]), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }

  double _lowerValue = 20.0;
  double _upperValue = 80.0;
  double _lowerValueFormatter = 2.0;
  double _upperValueFormatter = 100.0;
  List<double> list = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];

  _playNote(int note) {
    player.play('s$note.wav');
  }

  List<Color> colors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
}
