import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oh_media_app/HomePage.dart';

void main() =>
  runApp(MyApp());

  class MyApp extends StatefulWidget {
    @override
    _MyAppState createState() => _MyAppState();
  }

  class _MyAppState extends State<MyApp> {
    @override
    Widget build(BuildContext context) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color
            .
        fromARGB
          (
            255,233,10,10
        )
        ,
      ));

      return  MaterialApp(
        debugShowCheckedModeBanner: false,

        theme: new ThemeData.light(),
        home: IntroPage(),
        initialRoute: '/',
      );
    }
  }




