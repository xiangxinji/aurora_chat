import 'package:flutter/material.dart';

class ChatInscription extends StatefulWidget {
  final Function(String) onEnter;

  ChatInscription(this.onEnter, {super.key}) {}

  @override
  State<StatefulWidget> createState() {
    return ChatInscriptionState(onEnter);
  }
}

class ChatInscriptionState extends State<ChatInscription> {
  final Function(String) onEnter;

  String text = '';
  ChatInscriptionState(
    this.onEnter,
  );

  @override
  Widget build(BuildContext context) {
    TextEditingController inputController = TextEditingController();
    var input = TextField(
      controller: inputController,
      onChanged: (String content) {
        text = content;
      },
      onEditingComplete: () {
        onEnter(text);
        inputController.clear();
      },
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.only(left: 10),
      ),
    );

    var width = MediaQuery.of(context).size.width - 40;

    return Container(
      decoration: BoxDecoration(color: Colors.white),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Row(children: [Expanded(child: Center(child: input))]),
            width: width,
          )
        ],
      ),
    );
  }
}
