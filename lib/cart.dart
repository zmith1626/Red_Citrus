import 'package:flutter/material.dart';

import './colors.dart';

class Cart extends StatefulWidget {
  @override
  _Cart createState() => _Cart();
}

class _Cart extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return _buildItemScaffold();
  }

  List<String> product = ['Biryani', 'Chicken Fried Rice', 'Noodles', 'Pastry'];

  Widget _buildItemScaffold() {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: SizedBox(height: 8.0),
            ),
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  key: Key(product[index]),
                  background: _buildDismissableBackground(),
                  child: _buildSelectedItemList(product[index]),
                );
              }, childCount: product.length),
            )
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  Widget _bottomNavBar() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/rough');
      },
      child: Container(
        height: 50.0,
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Proceed for Checkout',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 150.0),
            Icon(Icons.arrow_forward, color: Colors.white)
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    String _headerText = "What's in My Cart";
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.grey[200],
      elevation: 0.0,
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.local_mall, color: kBlueBlue150),
            SizedBox(width: 10.0),
            Text(
              _headerText,
              style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w500,
                  color: kBlueBlue150),
            )
          ],
        ),
      ),
      actions: <Widget>[
        Center(
          child: Text(
            '₹199',
            style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.w500,
                color: kBlueBlue150),
          ),
        ),
        SizedBox(width: 20.0),
      ],
    );
  }

  Widget _buildDismissableBackground() {
    return Container(
      padding: EdgeInsets.only(right: 24.0),
      alignment: Alignment.centerRight,
      color: kBlueErrorRed,
      child: Container(
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(26)),
            border: Border.all(color: kBlueSurfaceWhite)),
        child: Icon(Icons.delete, color: Colors.white),
      ),
    );
  }

  Widget _buildSelectedItemList(String product) {
    return ListTile(
      leading: Image.asset(
        'assets/Non-veg.png',
        width: 24.0,
        height: 24.0,
      ),
      title: Text(
        product,
        style: TextStyle(
            fontFamily: 'Ubuntu',
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
            color: Colors.black87),
      ),
      subtitle: _buildSubtitle(),
      trailing: _buildOutlineButton(),
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
    return Container(child: _buildFinalButton(1));
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
                //_isAdded = false;
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
}
