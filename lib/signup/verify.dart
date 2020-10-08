import 'package:flutter/material.dart';
import 'package:janaapp/user/profile.dart';
import 'package:janaapp/widget/login_animation.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class Verify extends StatefulWidget {
  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> with TickerProviderStateMixin {
  AnimationController _loginButtonController;

  @override
  void initState() {
    super.initState();
    _loginButtonController = AnimationController(
      duration: Duration(milliseconds: 3000),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "تأكيد رقم الجوال",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading:  IconButton(
          icon:Icon( Icons.arrow_back_ios,
            color: Colors.black,),
          onPressed: ()=>Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Container(
                height: 130,
                child: Center(child: Image.asset("assets/images/phone-code.png")),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.green.shade200,
                  child: Center(
                      child: Text(
                    "رمز التحقق",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )),
                ),
              ),
              const SizedBox(height: 50.0),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                  child: PinCodeTextField(
                    maxLength: 4,
                    textDirection: TextDirection.ltr,
                    keyboardType: TextInputType.number,
                    autofocus: false,
                    highlightAnimationDuration: Duration(milliseconds: 300),
                    pinBoxHeight: 50,
                    pinBoxWidth: 40,
                    wrapAlignment: WrapAlignment.center,
                    pinTextStyle: TextStyle(color: Colors.green.shade200),
                    onTextChanged: (value) {
                      if (value != null && value.length == 6) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UserProfile()),
                        );
                      }
                    },
                    onDone: (value) {
                      if (value != null && value.length == 6) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UserProfile()),
                        );
                      }
                    },
                  )),
              SizedBox(
                height: 50.0,
              ),
              StaggerAnimation(
                titleButton: "تأكيد",
                buttonController: _loginButtonController.view,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserProfile()),
                  );
                },
              ),
              SizedBox(
                height: 40.0,
              ),
              Center(child: Text("لم تستلم رمز تحقق!")),
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                child: Text(
                  "إعادة إرسال رمز التحقق",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,),
                ),
                onTap: () {
//                                  launchForgetPassworldURL(forgetPasswordUrl);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
