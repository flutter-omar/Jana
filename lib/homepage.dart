
import 'package:flutter/material.dart';
import 'package:janaapp/homescreen.dart';
import 'package:janaapp/signup/login.dart';
import 'package:provider/provider.dart';

import 'model/user.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoggin;
  @override
  Widget build(BuildContext context) {
    isLoggin=Provider.of<UserModel>(context, listen: false).loggedIn;
    return isLoggin?HomeScreen():LoginScreen();
  }
}
