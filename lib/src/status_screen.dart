import 'package:flutter/material.dart';
import 'package:flutter_workshop/core/constants.dart';

class Status extends StatefulWidget {
  const Status({Key? key}) : super(key: key);

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 12.0),
              const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/pic1.png"),
                  radius: 32.0,
                ),
                title: Text(
                  "My Status",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text("Tap to add Status update"),
              ),
              SizedBox(
                height: 32,
                child: Container(
                  alignment: Alignment.centerLeft,
                  color: Colors.grey[200],
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      "Viewed Updates",
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: Constants.status.length,
                itemBuilder: (BuildContext context, int index) {
                  final _model = Constants.status[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color(0XFF128c7e),
                      backgroundImage: NetworkImage(_model.profileImage),
                      radius: 32.0,
                    ),
                    title: Text(
                      _model.userName,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      _model.lastSeenTime,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0XFF25D366),
          child: const Icon(Icons.camera_alt),
        ),
      ),
    );
  }
}
