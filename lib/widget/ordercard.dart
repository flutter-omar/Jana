import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:janaapp/order/orderview.dart';

import 'package:janaapp/tabbar.dart';



class OrderCard extends StatefulWidget {
  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> with TickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius:BorderRadius.all(const Radius.circular(10.0)),color: Colors.white, ),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                      Text("أسم المتجر: "),
                      Text("مبلغ التوصيل:"),
                      Text(" قيمة الطلب:"),
                      Text("رقم الطلب: "),
                    ],
                  ),
                ),
//                SizedBox(width: 20,),
                Container(
                  width: 80,
                  height: 80,
                  child: Center(
                    child: Icon(
                      Icons.language,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                GestureDetector(
                  onTap: ()=>Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrderView(state: "receipt",)),
            ),
                  child: Center(
                    child: Container(
                      width: 100,
                        height: 40,
                        alignment: FractionalOffset.center,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(const Radius.circular(25.0)),
                        ),
                        child: Text(
                          "قبول الطلب",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 0.3,
                          ),
                        )

                    ),
                  ),
                ),
                SizedBox(height: 5.0),
                GestureDetector(
                  onTap: ()=>Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TabBarScreen()),
                  ),
                  child: Center(
                    child: Container(
                      width: 100,
                        height: 40,
                        alignment: FractionalOffset.center,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(const Radius.circular(25.0)),

                        ),
                        child: Text(
                          "رفض الطلب",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 0.3,
                          ),
                        )

                    ),
                  ),
                ),
              ],),
            ),
            SizedBox(height: 10.0),
            GestureDetector(
              onTap: ()=>Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderView()),
              ),
              child: Center(
                child: Container(
                    height: 40,
                    alignment: FractionalOffset.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(const Radius.circular(25.0)),
                        border: Border.all(color: Colors.green.shade200)
                    ),
                    child: Text(
                      "تفاصيل الطلب",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.3,
                      ),
                    )

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
