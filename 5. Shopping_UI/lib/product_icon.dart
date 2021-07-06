import 'package:flutter/material.dart';
import 'constants.dart';

class ProductIcon extends StatelessWidget {

  final int productNum;
  final int selectedIconNum;
  final IconData mIcon;
  final Function changeIcon;

  const ProductIcon(
      this.productNum, this.selectedIconNum, this.mIcon, this.changeIcon,
      {Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: productNum == selectedIconNum ? kAccentColor : kButtonColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        icon: Icon(mIcon, color: Colors.black),
        onPressed: () {
          changeIcon(productNum);
        },
      ),
    );
  }
}