import 'package:flutter/material.dart';
import 'package:meme_drop/pages/loading_page.dart';
import 'package:meme_drop/pages/home.dart';

void main() {
  runApp(MaterialApp(
    title: "MemeDrop",
    initialRoute: '/',
    routes: {
      '/': (context) => LoadingPage(),
      '/home': (context) => Home(),
    },
  ));
}
