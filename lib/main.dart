import 'package:em_chat_uikit/chat_uikit_localizations.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ChatUIKitLocalizations _localization = ChatUIKitLocalizations();

  void initState() {
    _localization.addLocales(locales: const [
      ChatLocal('fr', {
        ChatUIKitLocal.conversationsViewSearchHint: 'Recherche',
        // 需要根据ChatUIKitLocal中的定义将文字补充完整。
      })
    ]);
    // 添加语言后需要进行resetLocales操作
    _localization.resetLocales();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: _localization.localizationsDelegates,
      supportedLocales: _localization.supportedLocales,
      title: 'easemob UIKIT demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
