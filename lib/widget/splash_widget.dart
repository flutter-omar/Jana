
import 'dart:async';


import 'package:flutter/material.dart';
import 'package:janaapp/signup/login.dart';




class SplashWidget extends StatefulWidget {
  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {

  @override
  void initState() {
    super.initState();

    loadData();
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: Container(
                width: width,
                height: height,
                child: Image.asset(
                  "assets/images/splash-screen.png",
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
  }

}
