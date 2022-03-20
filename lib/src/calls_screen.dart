import 'package:flutter/material.dart';
import 'package:flutter_workshop/core/constants.dart';

class Calls extends StatefulWidget {
  const Calls({Key? key}) : super(key: key);

  @override
  _CallsState createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemCount: Constants.calls.length,
          itemBuilder: (BuildContext context, int index) {
            final _model = Constants.calls[index];
            return ListTile(
              leading: CircleAvatar(
                radius: 32.0,
                backgroundImage: NetworkImage(_model.profileImage),
              ),
              title: Text(_model.userName),
              subtitle: Row(
                children: <Widget>[
                  _model.callStatus,
                  Text(_model.date),
                  Text(_model.time),
                ],
              ),
              trailing: IconButton(
                icon:
                    const Icon(Icons.call, color: Color(0XFF128C7E), size: 34),
                onPressed: () {},
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0XFF25D366),
          child: const Icon(Icons.add_call),
        ),
      ),
    );
  }
}
