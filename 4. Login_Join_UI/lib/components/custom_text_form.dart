import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {

  final String subTitle;
  final Function scrollAnimate;

  const CustomTextForm(this.subTitle, this.scrollAnimate, {Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(subTitle),
        SizedBox(height: 5),
        TextFormField(
          onTap: () {
            scrollAnimate();
          },
          validator: (value) => value.isEmpty ? 'Please enter some text' : null,
          decoration: InputDecoration(
            hintText: 'Enter $subTitle',
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),  // 텍스트필드에 입력할 때 적용
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),  // 텍스트필드의 평상시 상태일 때 적용
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),  // 텍스트필드에 에러가 생겼을 때 적용
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),  // 에러가 난 텍스트필드에 입력할 때 적용
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}