import 'package:flutter/material.dart';
import 'package:janaapp/widget/ordercard.dart';

import 'generated/i18n.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xE6E6E6E6),
      appBar: AppBar(
        title: Center(child: Text(S.of(context).translate("orders"),style: TextStyle(color: Colors.black),)),
        backgroundColor: Colors.white,
      ),
body: SafeArea(
    child: SingleChildScrollView(
    padding: const EdgeInsets.symmetric(horizontal: 0.0),
    child: Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: OrderCard(),
      ),
    ]))),
    );
  }
}
