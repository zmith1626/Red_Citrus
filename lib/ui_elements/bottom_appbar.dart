import 'package:flutter/material.dart';

import '../colors.dart';

class CustomBottomAppbar extends StatefulWidget {
  const CustomBottomAppbar({this.onTabSelected});
  final ValueChanged<int> onTabSelected;

  @override
  _CustomBottomAppbarState createState() => _CustomBottomAppbarState();
}

class _CustomBottomAppbarState extends State<CustomBottomAppbar> {
  int _bottomNavSelection = 0;
  _setNavBarSelection(int index) {
    widget.onTabSelected(index);
    setState(() {
      _bottomNavSelection = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 4.0,
      color: kBlueBlue150,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home,
                size: 26.0,
                color:
                    (_bottomNavSelection == 0) ? kBlueteal150 : Colors.white70),
            onPressed: () {
              _setNavBarSelection(0);
            },
          ),
          IconButton(
            icon: Icon(Icons.explore,
                size: 26.0,
                color:
                    (_bottomNavSelection == 1) ? kBlueteal150 : Colors.white70),
            onPressed: () {
              _setNavBarSelection(1);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              size: 26.0,
              color: (_bottomNavSelection == 2) ? kBlueteal150 : Colors.white70,
            ),
            onPressed: () {
              _setNavBarSelection(2);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.local_mall,
              size: 26.0,
              color: (_bottomNavSelection == 3) ? kBlueteal150 : Colors.white70,
            ),
            onPressed: () {
              _setNavBarSelection(3);
            },
          ),
          const SizedBox(width: 60.0)
        ],
      ),
    );
  }
}
