//
//import 'package:flutter/material.dart';
//import 'package:janaapp/order/deliveredorder.dart';
//import 'package:janaapp/user/account.dart';
//import 'package:janaapp/widget/login_animation.dart';
//import 'package:janaapp/widget/orderdetail.dart';
//
//class ReceiptOrder extends StatefulWidget {
//  @override
//  _ReceiptOrderState createState() => _ReceiptOrderState();
//}
//
//class _ReceiptOrderState extends State<ReceiptOrder>with TickerProviderStateMixin {
//  AnimationController _loginButtonController;
//
//  @override
//  void initState() {
//    super.initState();
//    _loginButtonController = AnimationController(
//      duration: Duration(milliseconds: 3000),
//      vsync: this,
//    );
//  }
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(
//          "تفاصيل الطلب",
//          style: TextStyle(color: Colors.black),
//        ),
//        backgroundColor: Colors.white,
//        leading: Icon(
//          Icons.arrow_back_ios,
//          color: Colors.black,
//        ),
//      ),
//      body: OrderDetail(),
//      floatingActionButton:     StaggerAnimation(
//        titleButton: "تم استلام الطلب من المتجر",
//        buttonController: _loginButtonController.view,
//        color: Colors.green.shade200,
//        onTap: () {
//          Navigator.push(
//            context,
//            MaterialPageRoute(builder: (context) =>  DeliveredOrder()),
//          );
//        },
//      ),
//    );
//  }
//}
