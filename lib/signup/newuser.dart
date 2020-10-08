import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:janaapp/model/user.dart';
import 'package:janaapp/widget/login_animation.dart';

import 'verify.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with TickerProviderStateMixin{
  AnimationController _loginButtonController;
  final TextEditingController _controller = TextEditingController(text: '');
  User user;
  CountryCode countryCode;
  String phoneNumber;
  String _phone;
  @override
  void initState() {
    super.initState();
    _loginButtonController = AnimationController(
      duration: Duration(milliseconds: 3000),
      vsync: this,
    );

    _phone = '';
    countryCode = CountryCode(
      code: LoginSMSConstants.countryCodeDefault,
      dialCode: LoginSMSConstants.dialCodeDefault,
      name: LoginSMSConstants.nameDefault,
    );
    _controller.addListener(() {
      if (_controller.text != _phone && _controller.text != '') {
        _phone = _controller.text;
        onPhoneNumberChange(
          _phone,
          '${countryCode.dialCode}$_phone',
          countryCode.code,
        );
      }
    });
  }
  void onPhoneNumberChange(
      String number,
      String internationalizedPhoneNumber,
      String isoCode,
      ) {
    if (internationalizedPhoneNumber.isNotEmpty) {
      phoneNumber = internationalizedPhoneNumber;
    } else {
      phoneNumber = null;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تسجيل كابتن جديد",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        leading:  IconButton(
          icon:Icon( Icons.arrow_back_ios,
            color: Colors.black,),
          onPressed: ()=>Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child:  SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 50.0),
                          Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 130,
                                    child: Image.asset("assets/images/phone.png"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              color: Colors.green.shade200,
                              child: Center(child: Text("سجل رقم جوال",style: TextStyle(color: Colors.black,fontSize: 20),)),
                            ),
                          ),
                          const SizedBox(height: 60.0),

                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xD3D3D3D3)),
                                borderRadius:  BorderRadius.all(Radius.circular(10.0))
                            ),
                            padding: EdgeInsets.only(left: 5,right: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              textDirection: TextDirection.rtl,
                              children: <Widget>[
                               Expanded(
                                  child: TextField(
                                    cursorColor: Color(0xff78c891),
                                    decoration:
                                    InputDecoration(
                                        focusColor: Color(0xff78c891),
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        labelText: "رقم جوالك"),
                                    keyboardType: TextInputType.phone,
                                    controller: _controller,
                                  ),
                                ),

                                Divider(color: Colors.grey.shade200,height: 5,),
                                CountryCodePicker(
//                                  onChanged: (country) {
//                                setState(() {
//                                  countryCode = country;
//                                });
//                                  },
                                  showFlag: true,
                                  // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                  initialSelection: countryCode.code,
                                  //Get the country information relevant to the initial selection
                                  onInit: (code) {
                                countryCode = code;
                                  },
                                  showFlagMain: true,
                                ),

                              ],
                            ),
                          ),
                          SizedBox(
                            height: 60.0,
                          ),
                          StaggerAnimation(
                            titleButton: "تأكيد",
                            buttonController: _loginButtonController.view,
                            onTap: () {

//                              Provider.of<UserModel>(context, listen: false).updateUser({"id":0,"mobile":phoneNumber}) ;
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Verify()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),

      ),
    );
  }

}
class LoginSMSConstants {
  static const String countryCodeDefault = 'SA';
  static const String dialCodeDefault = '+966';
  static const String nameDefault = 'Saudi Arabia';
}