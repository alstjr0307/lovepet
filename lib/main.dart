import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home.dart';
import 'LoginPage.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import 'SetProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

late String initScreen;
Future<void> main() async {
  KakaoSdk.init(nativeAppKey: '8b23a6ba425962d67f6ceda74101017d');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = 'none';
  initScreen = prefs.getString('token') ?? 'none';
  print(initScreen);
  print(initScreen);
  runApp(MyApp());
}

class Routes {
  Routes._();

  static const String homepage = '/';
  static const String introPage = '/LoginPage';

  static final routes = <String, WidgetBuilder>{
    homepage: (BuildContext context) => Home(),
    introPage: (BuildContext context) => LoginPage(),
  };
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: initScreen =='none'
            ? "/intro"
            : "/",
        routes: {
          '/': (BuildContext context) => Home(),
          '/intro': (BuildContext context) => LoginPage(),
          '/setProfile':(BuildContext context) => SetProfile(),
        },
        title: '러브',

        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
    );
  }
}
