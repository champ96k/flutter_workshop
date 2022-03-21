import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_workshop/news_model.dart';
import 'package:http/http.dart' as http;

import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<NewsModel> _getchNews() async {
    final http.Response response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=4834488af2324601b457ff4711937079"));

    if (response.statusCode == 200) {
      final _result = NewsModel.fromMap(jsonDecode(response.body));
      return _result;
    } else {
      throw Exception("Something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
        title: const Text(
          "News Hours",
        ),
      ),
      body: FutureBuilder(
        future: _getchNews(),
        builder: (BuildContext context, AsyncSnapshot<NewsModel> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Somethint went wrong! Please try again"),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.articles?.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () async {
                    if (!await launch(
                        snapshot.data?.articles?[index]?.url ?? '')) {
                      throw 'Could not launch ${snapshot.data?.articles?[index]?.url ?? 'https://quadmenu.com/divi/wp-content/uploads/sites/8/2013/06/placeholder-image.png'}';
                    }
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image(
                              image: NetworkImage(
                                snapshot.data?.articles?[index]?.urlToImage ??
                                    "",
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            snapshot.data?.articles?[index]?.title ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            snapshot.data?.articles?[index]?.description ?? '',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "Auther: ${snapshot.data?.articles?[index]?.author ?? ''}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "Source: ${snapshot.data?.articles?[index]?.source?.name ?? ''}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
