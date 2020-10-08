import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:janaapp/user/bankaccount.dart';
import 'package:janaapp/widget/login_animation.dart';
import 'dart:convert' as convert;

import 'package:validate/validate.dart';

class AccountInfo extends StatefulWidget {
   final bool newUser;
   AccountInfo({this.newUser});
  @override
  _AccountInfoState createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo>
    with TickerProviderStateMixin {
  String username, password, city;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  AnimationController _loginButtonController;
  Color _iconColor = Color(0xffBBD242);
  final _formKey = GlobalKey<FormState>();
  List<dynamic> cities = [];
  String _value ;
  Future<void> getCity() async {
    cities = await loadCities();
  }

  @override
  void initState() {
    super.initState();
//   User _user=Provider.of<UserModel>(context).user;
//    if(_user!=null&&widget.newUser) {
//      _usernameController.text = _user.email;
//      _passwordController.text=_user.password;
//      _value=_user.city;
//    }
//    getCity();
    _loginButtonController = AnimationController(
      duration: Duration(milliseconds: 3000),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
//    print("${cities[0].toString()}");
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "معلومات الحساب",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(   Icons.arrow_back_ios,
              color: Colors.black,),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 130,
                      child: Center(
                          child: Image.asset("assets/images/driver.png")),
                    ),
                    SizedBox(height: 12.0),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xD3D3D3D3)),
                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                      ),
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Flexible(
                          child: TextFormField(
                            onChanged: (value) => username = value,

                            validator: (val) {
                              return val.isEmpty
                                  ? "الرجاء أدخال البريد الالكتروني"
                                  :Validator.validateEmail(val);
                            },
                            controller: _usernameController,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Color(0xff78c891),
                            decoration: InputDecoration(
focusColor: Color(0xff78c891),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              labelText: "البريد الالكتروني",
                              prefixIcon: Icon(Icons.email, color: _iconColor,),
                            ),
                          )),
                    ),
                    SizedBox(height: 12.0),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xD3D3D3D3)),
                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                      ),
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Flexible(
                          child: TextFormField(

                            onChanged: (value) => password = value,
                            obscureText: true,
                            controller: _passwordController,
                            validator: (val) {
                              return val.isEmpty
                                  ? "الرجاء أدخال كلمة السر"
                                  : val.length<6?
                                  "كلمة السر لاتقل عن 6 احرف"
                              :null;
                            },
                            cursorColor: Color(0xff78c891),
                            decoration: InputDecoration(
                              focusColor: Color(0xff78c891),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              labelText: "كلمة المرور",
                              prefixIcon: Icon(
                                Icons.lock_outline, color: _iconColor,),
                            ),
                          )),
                    ),
                    SizedBox(height: 12.0),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xD3D3D3D3)),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: Color(0xD3D3D3D3)
                      ),

                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Flexible(
                          child: TextFormField(
//                              onChanged: (value) => identity = value,
                            obscureText: true,
                            enabled: false,
                            controller: _countryController,
                            decoration: InputDecoration(
                              focusColor: Color(0xff78c891),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              labelText: "المملكة العربية السعودية",
                              prefixIcon: Icon(
                                Icons.language, color: Colors.grey,),
                            ),
                          )),
                    ),
                    SizedBox(height: 12.0),

                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xD3D3D3D3)),
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: renderCityInput(),
                        )),
                    SizedBox(height: 20.0),
                    StaggerAnimation(
                      titleButton: "التالي",
                      buttonController: _loginButtonController.view,
                      onTap: () {
//                      Provider.of<UserModel>(context, listen: false).updateUser({"email":username,"password":password,"city":city});

                       if(_formKey.currentState.validate()){
                         _formKey.currentState.save();
                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BankAccount(newUser:widget.newUser)),
                        );}
                      },
                    ),
                    SizedBox(height: 20.0),
                  ]),
                ))));
  }

  Widget renderCityInput() {

    List<DropdownMenuItem<String>> items = [];
    List<String> _city = ["المدينة المنورة",
      "الرياض",
      "جدة",
      " مكة",
      "ينبع", "أبها",
      "الدمام",
      "الخبر",
      "تبوك",
    ];
    if (cities.isEmpty) {
      items=_city.map<DropdownMenuItem<String>>((String element) {
        return DropdownMenuItem<String>(
          value: element,
          child: TextFormField(
            enabled: false,
            decoration: InputDecoration(
              focusColor: Color(0xff78c891),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              labelText: element,
              prefixIcon: Icon(Icons.location_on, color: _iconColor,),
            ),),
        );
      }).toList();
    }
    else if (cities.isNotEmpty) {
      cities.forEach((item) {
        items.add(
          DropdownMenuItem(
            child: TextFormField(
              enabled: false,
              decoration: InputDecoration(
                focusColor: Color(0xff78c891),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                labelText: item["name_ar"],
                prefixIcon: Icon(Icons.location_on, color: _iconColor,),
              ),),
            value: item["name_ar"],
          ),
        );
      });
    }
    return DropdownButtonFormField<String>(
//      underline:  Container(
//        height: 0,
//        color: Colors.white,
//      ),
      decoration: InputDecoration.collapsed(hintText: ""),
      icon: Icon(Icons.keyboard_arrow_down),
      items: items,
      validator: (val){
        if(val==null){
          return "ألرجاء اختيار المدينة";
        }else{
          return null;
        }
      },
      value: _value,
      onChanged: (val) {
        setState(() {
          _value = val;
          city=_value;
        });
      },
      isExpanded: true,
      itemHeight: 50,
      hint: Text("المدينة"),
    );
  }

  static Future<List<dynamic>> loadCities() async {
    try {
      // load local config
      String path = "lib/config/cities_sa.json";
      print("111");
      final appJson = await rootBundle.loadString(path);
      print("111");
      return List<dynamic>.from(convert.jsonDecode(appJson));
    } catch (e) {
      print("222");
      return [];
    }
  }
}
class Validator {
  static String validateEmail(String value) {
    try {
      Validate.isEmail(value);
    } catch (e) {
      return 'الرجاء ادخال بريد إلكتروني صالح';
    }

    return null;
  }
}