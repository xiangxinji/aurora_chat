import 'dart:io';

import 'package:auraro_chat/store/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './components/navigation-bar/main.dart';
import './pages/Home/index.dart';
import './api/gpt.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());

  // 判断当前设备是否为安卓
  if (Platform.isAndroid) {
    // 这一步设置状态栏颜色为透明
    SystemUiOverlayStyle systemUiOverlayStyle =
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AuraroChat',
      home: Provider(
        lazy: false,
        create: (_) => User(),
        child: HomePage(),
      ),
    );
  }
}
