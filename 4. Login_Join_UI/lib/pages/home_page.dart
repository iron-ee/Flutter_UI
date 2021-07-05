import 'package:flutter/material.dart';
import 'package:flutter_login/components/logo.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(  // Align 은 부모의 크기에 맞춰지고, default 값으로 가운데 정렬
        child: Column(
          children: [
            SizedBox(height: 220,),
            Logo('Hello World'),
            SizedBox(height: 60,),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('환영합니다!')));
              },
              child: Text('Into the World !'),
            ),
          ],
        ),
      ),
    );
  }
}