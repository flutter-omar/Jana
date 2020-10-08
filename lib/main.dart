
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'generated/i18n.dart';
import 'model/applanguage.dart';
import 'model/user.dart';
import 'widget/splash_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'jana',
      home: App(
        appLanguage: appLanguage,
      )));
}

class App extends StatelessWidget {
  final AppLanguage appLanguage;
//  final _user = UserModel();
  App({this.appLanguage});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return ChangeNotifierProvider<AppLanguage>(
      create: (_) => appLanguage,
      child: Consumer<AppLanguage>(builder: (context, model, child) {
        return MultiProvider(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: model.appLocal,
            supportedLocales: [
              Locale('ar', ''),
              Locale('en', 'US'),
            ],
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            theme: ThemeData(primaryColor: Color(0xff78c891),fontFamily: "Cairo"),
            home: SplashWidget(),

          ),
          providers:[ ChangeNotifierProvider(create: (_) => UserModel()),]
        );
      }),
    );
  }
}