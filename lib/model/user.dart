import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserModel with ChangeNotifier {
  UserModel() {
    getUser();
  }


  User user;
  bool loggedIn = false;
  bool loading = false;

//  void updateUser(Map<String, dynamic> json) {
//   user.name=json['name']??user!=null&&user.name!=null?user.name:"";
//   user.birthDate=json["birthdate"]??user!=null&&user.birthDate!=null?user.birthDate:"";
//   user.identityNumber=json['identity_number']??user!=null&&user.identityNumber!=null?user.identityNumber:"";
//   user.identityPicture=json['identity_picture']??user!=null&&user?.identityPicture!=null?user.identityPicture:"";
//   user. picture=json['picture']??user!=null&&user.picture!=null?user.picture:"";
//   user. password=json['password']??user!=null&&user.password!=null?user.password:"";
//   user. city=json['city']??user!=null&&user.city!=null?user.city:"";
//   user. bankName=json['bank_name']??user!=null&&user.bankName!=null?user.bankName:"";
//   user. bankNumber=json['bank_number']??user!=null&&user.bankNumber!=null?user.bankNumber:"";
//   user. carFactory=json['car_factory']??user!=null&&user?.carFactory!=null?user.carFactory:"";
//   user. carModel=json['car_model']??user!=null&&user?.carModel!=null?user.carModel:"";
//   user.carType=json['car_type']??user!=null&&user?.carType!=null?user.carType:"";
//   user. carPlateNumber_ar=json['car_ar_number']??user!=null&&user?.carPlateNumber_ar!=null?user.carPlateNumber_ar:"";
//   user. carPlateNumber_en=json['car_en_number']??user!=null&&user?.carPlateNumber_en!=null?user.carPlateNumber_en:"";
//   user. carPlateString_ar=json['car_ar_string']??user!=null&&user?.carPlateString_ar!=null?user.carPlateString_ar:"";
//   user. carPlateString_en=json['car_en_string']??user!=null&&user?.carPlateString_en!=null?user.carPlateString_en:"";
//
//   user. email = json['email']??user!=null&&user?.email!=null?user.email:"";
//   user. mobile = json['mobile']??user!=null&&user?.mobile!=null?user.mobile:"";
//   notifyListeners();
//  }
  Future<void> saveUser(User user) async {
    final LocalStorage storage = LocalStorage("jana");
    try {
      // save to Preference
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('loggedIn', true);

      // save the user Info as local storage
      final ready = await storage.ready;
      if (ready) {
        await storage.setItem("userInfo", user);

      }
    } catch (err) {
      print(err);
    }
  }

  Future<void> getUser() async {
    final LocalStorage storage = LocalStorage("jana");
    try {
      final ready = await storage.ready;

      if (ready) {
        final json = storage.getItem("userInfo");
        if (json != null) {
          user = User.fromJson(json);
          loggedIn = true;
          notifyListeners();
        }
      }
    } catch (err) {
      print(err);
    }
  }

  Future<void> createUser() async {
    try {
      loading = true;
      notifyListeners();
      loggedIn = true;
      await saveUser(user);

      loading = false;
      notifyListeners();
    } catch (err) {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    user = null;
    loggedIn = false;
    final LocalStorage storage = LocalStorage("jana");
    try {
      final ready = await storage.ready;
      if (ready) {
        await storage.deleteItem("userInfo");
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('loggedIn', false);
      }
    } catch (err) {
      print(err);
    }
    notifyListeners();
  }

  Future<void> login(
      {username, password}) async {
    try {
      user.password=password;
      user.email=username;
      loading = true;
      notifyListeners();
      loggedIn = true;
      await saveUser(user);
      loading = false;
      notifyListeners();
    } catch (err) {
      loading = false;
      notifyListeners();
    }}
    Future<bool> isLogin() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      try {
          final json = prefs.getBool("loggedIn");
          return json ;

      } catch (err) {
        return false;
      }
    }
  }



class User {
  int id;
  bool loggedIn;
  String name;
  DateTime birthDate;
  String identityNumber;
  String email;
  String picture;
  String identityPicture;
  String city;
  String bankName;
  String bankNumber;
  String carType;
  String carModel;
String carFactory;
String password;
// ignore: non_constant_identifier_names
String carPlateNumber_ar;
// ignore: non_constant_identifier_names
String carPlateNumber_en;
// ignore: non_constant_identifier_names
String carPlateString_ar;
// ignore: non_constant_identifier_names
String carPlateString_en;
String carPicture;
String  formPicture;
String licensePicture;
  String mobile;
  bool isSocial = false;

  User.fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'];
      name=json['name'];
      birthDate=json["birthdate"];
      identityNumber=json['identity_number'];
      identityPicture=json['identity_picture'];
      loggedIn=json['loggedin'];
      picture=json['picture'];
      password=json['password'];
      city=json['city'];
      bankName=json['bank_name'];
      bankNumber=json['bank_number'];
      carFactory=json['car_factory'];
      carModel=json['car_model'];
      carType=json['car_type'];
      carPlateNumber_ar=json['car_ar_number'];
      carPlateNumber_en=json['car_en_number'];
      carPlateString_ar=json['car_ar_string'];
      carPlateString_en=json['car_en_string'];
      carPicture=json['car_picture'];
      formPicture=json['form_picture'];
      licensePicture=json['license_picture'];
      email = json['email'];
      mobile = json['mobile'];
    } catch (e) {
      print(e.toString());
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "loggedIn": loggedIn,
      "name": name,
      "email": email,
      "picture": picture,
      "isSocial": isSocial,
      "mobile": mobile,
   "birth_date":birthDate,
   "identity_number": identityNumber,
   "identity_picture": identityPicture,
   "logged_In": loggedIn,
    "password":password,
  "city":  city,
   "bank_name": bankName,
    'bank_number': bankNumber,
    'car_factory': carFactory,
    'car_model' :carModel,
    'car_type': carType,
    'car_ar_number' : carPlateNumber_ar,
    'car_en_number' :carPlateNumber_en,
    'car_ar_string':carPlateString_ar,
    'car_en_string': carPlateString_en,
    'car_picture': carPicture,
    'form_picture': formPicture,
    'license_picture': licensePicture,
    };
  }
}