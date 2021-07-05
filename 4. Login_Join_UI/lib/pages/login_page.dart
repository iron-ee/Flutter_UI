import 'package:flutter/material.dart';
import 'package:flutter_login/components/custom_text_form.dart';
import 'package:flutter_login/components/logo.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
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
            Logo('Login'),
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