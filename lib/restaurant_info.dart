import 'package:flutter/material.dart';

import './ui_elements/styling_element.dart';
import './colors.dart';

class RestaurantInfo extends StatefulWidget {
  @override
  _RestaurantInfoState createState() => _RestaurantInfoState();
}

class _RestaurantInfoState extends State<RestaurantInfo> {
  bool _isFavourite = false;
  Widget _buildButtonCallColumn(IconData icon, String value) {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(icon),
          onPressed: () {},
        ),
        Text(value,
            style: TextStyle(fontFamily: 'Ubuntu', fontWeight: FontWeight.bold))
      ],
    );
  }

  Widget _buildButtonRouteColumn(IconData icon, String value) {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(icon),
          onPressed: () {},
        ),
        Text(value,
            style: TextStyle(fontFamily: 'Ubuntu', fontWeight: FontWeight.bold))
      ],
    );
  }

  Widget _buildButtonLikeColumn(String value) {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(_isFavourite ? Icons.favorite : Icons.favorite_border),
          onPressed: () {
            setState(() {
              _isFavourite = !_isFavourite;
            });
          },
        ),
        Text(value,
            style: TextStyle(fontFamily: 'Ubuntu', fontWeight: FontWeight.bold))
      ],
    );
  }

  Widget _buildHeaderRow() {
    return Container(
      child: ListTile(
          title: Text('Injustice', style: monospaceBlackBoldTextStyle()),
          subtitle: Text('12B, Nottingham Palace, England'),
          trailing: Container(
            child: Wrap(
              children: <Widget>[
                Icon(Icons.favorite, color: kBlueErrorRed),
                SizedBox(width: 4.0),
                Text('85',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.bold))
              ],
            ),
          )),
    );
  }

  Widget _buildImageHeader() {
    double _imageHeight = 180.0;
    return Container(
      height: _imageHeight,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/injustice.jpg'), fit: BoxFit.fill)),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 8.0,
            left: 12.0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 4.0,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 14.0,
                  ),
                  Text(
                    '4.2',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListView(children: <Widget>[
          _buildImageHeader(),
          _buildHeaderRow(),
          Container(
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(width: 1.0),
              )),
              padding: EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildButtonCallColumn(Icons.call, 'Call'),
                  _buildButtonLikeColumn('Like'),
                  _buildButtonRouteColumn(Icons.near_me, 'Route')
                ],
              )),
          SizedBox(height: 20.0),
          Text('Description:', style: monospaceBlackBoldTextStyle()),
          Text('Some additional description here')
        ]));
  }
}
