import 'package:flutter/material.dart';
import 'package:janaapp/generated/i18n.dart';


class UserCard extends StatefulWidget {
  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
//  User _user;
  @override
  void initState() {
    super.initState();
//     _user=Provider.of<UserModel>(context).user;

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
          color: Color(0xff78C891),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0))),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("اسم العضو"),
                  Text("${S.of(context).translate("MembershipNo")} :#"),
                ],
              ),
            ),
            SizedBox(width: 10,),
            Center(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      color: Color(0xffE4E4E4)),
                  child: Icon(
                    Icons.person,
                    size: 80,
                    color: Color(0xffBCBCBC),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
