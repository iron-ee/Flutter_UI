import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_svg/flutter_svg.dart';

class Loading extends StatefulWidget{

  _LoadingState _loadingState = _LoadingState();

  @override
  _LoadingState createState() => _LoadingState();


}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {

  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation = Tween<double>(begin: 0, end: pi * 2).animate(_animationController);
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.rotate(
            angle: _animation.value,
            child: SvgPicture.asset('assets/logo1.svg', width: 100, height: 100,),
          );
        },
      ),
    );
  }

}