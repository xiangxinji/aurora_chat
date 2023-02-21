import 'package:flutter/material.dart';

import '../chat-list-panel/main.dart';

class ChatListItem extends StatefulWidget {
  final ChatItem chatItem;
  const ChatListItem(this.chatItem, {super.key});

  @override
  State<StatefulWidget> createState() {
    return ChatListItemState(chatItem);
  }
}

class ChatListItemState extends State<ChatListItem> {
  final ChatItem chatItem;

  ChatListItemState(this.chatItem);

  /**
   * 构建头像
   */
  Widget _buildAvatar() {
    double size = 43;
    return PhysicalModel(
      borderRadius: BorderRadius.circular(6),
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: size,
        height: size,
        child: Image.asset(chatItem.self
            ? 'assets/images/avatar.jpg'
            : 'assets/images/gptlogo.png'),
      ),
    );
  }

  /**构建用户名 */
  Widget? _buildUsername(String? name) {
    if (name != null) {
      return Container(
        child: Text(
          name,
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 16),
        ),
        margin: EdgeInsets.only(bottom: 5),
      );
    }
    return null;
  }

  // Widget _buildMessageContent() {}

  Widget _buildChatLayout(Widget avatar, Widget? username) {
    Widget Username = username ??
        const SizedBox(
          height: 0,
        );

    List<Widget> children = [
      Container(
        padding: chatItem.self
            ? EdgeInsets.only(left: 10)
            : EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Username,
            Container(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              constraints: BoxConstraints(maxWidth: 240),
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(169, 233, 121, 1),
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Text(
                chatItem.content,
                style: TextStyle(
                  leadingDistribution: TextLeadingDistribution.even,
                  height: 1.5,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      )
    ];

    if (chatItem.self) {
      children.insert(0, avatar);
    } else {
      children.add(avatar);
    }
    return Row(
      mainAxisAlignment:
          chatItem.self ? MainAxisAlignment.start : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  Widget _buildSelfChatItem() {
    final avatar = _buildAvatar();
    final name = _buildUsername('Andy');
    return Row(
      children: [Expanded(child: _buildChatLayout(avatar, name))],
    );
  }

  Widget _buildAIChatItem() {
    final avatar = _buildAvatar();
    return Row(
      children: [Expanded(child: _buildChatLayout(avatar, null))],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: chatItem.self ? _buildSelfChatItem() : _buildAIChatItem(),
    );
  }
}
