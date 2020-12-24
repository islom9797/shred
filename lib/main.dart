import 'package:flutter/material.dart';
import 'package:flutter_app1/packages/home_page.dart';
import 'package:flutter_app1/packages/secondpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
                primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      routes: {
        HomePage.id:(context)=>HomePage(),
        SignUp.id:(context)=>SignUp()
      },
    );
  }
}
