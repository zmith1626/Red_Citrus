import 'package:flutter/material.dart';

import '../colors.dart';

class FilteredChipWidget extends StatefulWidget {
  const FilteredChipWidget({@required this.filterName});
  final String filterName;
  @override
  _FilteredChipWidgetState createState() => _FilteredChipWidgetState();
}

class _FilteredChipWidgetState extends State<FilteredChipWidget> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.filterName),
      labelStyle: TextStyle(fontFamily: 'Ubuntu', color: kBlueBlue150),
      selected: _isSelected,
      onSelected: _applyFilterSelection,
    );
  }

  _applyFilterSelection(bool) {
    setState(() {
      _isSelected = !_isSelected;
    });
  }
}
