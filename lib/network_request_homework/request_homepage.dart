import 'package:flutter/material.dart';
class Request_page extends StatefulWidget {
  @override
  _Request_pageState createState() => _Request_pageState();
}

class _Request_pageState extends State<Request_page> {
  String data="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data!=null?data:"No data"),
      ),
    );
  }
}
