import 'package:flutter/material.dart';
import 'package:flutter_login/pages/intro.dart';
import 'package:flutter_login/pages/join_page.dart';
import 'package:flutter_login/pages/login_main_page.dart';
import 'package:flutter_login/pages/home_page.dart';
import 'package:flutter_login/pages/login_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(   // 이 앱의 모든 TextButton style 을 똑같이 하고 싶을 때
          style:  TextButton.styleFrom(
            backgroundColor: Colors.lightGreen,
            primary: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            minimumSize: Size(300, 40),
          ),
        ),
      ),
      // Skia 엔진 => UI 랜더링 엔진
      initialRoute: "/loginMain",
      routes: {
        '/loginMain': (context) => LoginMainPage(),
        '/home' : (context) => HomePage(),
        '/join' : (context) => JoinPage(),
        '/intro' : (context) => IntroPage(),
        '/login' : (context) => LoginPage(),
      },
    );
  }
}



