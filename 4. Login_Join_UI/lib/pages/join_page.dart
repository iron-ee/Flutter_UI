import 'package:flutter/material.dart';
import 'package:flutter_login/components/custom_text_form.dart';
import 'package:flutter_login/components/logo.dart';

class JoinPage extends StatefulWidget {

  @override
  _JoinPageState createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _pwTextController;
  TextEditingController _pwCheckTextController;

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _pwTextController = TextEditingController();
    _pwCheckTextController = TextEditingController();
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
            Logo('Join'),
            Form(
              key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    TextFormField(
                      onTap: () {
                        scrollAnimate();
                      },
                      validator: (value) => value.length <= 3 ? '길이가 짧습니다 !' : null,
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: '4자 이상 입력해주세요',
                        labelText: '아이디',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      onTap: () {
                        scrollAnimate();
                      },
                      validator: (value) => value.length <= 5 ? '길이가 짧습니다 !' : null,
                      controller: _pwTextController,
                      obscureText: true,
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: '6자 이상 입력해주세요',
                        labelText: '비밀번호',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      onTap: () {
                        scrollAnimate();
                      },
                      validator: (value) => value.toString() == _pwTextController.value.text ? null : '비밀번호가 틀립니다',
                      controller: _pwCheckTextController,
                      obscureText: true,
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: '비밀번호 확인',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
            ),
            SizedBox(height: 30),
            TextButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Navigator.pushNamed(context, '/login');
                  }
                },
                child: Text(
                  '회원가입',
                  style: TextStyle(
                    fontWeight: FontWeight.w600
                  ),
                ))
          ],
        ),
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