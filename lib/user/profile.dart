import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:janaapp/generated/i18n.dart';
import 'package:janaapp/widget/login_animation.dart';

import 'account.dart';

class UserProfile extends StatefulWidget {
  final bool newUser;

  UserProfile({this.newUser = false});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile>
    with TickerProviderStateMixin {
  String name, identity, picture;
  DateTime birthDate;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _identityController = TextEditingController();
  AnimationController _loginButtonController;
  Color _iconColor = Color(0xffBBD242);
  File _imageProfile, _imageIdentity;
  final _formKey = GlobalKey<FormState>();

  _imgFromCamera(int name) async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);
    if (name == 1) {
      setState(() {
        _imageProfile = image;
        checkimage=true;
      });
    } else {
      setState(() {
        _imageIdentity = image;
        ckeckIdentityImage=true;
      });
    }
  }

  _imgFromGallery(int name) async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    if (name == 1) {
      setState(() {
        _imageProfile = image;
        checkimage=true;
      });
    } else {
      setState(() {
        _imageIdentity = image;
        ckeckIdentityImage=true;
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
                      title: new Text(S.of(context).translate("PhotoGallery")),
                      onTap: () {
                        _imgFromGallery(image);
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text(S.of(context).translate("Camira")),
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
//    _user=Provider.of<UserModel>(context).user;
//    if(_user!=null && widget.newUser) {
//      _nameController.text = _user.name;
//      _identityController.text=_user.identityNumber;
//    }
    _loginButtonController = AnimationController(
      duration: Duration(milliseconds: 3000),
      vsync: this,
    );
  }

  bool _birthDate = true;
  bool checkimage=true;
  bool ckeckIdentityImage=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).translate("personalinformation"),
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
                      height: 20,
                    ),
                    Container(
                      width: 120,
                      height: 120,
                      child: Stack(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Color(0xE4E4E4E4),
                            child: _imageProfile != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(150),
                                    child: Image.file(
                                      _imageProfile,
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Center(
                                    child: Icon(
                                      Icons.person,
                                      size: 120,
                                      color: Color(0xBCBCBCBC),
                                    ),
                                  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(150),
                                      border: Border.all(
                                          color: Color(0xff78c891), width: 2)),
                                  child: Icon(
                                    Icons.add,
                                    size: 20,
                                    color: Color(0xff78c891),
                                  ),
                                ),
                                onTap: () {
                                  _showPicker(context, 1);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Text(checkimage?S.of(context).translate("personalphoto"):S.of(context).translate("choosepersonalphoto"),style: TextStyle(color: checkimage?Colors.black:Colors.red),),
                    SizedBox(height: 12.0),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xD3D3D3D3)),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Flexible(
                          child: TextFormField(
                        onChanged: (value) => name = value,
                        controller: _nameController,
                        validator: (val) {
                          return val.isEmpty
                              ? S.of(context).translate("enterfullname")
                              : null;
                        },
                        cursorColor: Color(0xff78c891),
                        decoration: InputDecoration(
                          focusColor: Color(0xff78c891),
                          labelText: S.of(context).translate("fullname"),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: _iconColor,
                          ),
                        ),
                      )),
                    ),
                    SizedBox(height: 12.0),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xD3D3D3D3)),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Flexible(
                          child: InkWell(
                        onTap: () async {
                          birthDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime(2000),
                            firstDate: DateTime(1970),
                            lastDate: DateTime(2020),
                            builder: (BuildContext context, Widget child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                    buttonColor: _iconColor,
                                    //OK/Cancel button text color
                                    primaryColor: _iconColor,
                                    //Head background
                                    accentColor: _iconColor //selection color
                                    //dialogBackgroundColor: Colors.white,//Background color
                                    ),
                                child: child,
                              );
                            },
                          );
                          setState(() {
                            if (birthDate != null) {
                              _birthDate = true;
                            } else {
                              _birthDate = false;
                            }
                          });
                        },
                        child: TextFormField(
                          enabled: false,
                          controller: TextEditingController(
                            text: birthDate != null
                                ? DateFormat("yyyy/MM/dd").format(
                                    DateTime.parse(birthDate.toIso8601String()),
                                  )
                                : null,
                          ),
//                          style: TextStyle(
//                              color: _birthDate ? Colors.black : Colors.red),
                          cursorColor: Color(0xff78c891),
                          decoration: InputDecoration(
                            focusColor: Color(0xff78c891),
//                            labelText: S.of(context).translate("birthDate"),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText:_birthDate? S.of(context).translate("birthDate"):S.of(context).translate("choosebirthDate"),
                            hintStyle: TextStyle(
                                color: _birthDate ? Colors.black : Colors.red),
                            prefixIcon: Icon(
                              Icons.calendar_today,
                              color: _iconColor,
                            ),
                          ),
                        ),
                      )),
                    ),
                    SizedBox(height: 12.0),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xD3D3D3D3)),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                              child: TextFormField(
                            onChanged: (value) => identity = value,
                            cursorColor: Color(0xff78c891),
                            controller: _identityController,
                            keyboardType: TextInputType.number,
                            validator: (val) {
                              return val.isEmpty ? S.of(context).translate("enterId") : null;
                            },
                            decoration: InputDecoration(
                              focusColor: Color(0xff78c891),
                              labelText: S.of(context).translate("id"),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.perm_identity,
                                color: _iconColor,
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xD3D3D3D3)),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.image,
                                color: _iconColor,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Flexible(
                                  child: Text(
                                ckeckIdentityImage?S.of(context).translate("idphoto"):S.of(context).translate("uploadidphoto"),
                                      style: TextStyle(color: ckeckIdentityImage?Colors.black:Colors.red),
                              )),
                            ],
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
                                    image: _imageIdentity != null
                                        ? DecorationImage(
                                            image:
                                                new FileImage(_imageIdentity),
                                            fit: BoxFit.cover,
                                          )
                                        : null,
                                    border:
                                        Border.all(color: Color(0xD3D3D3D3)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
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
                    ),
                    SizedBox(height: 20.0),
                    StaggerAnimation(
                      titleButton: S.of(context).translate("next"),
                      buttonController: _loginButtonController.view,
                      onTap: () {
//                      Provider.of<UserModel>(context, listen: false).updateUser({"name":name,"picture":picture,"birthdate":birthDate,"identity_number":identity});
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          if (birthDate == null||_imageIdentity==null||_imageProfile==null) {
                            setState(() {
                              if (birthDate != null) {
                                _birthDate = true;
                              } else {
                                _birthDate = false;
                              }
                              if ( _imageIdentity!= null) {
                                ckeckIdentityImage = true;
                              } else {
                                ckeckIdentityImage = false;
                              }
                              if (_imageProfile != null) {
                                checkimage = true;
                              } else {
                                checkimage = false;
                              }
                            });
                          } else {
                            setState(() {
                              _birthDate=true;
                              checkimage=true;
                              checkimage=true;
                            });

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AccountInfo(newUser: widget.newUser)),
                            );
                          }
                        }
                      },
                    ),
                    SizedBox(height: 20.0),
                  ]),
                ))));
  }
}
