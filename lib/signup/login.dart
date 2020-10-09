import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:janaapp/generated/i18n.dart';
import 'package:janaapp/model/user.dart';
import 'package:janaapp/tabbar.dart';
import 'package:janaapp/widget/login_animation.dart';
import 'package:provider/provider.dart';

import 'newuser.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen();

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> with TickerProviderStateMixin {
  AnimationController _loginButtonController;
  String username, password;
  User user;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  bool isAvailableApple = false;

  @override
  void initState() {
    super.initState();
    _loginButtonController = AnimationController(
        duration: Duration(milliseconds: 3000), vsync: this);
  }

  @override
  void dispose() {
    _loginButtonController.dispose();
    super.dispose();
  }

//  Future<Null> _playAnimation() async {
//    try {
//      setState(() {
//        isLoading = true;
//      });
//      await _loginButtonController.forward();
//    } on TickerCanceled {
//      print('[_playAnimation] error');
//    }
//  }

//  Future<Null> _stopAnimation() async {
//    try {
//      await _loginButtonController.reverse();
//      setState(() {
//        isLoading = false;
//      });
//    } on TickerCanceled {
//      print('[_stopAnimation] error');
//    }
//  }
  List<Color> allColors=[
    Color(0xff92cc72),Color(0xff9DcD65), Color(0xffAcD053), Color(0xffBBD242),




  ];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Builder(
          builder: (context) => GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child:Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      alignment: Alignment.center,
                      width: screenSize.width /
                          (2 / (screenSize.height / screenSize.width)),
                      height: screenSize.height-30,
                      constraints: BoxConstraints(maxWidth: screenSize.width),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 10.0),
                          Center(
                            child: Container(
                                width: MediaQuery.of(context).size.width / 2,
                                height: MediaQuery.of(context).size.width / 2,
                                child: Image.asset(
                                  "assets/images/logo.png",
                                  fit: BoxFit.contain,
                                )),
                          ),

                          const SizedBox(height: 20.0),
                          Align(
                            child: Container(
                              alignment: Alignment.centerRight,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xD3D3D3D3)),
                              borderRadius:  BorderRadius.all(Radius.circular(10.0))),
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: Flexible(
                                  child: TextField(
                                      controller: _usernameController,
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: (value) => username = value,
                                      cursorColor: Color(0xff78c891),
                                      decoration: InputDecoration(
                                        focusColor: Color(0xff78c891),
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        labelText: S.of(context).translate("emailAddress"),
                                        prefixIcon: Icon(
                                          Icons.alternate_email,
                                          color: Color(0xff78c891),
                                          size: 30,
                                        ),
                                      ))),
                            ),
                          ),

                          SizedBox(height: 12.0),
                          Align(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xD3D3D3D3)),
                                  borderRadius:  BorderRadius.all(Radius.circular(10.0))),
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: Flexible(
                                  child: TextField(
                                onChanged: (value) => password = value,
                                obscureText: true,
                                cursorColor: Color(0xff78c891),
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  focusColor: Color(0xff78c891),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  labelText:S.of(context).translate("password"),
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                    color: Color(0xff78c891),
                                    size: 30,
                                  ),
                                ),
                              )),
                            ),
                          ),
                          SizedBox(height: 5.0),
                          GestureDetector(
                            child: Text(
                              S.of(context).translate("forgetPassword"),
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              Provider.of<UserModel>(context, listen: false).login(username:username,password:password);
//                                  launchForgetPassworldURL(forgetPasswordUrl);
                            },
                          ),
                          SizedBox(
                            height: 50.0,
                          ),

                          StaggerAnimation(
                            titleButton: S.of(context).translate("login"),
                            buttonController: _loginButtonController.view,
                            onTap: () {
                              if (!isLoading) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TabBarScreen()),
                                );
                              }
                            },
                          ),
                        ],
                      ),


                    ),
                  ),

                ],
              )
            ),
          ),
        ),
      ),
      bottomNavigationBar:  GestureDetector(
        onTap: ()=>Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignUp()),
        ),
        child: Container(
            height: 60,
//              alignment: FractionalOffset.center,
            decoration: BoxDecoration(gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
                  0.2,
                  0.5,
                  0.7,
                  0.9
                ],
                colors: [
                  allColors[0],
                  allColors[1],
                  allColors[2],
                  allColors[3]
                ]),),
            child: Center(child: Text(
              S.of(context).translate("newCaptain"),style: TextStyle(color: Colors.white),
            )),

        ),
      ),
    );
  }
}
