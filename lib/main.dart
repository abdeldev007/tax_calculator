import 'package:bmicalculator/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   @override
  Widget build(BuildContext context) {

    return MaterialApp(

      theme: ThemeData.dark().copyWith(

          scaffoldBackgroundColor: Color(0xFF323846),
          primaryColor: Color(0xFF837af4),
          primaryColorDark:  Color(0xFF837af4),
           highlightColor: Color(0xFF837af4),
           backgroundColor:  Color(0xFF837af4),

           accentColor: Color(0xFF837af4)
            ),


        home: HomeScreen(),
    );
  }
}
