import 'dart:async';

import 'package:auraro_chat/store/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../../api/gpt.dart';
import '../../../components/chat/chat-list-panel/main.dart';
import '../../../components/chat/inscription/main.dart';

class StartView extends StatefulWidget {
  const StartView({super.key});

  @override
  State<StatefulWidget> createState() {
    return StartViewState();
  }
}

class StartViewState extends State<StartView> {
  String value = '';

  List<ChatItem> chats = [
    ChatItem('Hi'),
    ChatItem('你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好你好'),
    ChatItem('Hi', self: false)
  ];

  final scrollController = ScrollController();

  double maxScrollExtent = 0;

  double scrollOffset = 0;

  Future<void> onEnter(String content) async {
    var data = await GptApi.send(content);
    var messages = data['messages'] as List<dynamic>;
    setState(() {
      chats.add(ChatItem(content));
      for (var element in messages) {
        chats.add(ChatItem(element, self: false));
      }
    });

    const duration = Duration(microseconds: 500);
    Timer(duration, () {
      scrollController.animateTo(maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.bounceInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    final Color primaryColor = Theme.of(context).primaryColor;

    scrollController.addListener(() {
      scrollOffset = scrollController.offset;
    });

    return SafeArea(
      child: Stack(children: [
        Scrollbar(
            child: NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  maxScrollExtent = notification.metrics.viewportDimension +
                      notification.metrics.maxScrollExtent;
                  return false;
                },
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 40),
                          constraints: BoxConstraints(
                              minHeight:
                                  MediaQuery.of(context).size.height - 100),
                          child: ChatListPanel(chats)),
                    ],
                  ),
                ))),
        Positioned(child: ChatInscription(onEnter), bottom: 0)
      ]),
    );
  }
}
