import 'package:flutter/material.dart';
import 'package:nota/widgets/color_item.dart';

class ColorListView extends StatefulWidget {
  const ColorListView({
    super.key,
  });

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              child: ColorItem(
                  isActive: currentIndex == index, color: Colors.black),
            ),
        separatorBuilder: (context, index) => const SizedBox(
              width: 10.0,
            ),
        itemCount: 10);
  }
}
