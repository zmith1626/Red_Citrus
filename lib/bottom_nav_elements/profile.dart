import 'package:flutter/material.dart';
import '../ui_elements/diagonal_clipper.dart';
import '../ui_elements/animated_fab.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  double _imageHeight = 256.0;
  bool showOnlyCompleted = false;

  Widget _buildBackgroundImage() {
    return ClipPath(
      clipper: DiagonalClipper(),
      child: Image.asset(
        'assets/walle.jpg',
        fit: BoxFit.fitHeight,
        height: _imageHeight,
        colorBlendMode: BlendMode.srcOver,
      ),
    );
  }

  Widget _buildTopHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
      child: Row(
        children: <Widget>[
          Icon(Icons.menu, size: 32.0, color: Colors.white),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Timeline',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Ubuntu'),
              ),
            ),
          ),
          Icon(Icons.linear_scale, color: Colors.white)
        ],
      ),
    );
  }

  Widget _buildProfileRow() {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, top: _imageHeight / 2.5),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            maxRadius: 28.0,
            minRadius: 28.0,
            backgroundImage: AssetImage('assets/injustice.jpg'),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Sumanish Neeli',
                  style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Ubuntu'),
                ),
                Text(
                  'Software Engineer',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Ubuntu'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBottomList() {
    return Padding(
      padding: EdgeInsets.only(top: _imageHeight),
      child: Column(
        children: <Widget>[
          _buildMyInfoHeader(),
          _buildMyInfoList(),
        ],
      ),
    );
  }

  Widget _buildMyInfoHeader() {
    return Padding(
      padding: EdgeInsets.only(left: 64.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Profile Info',
            style: TextStyle(fontSize: 34.0, fontFamily: 'Ubuntu'),
          ),
          Text(
            'Be the Change',
            style: TextStyle(
                color: Colors.grey, fontSize: 12.0, fontFamily: 'Ubuntu'),
          ),
        ],
      ),
    );
  }

  Widget _buildList(IconData icon, String item) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(border: Border(left: BorderSide(width: 1.5))),
      child: Wrap(
        children: <Widget>[
          Icon(icon),
          SizedBox(width: 20.0),
          Text(
            item,
            style: TextStyle(fontFamily: 'Ubuntu'),
          )
        ],
      ),
    );
  }

  Widget _buildMyInfoList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 12.0),
        _buildList(Icons.person, 'Sumanish Neeli'),
        _buildList(Icons.phone, '+91-869-992-9124'),
        _buildList(Icons.mail, 'sumanish.neeli@gmail.com')
      ],
    );
  }

  Widget _buildFAB() {
    return Positioned(
        top: (_imageHeight - 100.0),
        right: -40.0,
        child: AnimatedFAB(onClick: _changeState));
  }

  void _changeState() {
    showOnlyCompleted = !showOnlyCompleted;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          _buildBackgroundImage(),
          _buildTopHeader(),
          _buildProfileRow(),
          _buildBottomList(),
          _buildFAB()
        ],
      ),
    );
  }
}
