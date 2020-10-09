import 'package:flutter/material.dart';
import 'package:janaapp/generated/i18n.dart';
import 'package:janaapp/widget/login_animation.dart';

import 'vehicle.dart';

class BankAccount extends StatefulWidget {
  final bool newUser;

  BankAccount({this.newUser});

  @override
  _BankAccountState createState() => _BankAccountState();
}

class _BankAccountState extends State<BankAccount>
    with TickerProviderStateMixin {
  String name, bank, accountnum;
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _accountnumController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AnimationController _loginButtonController;
  String _value ;
  Color _iconColor = Color(0xffBBD242);

  @override
  void initState() {
    super.initState();
//    User _user=Provider.of<UserModel>(context).user;
//    if(_user!=null&&widget.newUser) {
//      _nameController.text = _user.name;
//      _bankController.text=_user.bankName;
//      _accountnumController.text=_user.bankNumber;
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
            S.of(context).translate("bankAccount"),
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
                          Center(child: Image.asset("assets/images/card.png")),
                    ),
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
                        validator: (val) {
                          return val.isEmpty
                              ?  S.of(context).translate("enterfullname")
                              : null;
                        },
                        controller: _nameController,
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: renderBankInput(_bank),
                        )),
                    SizedBox(height: 12.0),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xD3D3D3D3)),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Flexible(
                          child: TextFormField(
                        onChanged: (value) => accountnum = value,
                        keyboardType: TextInputType.number,
                        controller: _accountnumController,
                        validator: (val) {
                          return val.isEmpty ?  S.of(context).translate("chooseiban") : null;
                        },
                        cursorColor: Color(0xff78c891),
                        decoration: InputDecoration(
                          focusColor: Color(0xff78c891),
                          labelText:  S.of(context).translate("iban"),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.credit_card,
                            color: _iconColor,
                          ),
                        ),
                      )),
                    ),
                    SizedBox(height: 20.0),
                    StaggerAnimation(
                      titleButton: S.of(context).translate("next"),
                      buttonController: _loginButtonController.view,
                      onTap: () {
                        // Provider.of<UserModel>(context, listen: false).updateUser({"bank_name":bank,"bank_number":accountnum,"name":name});
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Vehicle(newUser: widget.newUser)),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 20.0),
                  ]),
                ))));
  }

  List<String> _bank = [
    "الراجحي",
    " الأهلي",
    "  الإنماء",
    " البلاد",
    "  الجزيرة",
    " الرياض",
    "  ساب",
    " سامبا",
    " العربي",
    " الأول",
    " السعودي الفرنسي",
  ];

  Widget renderBankInput(List<String> bankname) {
    List<DropdownMenuItem<String>> items = [];

    items = bankname.map<DropdownMenuItem<String>>((String element) {
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
            prefixIcon: Icon(
              Icons.account_balance,
              color: _iconColor,
            ),
          ),
        ),
      );
    }).toList();

    return DropdownButtonFormField<String>(
      decoration: InputDecoration.collapsed(hintText: ""),
      icon: Icon(Icons.keyboard_arrow_down),
      items: items,
      value: _value,
      validator: (val){
        if(val==null){
          return  S.of(context).translate("selectbank");
        }else{
          return null;
        }
      },
      onChanged: (val) {
        setState(() {
          _value = val;
          bank = _value;
        });
      },
      isExpanded: true,
      itemHeight: 50,
      hint: Text( S.of(context).translate("bank")),
    );
  }
}
