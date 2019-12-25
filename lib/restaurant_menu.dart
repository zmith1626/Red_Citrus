import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class RestaurantMenu extends StatefulWidget {
  @override
  _RestaurantMenuState createState() => _RestaurantMenuState();
}

class _RestaurantMenuState extends State<RestaurantMenu> {
  var _isSelected = true;
  var _isAdded = false;

  Widget _buildOutlineButton() {
    return Container(
      child: _isAdded ? _buildFinalButton(1) : _buildAddButton(),
    );
  }

  Widget _buildAddButton() {
    return Container(
      width: 55.0,
      height: 25.0,
      padding: EdgeInsets.only(left: 2.0),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(5.0)),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Text(
            'Add',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            child: Icon(
              Icons.add,
              color: Colors.green,
            ),
            onTap: () {
              setState(() {
                _isAdded = true;
              });
            },
          )
        ],
      ),
    );
  }

  Widget _buildFinalButton(int value) {
    return Container(
      width: 68.0,
      height: 25.0,
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(5.0)),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          GestureDetector(
            child: Icon(
              Icons.remove,
              color: Colors.red,
            ),
            onTap: () {
              setState(() {
                _isAdded = false;
              });
            },
          ),
          Text(
            value.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            child: Icon(
              Icons.add,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSubtitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Something', style: TextStyle(fontFamily: 'monospace')),
        Text('₹199'),
      ],
    );
  }

  Widget _buildItemList() {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Image.asset(
            'assets/Non-veg.png',
            width: 24.0,
            height: 24.0,
          ),
          title: Text(
            'Any Text',
            style: TextStyle(
                fontFamily: 'monospace',
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.black87),
          ),
          subtitle: _buildSubtitle(),
          trailing: _buildOutlineButton(),
        ),
        Divider(
          indent: 20.0,
          color: Colors.black87,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            height: 30.0,
            width: 200.0,
            child: Row(
              children: <Widget>[
                SizedBox(width: 16.0),
                Text(
                  'Veg-Only',
                  style: TextStyle(
                      fontFamily: 'monospace', fontWeight: FontWeight.bold),
                ),
                Switch(
                  activeThumbImage: AssetImage('assets/Veg.png'),
                  activeTrackColor: Colors.green,
                  activeColor: Colors.white,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onChanged: (bool value) {},
                  value: _isSelected,
                )
              ],
            ),
          ),
        ),
        SliverStickyHeader(
          header: Container(
            padding: EdgeInsets.only(left: 16.0),
            alignment: Alignment.centerLeft,
            height: 40.0,
            child: Text('Header One',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.bold)),
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _buildItemList();
              },
              childCount: 10,
            ),
          ),
        ),
      ],
    );
  }
}
