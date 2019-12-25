import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedFAB extends StatefulWidget {
  final VoidCallback onClick;

  const AnimatedFAB({Key key, this.onClick}) : super(key: key);
  @override
  _AnimatedFABState createState() => _AnimatedFABState();
}

class _AnimatedFABState extends State<AnimatedFAB>
    with SingleTickerProviderStateMixin {
  final double expandedSize = 180.0;
  final double hiddenSize = 20.0;
  AnimationController _fabController;
  Animation<Color> _fabAnimation;

  @override
  void initState() {
    super.initState();
    _fabController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _fabAnimation = ColorTween(begin: Colors.pink, end: Colors.pink[800])
        .animate(_fabController);
  }

  @override
  void dispose() {
    _fabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: expandedSize,
      height: expandedSize,
      child: AnimatedBuilder(
        animation: _fabController,
        builder: (BuildContext context, Widget child) {
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              _buildExpandedFAB(),
              _buildOption(Icons.add_a_photo, 0.0),
              _buildOption(Icons.phone, -math.pi / 3),
              _buildOption(Icons.mail, -2 * math.pi / 3),
              _buildOption(Icons.border_color, math.pi),
              _buildFABCore(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildOption(IconData icon, double angle) {
    double iconSize = 0.0;
    if (_fabController.value > 0.8) {
      iconSize = 26.0 * (_fabController.value - 0.8) * 5;
    }
    return Transform.rotate(
      angle: angle,
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: IconButton(
            onPressed: _onIconClick,
            icon: Transform.rotate(
              angle: -angle,
              child: Icon(icon, color: Colors.white),
            ),
            iconSize: iconSize,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }

  void _onIconClick() {
    widget.onClick();
    close();
  }

  Widget _buildExpandedFAB() {
    double size =
        hiddenSize + (expandedSize - hiddenSize) * _fabController.value;
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.pink),
    );
  }

  Widget _buildFABCore() {
    double _scaleFactor = 2 * (_fabController.value - 0.5).abs();
    return FloatingActionButton(
      onPressed: _onFabTap,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..scale(1.0, _scaleFactor),
        child: Icon(_fabController.value > 0.5 ? Icons.close : Icons.edit,
            color: Colors.white),
      ),
      backgroundColor: _fabAnimation.value,
    );
  }

  open() {
    if (_fabController.isDismissed) {
      _fabController.forward();
    }
  }

  close() {
    if (_fabController.isCompleted) {
      _fabController.reverse();
    }
  }

  _onFabTap() {
    if (_fabController.isDismissed) {
      open();
    } else {
      close();
    }
  }
}
