import 'package:flutter/material.dart';
import 'package:meme_drop/pages/loading_page.dart';
import 'package:meme_drop/pages/create_meme.dart';
import 'package:meme_drop/pages/download_meme.dart';
import 'package:meme_drop/pages/home.dart';

void main() {
  runApp(MaterialApp(
    title: "MemeDrop",
    initialRoute: '/',
    routes: {
      '/': (context) => LoadingPage(),
      '/home': (context) => Home(),
      '/memeCreate': (context) => MemeCreate(),
      '/downloadMeme': (context) => DownloadMeme(),
    },
  ));
}
