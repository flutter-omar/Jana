//import 'package:flutter/material.dart';
//import 'package:janaapp/order/completeorder.dart';
//import 'package:janaapp/widget/login_animation.dart';
//import 'package:janaapp/widget/orderdetail.dart';
//
//class DeliveredOrder extends StatefulWidget {
//  @override
//  _DeliveredOrderState createState() => _DeliveredOrderState();
//}
//
//class _DeliveredOrderState extends State<DeliveredOrder> with TickerProviderStateMixin{
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
//      floatingActionButton:
////      GestureDetector(
////        onTap: ()=>Navigator.push(
////          context,
////          MaterialPageRoute(builder: (context) => CompleteOrder()),
////        ),
////        child: Container(
////            height: 50,
////            alignment: FractionalOffset.center,
////            decoration: BoxDecoration(
////                color: Colors.red,
////                borderRadius: BorderRadius.all(const Radius.circular(25.0)),
////            ),
////            child: Text(
////              "تم توصيل الطلب",
////              style: TextStyle(
////                color: Colors.black,
////                fontSize: 16.0,
////                fontWeight: FontWeight.w300,
////                letterSpacing: 0.3,
////              ),
////            )
////
////        ),
////      ),
//      StaggerAnimation(
//        titleButton: "تم توصيل الطلب",
//        buttonController: _loginButtonController.view,
//        color: Colors.red,
//        onTap: () {
//          Navigator.push(
//            context,
//            MaterialPageRoute(builder: (context) => CompleteOrder()),
//          );
//        },
//      ),
//    );
//  }
//}
