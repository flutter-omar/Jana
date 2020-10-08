import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:janaapp/tabbar.dart';
import 'package:janaapp/widget/login_animation.dart';

class Vehicle extends StatefulWidget {
  final bool newUser;

  Vehicle({this.newUser});

  @override
  _VehicleState createState() => _VehicleState();
}

class _VehicleState extends State<Vehicle> with TickerProviderStateMixin {
  AnimationController _loginButtonController;
  String typeCar, modelCar, factoryCar, enString, enNumber;
  final TextEditingController _enStringController = TextEditingController();
  final TextEditingController _enNumberController = TextEditingController();
  Color _iconColor = Color(0xffBBD242);
  final _formKey = GlobalKey<FormState>();
  File _car, _carCard, _carLicense;
  String _typeCar;

  String _factoryCAr;
  String _carDate;

  bool _carImage = false;
  bool _carCardImage = false;
  bool _carLicenseImage = false;

  _imgFromCamera(int name) async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);
    if (name == 1) {
      setState(() {
        _car = image;
        _carImage = true;
      });
    } else if (name == 2) {
      setState(() {
        _carCard = image;
        _carCardImage = true;
      });
    } else {
      setState(() {
        _carLicense = image;
        _carLicenseImage = true;
      });
    }
  }

  _imgFromGallery(int name) async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    if (name == 1) {
      setState(() {
        _car = image;
      });
    } else if (name == 2) {
      setState(() {
        _carCard = image;
      });
    } else {
      setState(() {
        _carLicense = image;
      });
    }
  }

  void _showPicker(context, int image) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('مكتبة الصور'),
                      onTap: () {
                        _imgFromGallery(image);
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('الكاميرا'),
                    onTap: () {
                      _imgFromCamera(image);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
//    User _user=Provider.of<UserModel>(context).user;
//    if(_user!=null&&widget.newUser) {
//      _carmodelController.text = _user.carModel;
//      _cartypeController.text=_user.carType;
//      _carfactoryController.text=_user.carFactory;
//      _enNumberController.text=_user.carPlateNumber_en;
//      _enStringController.text=_user.carPlateString_en;
//      _arStringController.text=_user.carPlateString_ar;
//      _arNumberController.text=_user.carPlateNumber_ar;
//
//    }
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
            "معلومات المركبة",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
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
                    child:
                        Center(child: Image.asset("assets/images/car.png")),
                  ),
                  SizedBox(height: 12.0),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xD3D3D3D3)),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      padding: EdgeInsets.all(10),
                      child: Expanded(
                        child: Column(
                          children: <Widget>[
                            TextField(
//                              onChanged: (value) => identity = value,
                              enabled: false,
                              decoration: InputDecoration(
                                focusColor: Color(0xff78c891),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                labelText: "المركبة",
                                prefixIcon: Icon(
                                  Icons.directions_car,
                                  color: _iconColor,
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xD3D3D3D3)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              padding: EdgeInsets.all(10),
                              child: renderCarTypeInput(),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xD3D3D3D3)),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                padding: EdgeInsets.all(10),
                                child: renderCarFactoryInput()),
                            SizedBox(height: 10.0),
                            Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xD3D3D3D3)),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                padding: EdgeInsets.all(10),
                                child: renderCarDateInput()),
                          ],
                        ),
                      )),
                  SizedBox(height: 10.0),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xD3D3D3D3)),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      padding: EdgeInsets.all(10),
                      child: Expanded(
                        child: Column(
                          children: <Widget>[
                            TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                focusColor: Color(0xff78c891),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "رقم اللوحة",
                                prefixIcon: Icon(
                                  Icons.featured_play_list,
                                  color: _iconColor,
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
//                      Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                          children: <Widget>[
//                            Expanded(
//                              child: Container(
//                                decoration: BoxDecoration(
//                                    border: Border.all(color: Color(0xD3D3D3D3)),
//                                    borderRadius:  BorderRadius.all(Radius.circular(10.0))
//                                ),
//                                padding: EdgeInsets.all(5),
//                                child:Center(
//                                  child: TextFormField(
//                                    onChanged: (value) => arNumber = value,
//                                    controller: _arNumberController,
//                                    cursorColor: Color(0xff78c891),
//                                    validator: (val) {
//                                      return val.isEmpty
//                                          ? "الرجاء أدخال الارقام"
//                                          : val.length<3?
//                                      "العدد لايقل عن 3"
//                                          :null;
//                                    },
//                                    keyboardType: TextInputType.number,
//                                    decoration: InputDecoration(
//                                      focusColor: Color(0xff78c891),
//                                      focusedBorder: InputBorder.none,
//                                      enabledBorder: InputBorder.none,
//                                      errorBorder: InputBorder.none,
//                                      disabledBorder: InputBorder.none,
//                                      labelText: "أرقام عربية",
//                                    ),
//                                  ),
//                                ),),
//                            ),
//                            SizedBox(
//                              width: 5,
//                            ),
//                            Expanded(
//                              child: Container(
//                                decoration: BoxDecoration(
//                                    border: Border.all(color: Color(0xD3D3D3D3)),
//                                    borderRadius:  BorderRadius.all(Radius.circular(10.0))
//                                ),
//                                  padding: EdgeInsets.all(5),
//                                child:Center(
//                                  child: TextFormField(
//                                    onChanged: (value) => arString = value,
//cursorColor: Color(0xff78c891),
//                                    validator: (val) {
//                                      return val.isEmpty
//                                          ? "الرجاء أدخال الاحرف"
//                                          : val.length<3?
//                                      "العدد لايقل عن 3"
//                                          :null;
//                                    },
//                                    controller: _arStringController,
//                                    decoration: InputDecoration(
//                                      focusColor: Color(0xff78c891),
//                                      focusedBorder: InputBorder.none,
//                                      enabledBorder: InputBorder.none,
//                                      errorBorder: InputBorder.none,
//                                      disabledBorder: InputBorder.none,
//                                      labelText: "أحرف عربية",
//                                    ),
//                                  ),
//                                )
//                              ),
//                            ),
//                          ],
//                        ),
                            SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xD3D3D3D3)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  padding: EdgeInsets.all(5),
                                  child: Center(
                                    child: TextFormField(
                                      onChanged: (value) => enNumber = value,
                                      cursorColor: Color(0xff78c891),
                                      validator: (val) {
                                        return val.isEmpty
                                            ? "الرجاء أدخال الأرقام"
                                            : null;
                                      },
                                      keyboardType: TextInputType.number,
                                      controller: _enNumberController,
                                      decoration: InputDecoration(
                                        focusColor: Color(0xff78c891),
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        labelText: "أرقام اللوحة",
                                      ),
                                    ),
                                  ),
                                )),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xD3D3D3D3)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  padding: EdgeInsets.all(5),
                                  child: Center(
                                    child: TextFormField(
                                      onChanged: (value) => enString = value,
                                      validator: (val) {
                                        return val.isEmpty
                                            ? "الرجاء أدخال الاحرف"
                                            : val.length < 3
                                                ? "العدد لايقل عن 3"
                                                : null;
                                      },
                                      controller: _enStringController,
                                      cursorColor: Color(0xff78c891),
                                      decoration: InputDecoration(
                                        focusColor: Color(0xff78c891),
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        labelText: "إحرف إنكليزية",
                                      ),
                                    ),
                                  ),
                                )),
                              ],
                            ),
                          ],
                        ),
                      )),
                  SizedBox(height: 10.0),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xD3D3D3D3)),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      padding: EdgeInsets.all(10),
                      child: Expanded(
                        child: Column(
                          children: <Widget>[
                            TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                focusColor: Color(0xff78c891),
                                hintText: _carImage
                                    ? "صورة السيارة من الامام"
                                    : "الرجاء إدخال صورة السيارة من الأمام",
                                prefixIcon: Icon(
                                  Icons.image,
                                  color: _iconColor,
                                ),
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: InkWell(
                                onTap: () {
                                  _showPicker(context, 1);
                                },
                                child: Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                      image: _car != null
                                          ? DecorationImage(
                                              image: new FileImage(_car),
                                              fit: BoxFit.cover,
                                            )
                                          : null,
                                      border:
                                          Border.all(color: Color(0xD3D3D3D3)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      color: Color(0xD3D3D3D3)),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                  SizedBox(height: 10.0),
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xD3D3D3D3)),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Expanded(
                        child: Column(
                          children: <Widget>[
                            TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                focusColor: Color(0xff78c891),
                                hintText: _carCardImage
                                    ? "صورة الأستمارة"
                                    : "الرجاء ادخال صورة الاستمارة",
                                prefixIcon: Icon(
                                  Icons.image,
                                  color: _iconColor,
                                ),
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: InkWell(
                                onTap: () {
                                  _showPicker(context, 2);
                                },
                                child: Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                      image: _carCard != null
                                          ? DecorationImage(
                                              image: new FileImage(_carCard),
                                              fit: BoxFit.cover,
                                            )
                                          : null,
                                      border:
                                          Border.all(color: Color(0xD3D3D3D3)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      color: Color(0xD3D3D3D3)),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                  SizedBox(height: 5.0),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xD3D3D3D3)),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      padding: EdgeInsets.all(10),
                      child: Expanded(
                        child: Column(
                          children: <Widget>[
                            TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                focusColor: Color(0xff78c891),
                                hintText: _carLicenseImage
                                    ? "صورة الرخصة"
                                    : "الرجاء ادخال صورة الرخصة",
                                prefixIcon: Icon(
                                  Icons.image,
                                  color: _iconColor,
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: InkWell(
                                onTap: () {
                                  _showPicker(context, 0);
                                },
                                child: Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                      image: _carLicense != null
                                          ? DecorationImage(
                                              image: new FileImage(_carLicense),
                                              fit: BoxFit.cover,
                                            )
                                          : null,
                                      border:
                                          Border.all(color: Color(0xD3D3D3D3)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      color: Color(0xD3D3D3D3)),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                  SizedBox(height: 20.0),
                  StaggerAnimation(
                    titleButton:
                        !widget.newUser ? "أرسل طلب التسجيل" : "نعديل البيانات",
                    buttonController: _loginButtonController.view,
                    onTap: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        if (_car == null ||
                            _carCard == null ||
                            _carLicense == null) {
                          setState(() {
                            if (_car != null) {
                              _carImage = true;
                            } else {
                              _carImage = false;
                            }
                            if (_carCard != null) {
                              _carCardImage = true;
                            } else {
                              _carCardImage = false;
                            }
                            if (_carLicense != null) {
                              _carLicenseImage = true;
                            } else {
                              _carLicenseImage = false;
                            }
                          });
                        } else {
                          setState(() {
                            _carImage=_carLicenseImage=_carCardImage=true;
                          });
                          if (!widget.newUser) {
                            _showMyDialog();
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TabBarScreen()),
                            );
                          }
                        }
                      }
                    },
                  ),
                  SizedBox(height: 20.0),
                ]),
              )),
        ));
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Icon(
            Icons.check_circle,
            color: Colors.white,
            size: 20,
          ),
          backgroundColor: Color(0xffAcD053),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Center(
                  child: Text(
                    'تم إرسال طلبك بنجاح',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                Center(
                  child: Text(
                    'سيتم التواصل معك قريبا',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Center(
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TabBarScreen()),
                ),
                child: Center(
                  child: Container(
                      width: 100,
                      height: 50,
                      alignment: FractionalOffset.center,
                      decoration: BoxDecoration(
                          color: Color(0xffAcD053),
                          borderRadius:
                              BorderRadius.all(const Radius.circular(25.0)),
                          border: Border.all(color: Colors.white)),
                      child: Text(
                        "إغلاق",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.3,
                        ),
                      )),
                ),
              ),
            ),
//                  StaggerAnimation(
//                    titleButton: "إغلاق",
//                    buttonController: _loginButtonController.view,
//                    onTap: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(builder: (context) => AccountInfo()),
//                      );
//                    },
//                  ),
          ],
        );
      },
    );
  }

  Widget renderCarTypeInput() {
    List<DropdownMenuItem<String>> items = [];
    List<String> carTypeList = ["سيدان", "هاتشباك", "وانيت ", "جيب "];
    items = carTypeList.map<DropdownMenuItem<String>>((String element) {
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
              hintText: "طراز المركبة"),
        ),
      );
    }).toList();

    return DropdownButtonFormField<String>(
      decoration: InputDecoration.collapsed(hintText: ""),
      icon: Icon(Icons.keyboard_arrow_down),
      items: items,
      value: _typeCar,
      validator: (val) {
        if (val == null) {
          return "ألرجاء اختيار طراز المركبة";
        } else {
          return null;
        }
      },
      onChanged: (val) {
        setState(() {
          _typeCar = val;
          typeCar = _typeCar;
        });
      },
      isExpanded: true,
      itemHeight: 50,
      hint: Text("طراز المركبة"),
    );
  }

  Widget renderCarDateInput() {
    List<DropdownMenuItem<String>> items = [];
    List<String> carDateList = [
      "2000",
      "2001",
      "2002 ",
      "2003",
      "2004",
      "2005",
      "2006",
      "2007 ",
      "2008 ",
      "2009",
      "2010",
      "2011",
      "2012 ",
      "2013",
      "2014",
      "2015",
      "2016",
      "2017 ",
      "2018 ",
      "2019",
      "2020",
      "2021",
      "2022"
    ];
    items = carDateList.map<DropdownMenuItem<String>>((String element) {
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
              hintText: "سنة الصنع"),
        ),
      );
    }).toList();

    return DropdownButtonFormField<String>(
      decoration: InputDecoration.collapsed(hintText: ""),
      icon: Icon(Icons.keyboard_arrow_down),
      items: items,
      value: _carDate,
      validator: (val) {
        if (val == null) {
          return "ألرجاء اختيار سنة الصنع";
        } else {
          return null;
        }
      },
      onChanged: (val) {
        setState(() {
          _carDate = val;
          modelCar = _carDate;
        });
      },
      isExpanded: true,
      itemHeight: 50,
      hint: Text("سنة الصنع"),
    );
  }

  Widget renderCarFactoryInput() {
    List<DropdownMenuItem<String>> items = [];
    List<String> carFactoryList = [
      "تويوتا",
      "هيونداي",
      "كيا",
      "فورد",
      "لكزس",
      "شفرليه",
      "كاديلاك",
      "جيلي",
      "ام جي"
    ];
    items = carFactoryList.map<DropdownMenuItem<String>>((String element) {
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
              hintText: "ماركة المركبة"),
        ),
      );
    }).toList();

    return DropdownButtonFormField<String>(
      decoration: InputDecoration.collapsed(hintText: ""),
      icon: Icon(Icons.keyboard_arrow_down),
      items: items,
      value: _factoryCAr,
      validator: (val) {
        if (val == null) {
          return "ألرجاء اختيار ماركة المركبة";
        } else {
          return null;
        }
      },
      onChanged: (val) {
        setState(() {
          _factoryCAr = val;
          factoryCar = _factoryCAr;
        });
      },
      isExpanded: true,
      itemHeight: 50,
      hint: Text("ماركة المركبة"),
    );
  }
}
