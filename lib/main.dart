import 'package:chat_group_cat/views/app.dart';
import 'package:chat_group_cat/views/chat_list.dart';
import 'package:chat_group_cat/views/chat_room.dart';
import 'package:chat_group_cat/views/flash.dart';
import 'package:chat_group_cat/views/login.dart';
import 'package:chat_group_cat/views/register.dart';
import 'package:flutter/material.dart';
main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.green[50],
        appBarTheme: AppBarTheme(
          color: Colors.green,
        ),
        accentColor: Colors.green,
      ),
      initialRoute: App.id,
      routes: {
        App.id: (context) => App(),
       Flash.id: (context) => Flash(),
        Login.id: (context) => Login(),
        Register.id: (context) => Register(),
        ChatList.id: (context) => ChatList(),
        ChatScreen.id: (context) => ChatScreen(),
     
      },
    );
  }
}