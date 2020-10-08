//import 'package:flutter/material.dart';
//import 'package:janaapp/tabbar.dart';
//import 'package:janaapp/widget/login_animation.dart';
//import 'package:janaapp/widget/orderdetail.dart';
//
//class CompleteOrder extends StatefulWidget {
//  @override
//  _CompleteOrderState createState() => _CompleteOrderState();
//}
//
//class _CompleteOrderState extends State<CompleteOrder>with TickerProviderStateMixin {
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
//
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
//      body: OrderDetail(paymentCode: true,),
//      floatingActionButton:     StaggerAnimation(
//        titleButton: "تم توصيل الطلب",
//        buttonController: _loginButtonController.view,
//        color: Colors.green,
//        onTap: () {
//          Navigator.push(
//            context,
//            MaterialPageRoute(builder: (context) => TabBarScreen()),
//          );
//        },
//      ),
//    );
//  }
//}
