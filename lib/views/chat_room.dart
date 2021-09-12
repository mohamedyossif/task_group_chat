import 'package:chat_group_cat/serviecs/auth_firebase.dart';
import 'package:chat_group_cat/utilities/constant.dart';
import 'package:chat_group_cat/views/chat_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String ?collection;

final _firestore = FirebaseFirestore.instance;
User? _userCurrent;

class ChatScreen extends StatefulWidget {
  static const id = '/chat';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _textController = TextEditingController();

  String? _messageText;
  @override
  void initState() {
    super.initState();
    AuthFirebaseMethods.firebaseAuth.authStateChanges().listen(
      (User? user) {
        if (user != null) {
          _userCurrent = user;
        } else {
          print('User is Signed Out');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    collection=ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Transform.translate(
          offset: Offset(72, 0),
          child: Text("Chat"),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MessageStream(),
            Container(
              decoration: kMessageContainer,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                        controller: _textController,
                        decoration: kMessageTextFieldDecoration,
                        onChanged: (value) => _messageText = value),
                  ),
                  TextButton(
                    onPressed: () {
                      _textController.clear();


                      _firestore.collection(collection!).add(
                        {'text': _messageText, 'sender': _userCurrent!.email,
                        'time': DateTime.now().toString(),
                        },
                      );
                    },
                    child: Text('Send', style: kSendButtonText),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map>>(
      stream: _firestore.collection(collection!).orderBy('time').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }

        final messages = snapshot.data!.docs.reversed;
        List<MessageBubble> messagesBubble = [];
        for (var message in messages) {
          final messageSender = message.data()['sender'];
          final messageText = message.data()['text'];
          final messageBubble = MessageBubble(
              messageText, messageSender, messageSender == _userCurrent!.email);
          messagesBubble.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            children: messagesBubble,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  final _messageText;
  final _messageSender;
  final bool _isMe;
  MessageBubble(this._messageText, this._messageSender, this._isMe);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          _isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0, top: 10),
          child: Text(
            _messageSender,
            style: kMessageSender,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            elevation: 8.0,
            borderRadius: _isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0))
                : BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(_messageText),
            ),
            color: _isMe ? Colors.lightBlueAccent : Colors.white,
          ),
        ),
      ],
    );
  }
}