import 'package:auraro_chat/pages/Home/views/myself.dart';
import 'package:auraro_chat/pages/Home/views/scene.dart';
import 'package:auraro_chat/pages/Home/views/start.dart';
import 'package:flutter/material.dart';
import '../../components/navigation-bar/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int currentIndex = 0;

  List<Widget> pageViews = [StartView(), SceneView(), MyselfView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(237, 237, 237, 1),
      // bottomNavigationBar: ACNavigationBar(
      //   currentIndex: currentIndex,
      //   onTap: (int index) {
      //     setState(() {
      //       currentIndex = index;
      //     });
      //   },
      // ),
      body: pageViews[currentIndex],
    );
  }
}
