import 'package:flutter/material.dart';

class BottomNavTransistion extends AnimatedWidget {
  BottomNavTransistion(
      {Key key, Animation<double> slideAnimation, this.appBarChild})
      : super(key: key, listenable: slideAnimation);

  final Widget appBarChild;

  Widget build(BuildContext context) {
    final Animation<double> _slideAnimation = listenable;
    return Container(
      height: _slideAnimation.value,
      child: appBarChild,
    );
  }
}
