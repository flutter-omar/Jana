import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'generated/i18n.dart';
import 'model/applanguage.dart';
import 'user/profile.dart';
import 'widget/usercard.dart';

class PersonalPage extends StatefulWidget {
  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  bool ready = false;
  var appLanguage;
  @override
  void initState() {
    super.initState();
    appLanguage = Provider.of<AppLanguage>(context,listen: false);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xE6E6E6E6),
      appBar: AppBar(
        title: Center(
            child: Text(
          "صفحتي الشخصية",
          style: TextStyle(color: Colors.black),
        )),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: UserCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Text("الحالة"),
                          SizedBox(
                            height: 5,
                          ),
                          Card(
                            margin: EdgeInsets.only(bottom: 2.0),
                            elevation: 0,
                            child: SwitchListTile(
                              dense: true,
                              value: ready,
                              onChanged: (val) {
                                setState(() {
                                  ready = !ready;
                                });
                              },
                              activeColor: Colors.green.shade200,
                              title: Text("مستعد لإستقبال الطلبات",),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("الطلبات"),
                          SizedBox(
                            height: 5,
                          ),
                          Card(
                              margin: EdgeInsets.only(bottom: 2.0),
                              elevation: 0,
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    onTap: () => {},
                                    title: Text("مجموع مبالغ التوصيل",
                                        style: TextStyle(fontSize: 16)),
                                    trailing: Text(
                                      "600 ريال",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    ),
                                  ),
                                  Divider(),
                                  ListTile(
                                      onTap: () => {},
                                      title: Text("أرباحي",
                                          style: TextStyle(fontSize: 16)),
                                      trailing: Text(
                                        "5",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.black),
                                      )),
                                  Divider(),
                                  ListTile(
                                    onTap: () => {},
                                    title: Text("الطلبات التي تم توصيلها",
                                        style: TextStyle(fontSize: 16)),
                                    trailing: Text(
                                      "30 ريال",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    ),
                                  ),
                                  Divider(),
                                  ListTile(
                                      onTap: () => {},
                                      title: Text("الطلبات التي تم الغائها",
                                          style: TextStyle(fontSize: 16)),
                                      trailing: Text(
                                        "2",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.black),
                                      ))
                                ],
                              )),
                          SizedBox(
                            height: 5,
                          ),
                          Text("تفاصيل الحساب"),
                          SizedBox(
                            height: 5,
                          ),
                          Card(
                              margin: EdgeInsets.only(bottom: 2.0),
                              elevation: 0,
                              child: Column(children: <Widget>[
                                ListTile(
                                  onTap: () => {
//                                    Provider.of<UserModel>(context, listen: false).getUser(),
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UserProfile(newUser: true,)),
                                    )
                                  },
                                  title: Text("المعلومات الشخصية",
                                      style: TextStyle(fontSize: 16)),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ])),
                          SizedBox(
                            height: 5,
                          ),
                          Text("اللغة"),
                          SizedBox(
                            height: 5,
                          ),
                          Card(
                              margin: EdgeInsets.only(bottom: 2.0),
                              elevation: 0,
                              child: Column(children: <Widget>[
                                ListTile(
                                  onTap: () => {
                                  showLanguagePopup(context, appLanguage),
                                  },
                                  title: Text("تغيير اللغة",
                                      style: TextStyle(fontSize: 16)),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ])),
                          SizedBox(
                            height: 5,
                          ),
                          Text("الدعم الفني"),
                          SizedBox(
                            height: 5,
                          ),
                          Card(
                              margin: EdgeInsets.only(bottom: 2.0),
                              elevation: 0,
                              child: Column(children: <Widget>[
                                ListTile(
                                  onTap: () => {},
                                  title: Text("تواصل معنا عبر الواتساب",
                                      style: TextStyle(fontSize: 16)),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ])),
                          SizedBox(
                            height: 5,
                          ),
                          Text("تسجيل الخروج"),
                          SizedBox(
                            height: 5,
                          ),
                          Card(
                              shape: Border.all(color: Colors.red),
                              margin: EdgeInsets.only(bottom: 2.0),
                              color: Colors.grey.shade100,
                              elevation: 0,
                              child: Column(children: <Widget>[
                                ListTile(
                                  onTap: () => {
//                                    Provider.of<UserModel>(context, listen: false).logout(),

                                  },
                                  title: Text("تسجيل الحروج",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.red)),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                    color: Colors.red,
                                  ),
                                ),
                              ])),
//
                        ]),
                  ),
                ],
              ))),
    );
  }
  Future<void> showLanguagePopup(
      BuildContext context, AppLanguage appLanguage) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RadioListTile<Locale>(
                value: Locale("en"),
                onChanged: (newval) {
                  setState(() {
                    appLanguage.changeLanguage(newval);
                  });
                  Navigator.of(context).pop();
                },
                title: Text(S.of(context).translate("english")),
                activeColor: Colors.red,
                groupValue: appLanguage.appLocal,
              ),
              RadioListTile<Locale>(
                value: Locale("ar"),
                onChanged: (newval) {
                  setState(() {
                    appLanguage.changeLanguage(newval);
                  });
                  Navigator.of(context).pop();
                },
                title: Text(S.of(context).translate("arabic")),
                activeColor: Colors.red,
                groupValue: appLanguage.appLocal,
              ),
            ],
          ),
        );
      },
    );
  }
}
