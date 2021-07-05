import 'package:flutter/material.dart';
import 'package:flutter_login/components/custom_text_form.dart';
import 'package:flutter_login/components/logo.dart';
import 'dart:math';
import 'dart:async';

import 'package:flutter_svg/flutter_svg.dart';

class LoginMainPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginMainPage> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  ScrollController _scrollController;

  double opacity = 0;
  AnimationController _animationController;
  Animation _animation;
  Animation _transAnimation;
  Animation _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation = Tween<double>(begin: 0, end: pi * 4).animate(_animationController);
    _transAnimation = Tween<Offset>(begin: Offset(0, 200), end: Offset(0, 0)).animate(_animationController);
    _scaleAnimation = Tween<double>(begin: 2, end: 1).animate(_animationController);
    _animationController.forward();
    Timer(Duration(seconds: 3), () {  // 페이지 생성 후, 2초 뒤 타이머 시작  dart:async 선언 해줘야 됨!
      setState(() {
        opacity = 1;
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          controller: _scrollController,
          children: [
            SizedBox(height: 80),
            AnimatedBuilder(
                animation: _animationController,
                builder: (context, widget) {
                  return Transform.translate( // 방향 조절
                    offset: _transAnimation.value,
                    child: Transform.rotate(  // 앵글 조절
                      angle: _animation.value,
                      child: Transform.scale( // 크기 조절
                        scale: _scaleAnimation.value,
                        child: widget,
                      ),
                    ),
                  );
                }, child: Hero(
                    tag: 'logo',
                    child: SvgPicture.asset('assets/logo1.svg', width: 70, height: 70,),
            ),
            ),
            AnimatedOpacity(opacity: opacity, duration: Duration(seconds: 1),
              child: Column(
                children: [
                  Align(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  buildLoginForm(),
                  SizedBox(height: 30),
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {   // true, false
                        Navigator.pushNamed(context, '/home');
                      }
                    },
                    child: Text('Login'),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('New Here? '),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/join');
                        },
                        child: Text(
                          'Join',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLoginForm() {
    return Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextForm('ID', scrollAnimate),
                CustomTextForm('Password', scrollAnimate),
              ],
            ),
          );
  }


  void scrollAnimate(){
    print('탭 클릭됨');

    Future.delayed(Duration(milliseconds: 500), (){
      print(MediaQuery.of(context).viewInsets.bottom);
      _scrollController.animateTo(
          MediaQuery.of(context).viewInsets.bottom,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn
      );
    });
  }

}