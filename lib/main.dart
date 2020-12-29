import 'package:flutter/material.dart';
import 'package:flutter_app1/Hive_Homework/homework_package1//hive_page.dart';
import 'package:flutter_app1/Hive_Homework/homework_package1//hive_page2.dart';
import 'package:flutter_app1/Hive_Homework/homework_package2/hive_homwork21.dart';
import 'package:flutter_app1/packages/getpage.dart';
import 'package:flutter_app1/packages/home_page.dart';
import 'package:flutter_app1/packages/secondpage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


import 'Hive_Homework/homework_package2//hive_homwork2.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox('pdp');
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
      home: HiveHomework(),
      routes: {
        HomePage.id:(context)=>HomePage(),
        SignUp.id:(context)=>SignUp(),
        GetPage.id:(context)=>GetPage(),
        HiveHomework.id:(context)=>HiveHomework(),
        HivePage2.id:(context)=>HivePage2(),
        HomeworkPage2.id:(context)=>HomeworkPage2(),
        HomeWorkPage2.id:(context)=>HomeWorkPage2(),

      },
    );
  }
}
