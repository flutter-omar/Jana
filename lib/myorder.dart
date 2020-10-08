import 'package:flutter/material.dart';
class Myorder extends StatefulWidget {
  @override
  _MyorderState createState() => _MyorderState();
}

class _MyorderState extends State<Myorder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xE6E6E6E6),
      appBar: AppBar(
        title: Center(child: Text("طلباتي",style: TextStyle(color: Colors.black),)),
        backgroundColor: Colors.white,
      ),

    );
  }
}
