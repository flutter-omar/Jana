
import 'package:flutter/material.dart';
import 'package:janaapp/widget/login_animation.dart';
import 'package:janaapp/widget/orderdetail.dart';

import '../tabbar.dart';


class OrderView extends StatefulWidget {
  final String state;
  final bool payment;
  OrderView({this.state="view",this.payment=false});
  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView>with TickerProviderStateMixin {
  AnimationController _loginButtonController;

  Widget getState(){
    switch(widget.state){
      case("receipt"): return  StaggerAnimation(
        titleButton: "تم استلام الطلب من المتجر",
        buttonController: _loginButtonController.view,
        color: Colors.green.shade200,
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) =>  OrderView(state: "delivered",)),
          );
        },
      );
      case("delivered"):return StaggerAnimation(
        titleButton: "تم توصيل الطلب",
        buttonController: _loginButtonController.view,
        color: Colors.red,
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => OrderView(state: "completed",payment: true,)),
          );
        },
      );
      case("completed"):return StaggerAnimation(
        titleButton: "تم توصيل الطلب",
        buttonController: _loginButtonController.view,
        color: Colors.green,
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => TabBarScreen()),
          );

        },
      );
      default: return StaggerAnimation(
        titleButton: "استلام الطلب",
        buttonController: _loginButtonController.view,
        color: Colors.green.shade200,
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => OrderView(state: "receipt",)),
          );
        },
      );
    }
  }
  @override
  void initState() {
    super.initState();
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
          "تفاصيل الطلب",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading:  IconButton(
          icon:Icon( Icons.arrow_forward_ios,
            color: Colors.black,),
          onPressed: ()=>Navigator.of(context).pop(),
        ),
      ),
      body: OrderDetail(paymentCode: widget.payment,),
      floatingActionButton:   getState()
    );
  }
}
