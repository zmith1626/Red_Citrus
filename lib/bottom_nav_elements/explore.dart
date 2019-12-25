import 'package:flutter/material.dart';

import '../ui_elements/filtered_chip.dart';

class Explore extends StatefulWidget {
  @override
  _Explore createState() => _Explore();
}

class _Explore extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        _buildAppBar(),
        _buildFilterHeader(),
        _buildCategoryHeader('Trending', Icons.whatshot),
        SliverToBoxAdapter(
          child: Container(height: 150, child: _smallSizedCards()),
        ),
        _buildCategoryHeader('Top Brands', Icons.new_releases),
        SliverToBoxAdapter(
          child: Container(height: 150, child: _smallSizedCards()),
        ),
        _buildCategoryHeader('Fast Foods', Icons.fastfood),
        SliverToBoxAdapter(
          child: Container(height: 150, child: _smallSizedCards()),
        ),
        _buildCategoryHeader('Trending', Icons.whatshot),
        SliverToBoxAdapter(
          child: Container(height: 150, child: _smallSizedCards()),
        ),
        _buildCategoryHeader('Trending', Icons.whatshot),
        SliverToBoxAdapter(
          child: Container(height: 150, child: _smallSizedCards()),
        ),
      ],
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0.0,
      pinned: true,
      title: _buildExploreAppBar(),
    );
  }

  Widget _buildFilterHeader() {
    double _filterHeaderHeight = 200.0;
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        height: _filterHeaderHeight,
        child: Wrap(
          spacing: 8.0,
          runSpacing: 2.0,
          children: <Widget>[
            FilteredChipWidget(filterName: 'Chinese'),
            FilteredChipWidget(filterName: 'North Indian'),
            FilteredChipWidget(filterName: 'South Indian'),
            FilteredChipWidget(filterName: 'Fast Food'),
            FilteredChipWidget(filterName: 'Italian'),
            FilteredChipWidget(filterName: 'Pizza'),
            FilteredChipWidget(filterName: 'Grill Chicken'),
            FilteredChipWidget(filterName: 'Breakast'),
            FilteredChipWidget(filterName: 'Lunch'),
            FilteredChipWidget(filterName: 'Dinner'),
          ],
        ),
      ),
    );
  }

  Widget _smallSizedCards() {
    List<String> eList = [
      'NodeJs',
      'Python',
      'Wordpress',
      'Javascript',
      'Java'
    ];
    return SizedBox(
      height: 150.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: eList.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildSmallCards(eList[index]);
        },
      ),
    );
  }

  Widget _buildSmallCards(String item) {
    return Card(
      child: Container(
        height: 150,
        child: Column(
          children: <Widget>[
            Image.asset('assets/walle.jpg', height: 100, fit: BoxFit.fill),
            SizedBox(height: 4.0),
            Center(child: Text(item, style: TextStyle(fontFamily: 'Ubuntu')))
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryHeader(String categoryType, IconData icon) {
    double _headerHeight = 50.0;
    return SliverToBoxAdapter(
      child: Container(
        height: _headerHeight,
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Icon(icon),
              SizedBox(width: 8.0),
              Text(categoryType,
                  style: TextStyle(fontFamily: 'Ubuntu', fontSize: 20.0))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExploreAppBar() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              padding: EdgeInsets.only(left: 4.0, bottom: 8.0),
              decoration: BoxDecoration(
                  color: Colors.grey[300].withOpacity(0.5),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: TextField(
                style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w700,
                    color: Colors.black45,
                    fontStyle: FontStyle.italic),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.black54),
                  border: InputBorder.none,
                  hintText: 'Search Restaurant',
                  hintStyle: TextStyle(fontFamily: 'Ubuntu'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
