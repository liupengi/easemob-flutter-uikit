import 'package:em_chat_uikit/chat_uikit.dart';
import 'package:flutter/material.dart';

import 'chat_presenter.dart';
import 'demo_localizations.dart';
import 'login_page.dart';

void main() {
  runApp(MyApp());
}

// 将StatelessWidget改为StatefulWidget
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // 创建本地化实例
  late ChatUIKitLocalizations _localization = ChatUIKitLocalizations();

  @override
  void initState() {
    super.initState();
    ChatPresenter().initSDK();

    // 设置默认语言配置（中文和英文）
    _localization.defaultLocale = [
      ChatLocal(
        'zh',
        Map.from(ChatUIKitLocal.zh)..addAll(DemoLocalizations.zh),
      ),
      ChatLocal(
        'en',
        Map.from(ChatUIKitLocal.en)..addAll(DemoLocalizations.en),
      ),
    ];


    _localization.resetLocales();
    _localization.translate(
        "zh"
    );

    // 设置输入栏圆角
    ChatUIKitSettings.inputBarRadius = CornerRadius.medium;


  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 配置本地化支持
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      localeResolutionCallback: _localization.localeResolutionCallback,
      locale: _localization.currentLocale,
      title: 'easemob UIKIT demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}