import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../colors.dart';
import '../ui_elements/styling_element.dart';
import '../ui_elements/sliverpersistent_header.dart';

enum AppBarItem { favorite, settings, order }

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  Widget _buildExpandedHeader() {
    return Expanded(
      flex: 1,
      child: TextFormField(
        enabled: false,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.home,
              color: Colors.black87,
              size: 24.0,
            ),
            hintText: 'Home',
            hintStyle: designTextStyle(Colors.black87, 'Ubuntu',
                FontWeight.bold, FontStyle.normal, 20.0)),
      ),
    );
  }

  Widget _typeHeader(String headerText, IconData headerIcon) {
    double _headerHeight = 50.0;
    return SliverToBoxAdapter(
      child: Container(
        height: _headerHeight,
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Icon(headerIcon, color: kBlueErrorRed, size: 24.0),
              SizedBox(width: 8.0),
              Text(headerText,
                  style: TextStyle(fontFamily: 'Ubuntu', fontSize: 20.0)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _roundShapedCard() {
    List<String> eList = ['apple', 'ball', 'Cat', 'Dog'];
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: eList.length,
        itemBuilder: (BuildContext context, int index) {
          return _circularCardBuilder(eList[index]);
        },
      ),
    );
  }

  Widget _listCardBuilder() {
    return Card(
      child: Container(
        padding: EdgeInsets.all(4.0),
        child: Row(
          children: <Widget>[
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/injustice.jpg'),
                      fit: BoxFit.fitHeight)),
            ),
            Container(
              padding: EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Alpha', style: monospaceBlackBoldTextStyle()),
                  SizedBox(height: 8.0),
                  Container(
                    padding: EdgeInsets.only(top: 8.0),
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(width: 2.0))),
                    child: Text('god among us',
                        style: monospaceBlackBoldTextStyle()),
                  ),
                  SizedBox(height: 8.0),
                  Text('For real', style: monospaceBlackBoldTextStyle()),
                  SizedBox(height: 8.0),
                  _ratingOutlineBoxDecoration()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _circularCardBuilder(String value) {
    return Card(
      elevation: 0.0,
      child: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(8.0),
          width: 92.0,
          height: 92.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/injustice.jpg'),
                  fit: BoxFit.fitHeight),
              border: Border.all(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(46.0))),
        ),
        Text(value,
            style: designTextStyle(Colors.black87, 'Ubuntu', FontWeight.w400,
                FontStyle.normal, 18.0))
      ]),
    );
  }

  Widget _mediumSizedCard() {
    List<String> eList = ['apple', 'ball', 'Cat', 'Dog'];
    return SizedBox(
      height: 250.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: eList.length,
        itemBuilder: (BuildContext context, int index) {
          return _mediumSizedCardBuilder(eList[index]);
        },
      ),
    );
  }

  Widget _ratingBoxDecoration(Color color) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 3.0),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(5.0)),
        child: Wrap(
          spacing: 4.0,
          children: <Widget>[
            Icon(
              Icons.star,
              size: 16.0,
            ),
            Text('4.0', style: monospaceBlackBoldTextStyle())
          ],
        ));
  }

  Widget _ratingOutlineBoxDecoration() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 3.0),
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(5.0)),
        child: Wrap(
          spacing: 4.0,
          children: <Widget>[
            Icon(
              Icons.star,
              size: 16.0,
            ),
            Text('4.0', style: monospaceBlackBoldTextStyle())
          ],
        ));
  }

  Widget _mediumSizedCardBuilder(String value) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(4.0),
        width: 200.0,
        height: 250.0,
        decoration: BoxDecoration(
            border: Border(), borderRadius: BorderRadius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/injustice.jpg'),
                      fit: BoxFit.fitHeight)),
            ),
            Positioned(
              left: 8.0,
              bottom: 8.0,
              child: Text(value,
                  style: designTextStyle(Colors.white, 'Ubuntu',
                      FontWeight.w500, FontStyle.normal, 18.0)),
            ),
            Positioned(
              top: 8.0,
              right: 8.0,
              child: _ratingBoxDecoration(Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Widget _sliverHeader() {
    return SliverPersistentHeader(
      delegate: SliverAppBarDelegate(
          minHeight: 50.0,
          maxHeight: 50.0,
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    padding: EdgeInsets.only(left: 4.0, bottom: 8.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[300].withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: TextField(
                      style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.w500,
                          color: Colors.black45,
                          fontStyle: FontStyle.italic),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.black54),
                        border: InputBorder.none,
                        hintText: 'Search Restaurant',
                        hintStyle: designTextStyle(Colors.black54, 'Ubuntu',
                            FontWeight.w500, FontStyle.italic, 14.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Container(
                    margin: EdgeInsets.only(right: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[300].withOpacity(0.5),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.tune),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          )),
      pinned: true,
    );
  }

  Widget _sliverAppBar() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      title: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[_buildExpandedHeader()],
        ),
      ),
      actions: <Widget>[
        PopupMenuButton<AppBarItem>(
          icon: Icon(Icons.more_vert, color: Colors.black87),
          onSelected: (AppBarItem result) {
            _setToolbarSelection(result);
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<AppBarItem>>[
                PopupMenuItem<AppBarItem>(
                    value: AppBarItem.favorite,
                    child: Row(children: <Widget>[
                      Icon(Icons.loyalty),
                      SizedBox(width: 8.0),
                      Text('My Favourites',
                          style: monospaceBlackBoldTextStyle()),
                    ])),
                const PopupMenuDivider(),
                PopupMenuItem<AppBarItem>(
                    value: AppBarItem.order,
                    child: Row(children: <Widget>[
                      Icon(Icons.description),
                      SizedBox(width: 8.0),
                      Text('My Orders', style: monospaceBlackBoldTextStyle()),
                    ])),
                const PopupMenuDivider(),
                PopupMenuItem<AppBarItem>(
                    value: AppBarItem.settings,
                    child: Row(children: <Widget>[
                      Icon(Icons.settings),
                      SizedBox(width: 8.0),
                      Text('Settings', style: monospaceBlackBoldTextStyle()),
                    ])),
              ],
        )
      ],
    );
  }

  void _setToolbarSelection(AppBarItem result) {
    if (result == AppBarItem.settings) {
      Navigator.pushNamed(context, '/description');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        _sliverAppBar(),
        _typeHeader('Trending', Icons.whatshot),
        SliverToBoxAdapter(
          child: Container(height: 250.0, child: _mediumSizedCard()),
        ),
        _sliverHeader(),
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return _listCardBuilder();
          }, childCount: 3),
        ),
        _typeHeader('Fast Foods', Icons.fastfood),
        SliverToBoxAdapter(
          child: Container(height: 130.0, child: _roundShapedCard()),
        ),
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return _listCardBuilder();
          }, childCount: 5),
        ),
      ],
    );
  }
}
