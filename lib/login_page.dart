import 'package:easemob_uikit/chat_presenter.dart';
import 'package:em_chat_uikit/chat_uikit/src/chat_uikit_service/chat_uikit_service.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
   return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage>{
  String _username = "";
  String _password = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("登录页面"),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 100),
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter username"),
              onChanged: (username) => _username = username,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter password"),
              onChanged: (password) => _password = password,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: _signIn,
                    child: const Text("登录"),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor:
                      MaterialStateProperty.all(Colors.lightBlue),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  void _signIn() async {

    if (_username.isEmpty || _password.isEmpty) {
      return;
    }
    ChatUIKit.instance.loginWithPassword(userId: _username, password: _password).then((value) {
      print("登录成功");
      _startHomePage();
    }).catchError((error){
      print("登录失败${error.toString()}");
      if(error.code == 200){
        _startHomePage();
      }
    });

  }
  void _startHomePage(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return MaterialApp(
        title: 'Easemob App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      );
    }));
  }
}
