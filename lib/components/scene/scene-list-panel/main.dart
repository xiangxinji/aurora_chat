import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SceneListPanel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SceneListPanelState();
  }
}

class Scene {
  final String name;
  final String key;
  Scene(this.name, this.key);
}

class SceneListPanelState extends State<SceneListPanel> {
  final List<Scene> scenes = [new Scene('口语交流', '1'), new Scene('日常对话', '2')];

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return Scrollable(
      viewportBuilder: (BuildContext context, ViewportOffset position) {
        return _buildSceneList(primaryColor);
      },
    );
  }

  Widget _buildSceneList(Color primaryColor) {
    final titleTextStyle = TextStyle(color: primaryColor, fontSize: 20);
    return GridView.count(
        crossAxisCount: scenes.length,
        childAspectRatio: 1.5,
        children: scenes.map((item) {
          return Card(
            child: InkWell(
              onTap: () {},
              splashColor: Colors.blue.withAlpha(30),
              child: Center(child: Text(item.name, style: titleTextStyle)),
            ),
          );
        }).toList());
  }
}
