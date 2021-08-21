import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jantu_assignment/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(size: 16.0, color: Color(0xFFFB8079)),
          ),
          primaryColor: Color(0xFFFB8079),
          fontFamily: GoogleFonts.lato().fontFamily,
          iconTheme: IconThemeData(size: 16.0, color: Color(0xFFFB8079))),
      home: HomeScreen(),
    );
  }
}
