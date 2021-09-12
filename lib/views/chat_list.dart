import 'package:chat_group_cat/utilities/constant.dart';
import 'package:chat_group_cat/views/chat_room.dart';
import 'package:chat_group_cat/views/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatList extends StatefulWidget {
  static const id = '/chatList';
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: MediaQuery.of(context).size * 0.11,
        child: AppBar(
          leadingWidth: 0,
          leading: Container(),
          title: Transform.translate(
            offset: Offset(0, 7),
            child: Container(
                margin: EdgeInsets.only(left: 10.0, top: 10.0),
                child: Text("Chats", style: kChatText)),
          ),
          actions: [
            Transform.translate(
                offset: Offset(0, 7),
                child: IconButton(
                    onPressed: () {
                      authFirebaseMethods.signOut().then((value) {
                        Navigator.pushReplacementNamed(context, Login.id);
                        sharedPreferencesDatabase.isCheck = false;
                        sharedPreferencesDatabase.setPreferencesInstance();
                      });
                    },
                    icon: Icon(Icons.logout)))
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           GroupChat("Group One","groupOne"),
            GroupChat("Group Two","groupTwo"),
             GroupChat("Group Three","groupThree"),
          ],
        ),
      ),
    );
  }
}

class GroupChat extends StatelessWidget {
 
 final name,collection;
 GroupChat(this.name,this.collection);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(name),
          leading: Icon(Icons.group),
          onTap: ()=>Navigator.of(context).pushNamed(ChatScreen.id,arguments: collection),
        ),
        Divider(height: 1,),
      ], 
    );
  }
}
