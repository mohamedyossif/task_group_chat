import 'package:chat_group_cat/serviecs/auth_firebase.dart';
import 'package:chat_group_cat/serviecs/database.dart';
import 'package:chat_group_cat/serviecs/shared_preferences.dart';
import 'package:flutter/material.dart';

///variables
AuthFirebaseMethods authFirebaseMethods = AuthFirebaseMethods();
FireStoreDatabaseMethods fireStoreDatabaseMethods = FireStoreDatabaseMethods();
SharedPreferencesDatabase sharedPreferencesDatabase =
    SharedPreferencesDatabase();

///styles
TextStyle kResultSearch = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

TextStyle kMessageSender=TextStyle(
  color: Colors.black54,
  fontSize: 10.0
);

TextStyle kWeChatText = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 40,
  color: Colors.green[900],
);
TextStyle kChatText = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
  color: Colors.green[50],
);

TextStyle kButtonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 13,
);
TextStyle kSendButtonText=TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0
);
BoxDecoration kMessageContainer =BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent,width: 1.0)
  )
);

InputDecoration kMessageTextFieldDecoration=InputDecoration(
  hintText: "Type Your Message here...",
  border:InputBorder.none,

  contentPadding: EdgeInsets.symmetric(horizontal: 15.0)
);


InputDecoration kFieldTextStyle = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.green),
    borderRadius: BorderRadius.circular(5.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.green, width: 2),
    borderRadius: BorderRadius.circular(5.0),
  ),
  hintText: 'Enter Your Email',
);
