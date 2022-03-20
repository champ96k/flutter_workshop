import 'package:flutter/material.dart';
import 'package:flutter_workshop/src/status_screen.dart';

import 'calls_screen.dart';
import 'camera_screen.dart';
import 'chat_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xFF075e54),
            title: const Text(
              "WhatsApp",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ],
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.camera_alt),
                ),
                Tab(
                  child: Text(
                    "CHATS",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    "STATUS",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    "CALLS",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )),
        body: const TabBarView(
          children: <Widget>[
            Camera(),
            Chat(),
            Status(),
            Calls(),
          ],
        ),
      ),
    );
  }
}
