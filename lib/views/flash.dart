import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_group_cat/utilities/constant.dart';
import 'package:chat_group_cat/views/chat_list.dart';
import 'package:chat_group_cat/views/login.dart';
import 'package:flutter/material.dart';

class Flash extends StatefulWidget {
  static const id = '/flash';
  @override
  State<StatefulWidget> createState() {
    return _FlashState();
  }
}

class _FlashState extends State<Flash> {
  Login login = Login();
  void flashScreen(context) {
    Future.delayed(Duration(seconds: 1), () {
      if (!sharedPreferencesDatabase.isCheck) {
        Navigator.of(context).pushReplacementNamed(Login.id);
      } else {
        Navigator.of(context).pushReplacementNamed(ChatList.id);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    sharedPreferencesDatabase.getPreferencesInstance();
  }

  @override
  Widget build(BuildContext context) {
    flashScreen(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.chat,color: Colors.green,size: 50,),
               
              AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText(
                    'Group Chat',
                    textStyle: kWeChatText,
                  ),
                ],
                isRepeatingAnimation: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
