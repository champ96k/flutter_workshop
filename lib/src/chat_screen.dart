import 'package:flutter/material.dart';
import 'package:flutter_workshop/core/constants.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemCount: Constants.chats.length,
          itemBuilder: (BuildContext context, int index) {
            final _model = Constants.chats[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(_model.profileImage),
                maxRadius: 32.0,
              ),
              title: Text(
                _model.userName,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(_model.userDescription),
              trailing: Text(
                _model.time,
                style: const TextStyle(color: Colors.grey),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0XFF25D366),
          child: const Icon(Icons.chat),
        ),
      ),
    );
  }
}
