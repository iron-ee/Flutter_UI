import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {

  final String title;

  const Logo(this.title, { Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: 'logo',
          child: SvgPicture.asset(
            'assets/logo1.svg',
            width: 70,
            height: 70,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        // FlatButton => TextButton
        // RaisedButton => ElevatedButton
      ],
    );
  }
}