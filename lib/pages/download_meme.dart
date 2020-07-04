import 'package:flutter/material.dart';
import 'package:meme_drop/services/argumantURL.dart';

class DownloadMeme extends StatefulWidget {
  @override
  _DownloadMemeState createState() => _DownloadMemeState();
}

class _DownloadMemeState extends State<DownloadMeme> {
  @override
  Widget build(BuildContext context) {
    final ArgumentURL args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue[700],
        title: Text("Download Meme"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Image.network(args.url),
        ),
      ),
    );
  }
}
