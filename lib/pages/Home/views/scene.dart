import 'package:flutter/material.dart';

import '../../../components/scene/scene-list-panel/main.dart';

class SceneView extends StatelessWidget {
  TextStyle defaultTextStyle = new TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return SafeArea(
        child: Column(
      children: [
        AppBar(
          title: Text('场景', style: defaultTextStyle),
        ),
        Expanded(child: SceneListPanel())
      ],
    ));
  }
}
