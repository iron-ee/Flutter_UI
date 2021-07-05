import 'package:flutter/material.dart';
import 'package:flutter_login/components/loading.dart';
import 'dart:async';
import 'package:flutter_login/pages/login_main_page.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPage createState() => _IntroPage();
}

class _IntroPage extends State<IntroPage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return Timer(Duration(seconds: 4), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Loading()
            ],
          ),
        ),
      ),
    );
  }
}