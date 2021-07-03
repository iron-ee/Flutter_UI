import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset('assets/background.jpeg',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
              child: Container(
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/album.png',
                        width: 250,
                        height: 300,
                        fit: BoxFit.cover,),
                    ),
                  ),
                  Slider(
                    activeColor: Colors.deepOrange,
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildSubMenu(Icons.add_circle_outline, '보관하기'),
                      buildSubMenu(Icons.play_circle_outline, '재생하기'),
                      buildSubMenu(Icons.save_alt_outlined, '저장하기'),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                            '곡 설명',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "'Next Level'은 영화 '분노의 질주:홉스&쇼 (Fast & Furious:Hobbs & Shaw)'의 "
                              "OST 'Next Level'을 aespa만의 색깔로 리메이크, 그루비한 랩과 에너지 넘치는 "
                              "베이스리프가 돋보이는 힙합 댄스곡으로 재탄생",
                          maxLines: 3,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Wrap(
                    children: [
                      buildCard('한국어'),
                      buildCard('중국어'),
                      buildCard('일본어'),
                      buildCard('영어'),
                      buildCard('독일어'),
                      buildCard('프랑스어'),
                      buildCard('스페인어'),
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

  Widget buildCard(String language) {
    return Card(
                color: Colors.black45,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.near_me),
                      Text(language),
                    ],
                  ),
                ),
              );
  }

  Widget buildSubMenu(IconData mIcon, String mTitle) {
    return Column(
                    children: [
                      Icon(
                        mIcon,
                        size: 60,
                      ),
                      Text(mTitle),
                    ],
                  );
  }
}