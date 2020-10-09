import 'package:flutter/material.dart';
import 'package:janaapp/generated/i18n.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class OrderDetail extends StatefulWidget {
  final bool paymentCode;

  OrderDetail({this.paymentCode = false});

  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail>
    with TickerProviderStateMixin {
//  AnimationController _loginButtonController;
bool payment=false;
  @override
  void initState() {
    super.initState();
//    _loginButtonController = AnimationController(
//      duration: Duration(milliseconds: 3000),
//      vsync: this,
//    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xE6E6E6E6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Text(S.of(context).translate("market")),
                    Icon(
                      Icons.person_outline,
                      color: Colors.greenAccent,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                  margin: EdgeInsets.only(bottom: 2.0),
                  elevation: 0,
                  child: Column(children: <Widget>[
                    ListTile(
                      onTap: () => {},
                      title: Text(S.of(context).translate("marketnum"), style: TextStyle(fontSize: 16)),
                      trailing: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffBBD242),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.call,
                            size: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ])),
              SizedBox(
                height: 10,
              ),
              Card(
                  margin: EdgeInsets.only(bottom: 2.0),
                  elevation: 0,
                  child: Column(children: <Widget>[
                    ListTile(
                      onTap: () => {},
                      title: Text(S.of(context).translate("marketlocation"), style: TextStyle(fontSize: 16)),
                      trailing: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffBBD242),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.location_on,
                            size: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ])),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[Text(S.of(context).translate("ordernum")), Text("1")],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[Text(S.of(context).translate("orderCost")), Text("1")],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[Text(S.of(context).translate("Delivery")), Text("1")],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[Text(S.of(context).translate("deliverystatus")), Text("1")],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              (!widget.paymentCode)?Column(children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("${S.of(context).translate("customername")} :"),
                      Icon(
                        Icons.person,
                        color: Colors.black,
                        size: 25,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                    margin: EdgeInsets.only(bottom: 2.0),
                    elevation: 0,
                    child: Column(children: <Widget>[
                      ListTile(
                        onTap: () => {},
                        title: Text(S.of(context).translate("customernum"), style: TextStyle(fontSize: 16)),
                        trailing: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffBBD242),
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.call,
                              size: 25,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ])),
                SizedBox(
                  height: 10,
                ),
                Card(
                    margin: EdgeInsets.only(bottom: 2.0),
                    elevation: 0,
                    child: Column(children: <Widget>[
                      ListTile(
                        onTap: () => {},
                        title: Text(S.of(context).translate("customerlocation"), style: TextStyle(fontSize: 16)),
                        trailing: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffBBD242),
                              borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.location_on,
                              size: 25,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ])),
              ],):Column(children: <Widget>[
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Checkbox(value: payment, onChanged: (val){
                      payment=!payment;
                    },
                      activeColor: Colors.green.shade200,
                    ),
                    SizedBox(width: 20,),
                    Text(S.of(context).translate("Payment"))
                  ],
                ),
                SizedBox(height: 10.0),
                Divider(),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.green.shade200,
                    child: Center(
                        child: Text(
                          S.of(context).translate("Verificationcode"),
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        )),
                  ),
                ),
                const SizedBox(height: 20.0),
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
//                      if (value != null && value.length == 6) {
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(builder: (context) => UserProfile()),
//                        );
//                      }
                      },
                      onDone: (value) {
//                      if (value != null && value.length == 6) {
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(builder: (context) => UserProfile()),
//                        );
//                      }
                      },
                    )),

                SizedBox(
                  height: 20.0,
                ),
                Center(child: Text(S.of(context).translate("codemessage"))),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  child: Text(
                    S.of(context).translate("resendcode"),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        textBaseline: TextBaseline.alphabetic),
                  ),
                  onTap: () {
//                                  launchForgetPassworldURL(forgetPasswordUrl);
                  },
                ),

              ],),
              SizedBox(height: 80,)
            ],
          ),
        )),);

  }
}
