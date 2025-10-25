import 'package:flutter/material.dart';
import 'package:camera_and_filter/widget/filter_item.dart';
import 'package:camera_and_filter/widget/carousel_flowdelegate.dart';
import 'package:flutter/rendering.dart';

class FilterSelector extends StatefulWidget {
  final List<Color> filters;
  final void Function(Color) onFilterChanged;
  const FilterSelector({super.key, required this.filters, required this.onFilterChanged});

  @override
  State<FilterSelector> createState() => _FilterSelectorState();
}

class _FilterSelectorState extends State<FilterSelector> {
  static const _filtersPerScreen = 5;
  static const _viewportFractionPerItem = 1.0 / _filtersPerScreen;

  late final PageController _controller;
  late int _page;

  @override
  void initState() {
    super.initState();
    _page = 0;
    _controller = PageController(
      initialPage: _page,
      viewportFraction: _viewportFractionPerItem,
    );
    _controller.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    final page = (_controller.page ?? 0).round();
    if (page != _page) {
      _page = page;
      widget.onFilterChanged(widget.filters[page]);
    }
  }

  void _onFilterTapped(int index) {
    _controller.animateToPage(index, duration: const Duration(milliseconds: 450), curve: Curves.ease);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: PageView.builder(
        controller: _controller,
        itemCount: widget.filters.length,
        itemBuilder: (context, index) {
          return FilterItem(
            color: widget.filters[index],
            onFilterSelected: () => _onFilterTapped(index),
          );
        },
      ),
    );
  }
}
