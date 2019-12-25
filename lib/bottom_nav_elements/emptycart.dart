import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  final double _imageWidth = 300.0;
  final double _topSpacing = 100.0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: _topSpacing),
              Image.asset('assets/cart.png', width: _imageWidth),
              SizedBox(height: 20.0),
              Container(
                width: (_imageWidth - 50),
                child: Text(
                  'Food is not rational, Food is culture, habit, craving and identity --Jonathan Safran Foer.',
                  style: TextStyle(fontFamily: 'cursive', fontSize: 18.0),
                ),
              ),
              SizedBox(height: 100.0),
              Text(
                '* No Items In your Cart *',
                style: TextStyle(fontFamily: 'Ubuntu', fontSize: 18.0),
              ),
              SizedBox(height: 50.0)
            ],
          ),
        ),
      ),
    );
  }
}
