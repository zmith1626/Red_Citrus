import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import './colors.dart';
import './restaurant_info.dart';

class Description extends StatefulWidget {
  @override
  _Description createState() => _Description();
}

enum AppBarItem { favorites, settings, order }

class _Description extends State<Description>
    with SingleTickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  AnimationController _fabController;
  VoidCallback _showBottomSheetCallback;
  var _isSelected = true;
  var _isAdded = false;
  var _isFabVisible = true;

  @override
  void initState() {
    super.initState();
    _showBottomSheetCallback = _showBottomSheet;
    _fabController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    _fabController.forward();
  }

  @override
  void dispose() {
    _fabController.dispose();
    super.dispose();
  }

  void _showBottomSheet() {
    setState(() {
      _showBottomSheetCallback = null;
      _isFabVisible = false;
      _fabController.reverse();
    });
    _scaffoldKey.currentState
        .showBottomSheet((context) {
          return Container(
            color: Color(0xFF707070),
            height: (MediaQuery.of(context).size.height - 150),
            child: Container(
              child: RestaurantInfo(),
              decoration: BoxDecoration(
                  color: kBlueSurfaceWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0),
                  )),
            ),
          );
        })
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              _showBottomSheetCallback = _showBottomSheet;
              _isFabVisible = true;
              //if (_fabController.isDismissed || _fabController.isCompleted) {
              _fabController.forward();
              //}
            });
          }
        });
  }

  Widget _buildCollapsibleAppBar() {
    double _expandedHeight = 200.0;
    return SliverAppBar(
      expandedHeight: _expandedHeight,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('Injustice',
            style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 24.0,
                fontWeight: FontWeight.bold)),
        background: Image.asset('assets/walle.jpg', fit: BoxFit.cover),
      ),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.info), onPressed: _showBottomSheetCallback),
      ],
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
            style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Ubuntu'),
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
            style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Ubuntu'),
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
        Text('Something', style: TextStyle(fontFamily: 'Ubuntu')),
        Text('₹199'),
      ],
    );
  }

  Widget _buildOutlineButton() {
    return Container(
      child: _isAdded ? _buildFinalButton(1) : _buildAddButton(),
    );
  }

  Widget _buildItemList() {
    return ListTile(
      leading: Image.asset(
        'assets/Non-veg.png',
        width: 24.0,
        height: 24.0,
      ),
      title: Text(
        'Any Text',
        style: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 18.0,
            color: Colors.black87,
            fontWeight: FontWeight.w500),
      ),
      subtitle: _buildSubtitle(),
      trailing: _buildOutlineButton(),
    );
  }

  void _setToolbarSelection(AppBarItem selection) {}

  Widget _buildRatingDisplay(double rating) {
    String _rating = rating.toString();
    return Container(
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20.0,
            child: Icon(
              Icons.star,
              size: 18.0,
            ),
          ),
          SizedBox(width: 4.0),
          Text(
            _rating,
            style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget _buildVegHeader() {
    double _spacing = MediaQuery.of(context).size.width / 2.5;
    return Container(
      height: 60.0,
      width: 200.0,
      child: Row(
        children: <Widget>[
          SizedBox(width: 16.0),
          Text(
            'Veg-Only',
            style: TextStyle(fontFamily: 'Ubuntu', fontWeight: FontWeight.bold),
          ),
          Switch(
            activeThumbImage: AssetImage('assets/Veg.png'),
            activeTrackColor: Colors.green,
            activeColor: Colors.white,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onChanged: (bool value) {},
            value: _isSelected,
          ),
          SizedBox(
            width: _spacing,
          ),
          Container(
            child: _buildRatingDisplay(4.2),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: CustomScrollView(
        slivers: <Widget>[
          _buildCollapsibleAppBar(),
          SliverToBoxAdapter(
            child: _buildVegHeader(),
          ),
          SliverStickyHeader(
            header: Container(
              padding: EdgeInsets.only(left: 16.0),
              alignment: Alignment.centerLeft,
              color: Colors.white,
              height: 40.0,
              child: Text('Header One',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20.0,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.normal)),
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
      ),
      floatingActionButton: Opacity(
        opacity: _isFabVisible ? 1 : 0,
        child: ScaleTransition(
          scale: CurvedAnimation(
            parent: _fabController,
            curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
          ),
          child: PopupMenuButton<AppBarItem>(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  color: kBlueBlue50),
              child: Wrap(
                runAlignment: WrapAlignment.center,
                spacing: 8.0,
                children: <Widget>[
                  Icon(Icons.restaurant, color: Colors.white, size: 20.0),
                  Text(
                    'Menu',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Ubuntu',
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            onSelected: (AppBarItem result) {
              _setToolbarSelection(result);
            },
            itemBuilder: !_isFabVisible
                ? (BuildContext context) => <PopupMenuEntry<AppBarItem>>[]
                : (BuildContext context) => <PopupMenuEntry<AppBarItem>>[
                      PopupMenuItem<AppBarItem>(
                        value: AppBarItem.favorites,
                        child: Text('My Favourites'),
                      ),
                      const PopupMenuDivider(),
                      PopupMenuItem<AppBarItem>(
                        value: AppBarItem.order,
                        child: Text('My Orders'),
                      ),
                      const PopupMenuDivider(),
                      PopupMenuItem<AppBarItem>(
                        value: AppBarItem.settings,
                        child: Text('Settings'),
                      ),
                    ],
          ),
        ),
      ),
    );
  }
}
