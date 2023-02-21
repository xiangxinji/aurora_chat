import 'package:flutter/material.dart';

class ACNavigationBar extends StatefulWidget {
  final Function(int) onTap;
  final int currentIndex;

  const ACNavigationBar(
      {super.key, required this.onTap, required this.currentIndex});

  @override
  State<StatefulWidget> createState() {
    return ACNavigationBarState(onTap);
  }
}

class ACNavigationBarState extends State<ACNavigationBar> {
  final Function(int) onTap;

  int currentIndex = 0;

  ACNavigationBarState(this.onTap);

  @override
  Widget build(Object context) {
    const items = [
      BottomNavigationBarItem(icon: Icon(Icons.abc_sharp), label: '开始'),
      BottomNavigationBarItem(icon: Icon(Icons.abc_rounded), label: '场景'),
      BottomNavigationBarItem(icon: Icon(Icons.select_all), label: '我的'),
    ];

    return BottomNavigationBar(
      items: items,
      currentIndex: currentIndex,
      onTap: (num) {
        currentIndex = num;
        onTap(num);
      },
    );
  }
}
