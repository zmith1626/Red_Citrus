import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../ui_elements/bottom_nav_transistion.dart';
import '../bottom_nav_elements/home.dart';
import '../bottom_nav_elements/emptycart.dart';
import '../bottom_nav_elements/explore.dart';
import '../bottom_nav_elements/profile.dart';
import '../ui_elements/bottom_appbar.dart';
import '../colors.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

enum AppBarItem { favorite, settings, order }

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  CurvedAnimation _curvedAnimation;
  Animation<double> _slideAnimation;
  Animation<Offset> _fabAnimation;
  int _selectedIndex = 0;
  List<Widget> _navPages = [HomePage(), Explore(), Profile(), EmptyCart()];

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
    _fabAnimation = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 2.0))
        .animate(_curvedAnimation);
    _slideAnimation =
        Tween<double>(begin: 40.0, end: 0.0).animate(_curvedAnimation);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      backgroundColor: kBlueBlue150,
      child: Image.asset(
        './assets/send-message-button.png',
        color: kBlueteal150,
        width: 28,
        height: 28,
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/cart');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollUpdateNotification>(
          onNotification: (notification) {
            if ((notification.scrollDelta > 0) &&
                (notification.metrics.axis == Axis.vertical) &&
                (_slideAnimation.isDismissed)) {
              _controller.forward();
            } else if ((notification.scrollDelta < 0) &&
                (notification.metrics.axis == Axis.vertical) &&
                (_slideAnimation.isCompleted)) {
              _controller.reverse();
            }
            return;
          },
          child: _navPages[_selectedIndex]),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: SlideTransition(
        position: _fabAnimation,
        child: _buildFAB(),
      ),
      bottomNavigationBar: BottomNavTransistion(
        slideAnimation: _slideAnimation,
        appBarChild: CustomBottomAppbar(
          onTabSelected: _selectedTab,
        ),
      ),
    );
  }

  bool _cartIsEmpty = true;
  _selectedTab(index) {
    int _emptyCartIndex = 3;
    if (index == _emptyCartIndex && !_cartIsEmpty) {
      Navigator.pushNamed(context, '/cart');
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
}
