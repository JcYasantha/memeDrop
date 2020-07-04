import 'package:flutter/material.dart';
import 'package:meme_drop/services/screenArguments.dart';
import 'package:meme_drop/services/argumantURL.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue[700],
        title: Text("Select a meme template"),
      ),
      body: Container(
        color: Colors.grey[200],
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: args.memes.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/memeCreate',
                    arguments: ArgumentURL(
                      args.memes[index]['url'],
                      args.memes[index]['id'],
                    ),
                  );
                },
                child: Container(
                  child: Image.network(
                    args.memes[index]['url'],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }
}
