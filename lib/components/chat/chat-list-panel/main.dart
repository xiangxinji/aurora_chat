import 'package:auraro_chat/api/gpt.dart';
import 'package:flutter/material.dart';
import '../chat-list-item/main.dart';
import '../inscription/main.dart';

class ChatListPanel extends StatefulWidget {
  List<ChatItem> chats;
  ChatListPanel(this.chats, {super.key});
  @override
  State<StatefulWidget> createState() {
    return ChatListPanelState(chats);
  }
}

class ChatItem {
  String content;
  bool self;
  ChatItem(this.content, {this.self = true});
}

class ChatListPanelState extends State<ChatListPanel> {
  List<ChatItem> chats;

  ChatListPanelState(this.chats);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      ...chats.map((e) {
        return ChatListItem(e);
      }).toList(),
    ];
    return Column(
      children: children,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
