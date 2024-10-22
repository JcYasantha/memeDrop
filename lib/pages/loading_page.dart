import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meme_drop/services/screenArguments.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Future<List> futureMemes;

  @override
  void initState() {
    super.initState();
    fetchMemes();
  }

  void fetchMemes() async {
    var response = await Dio().get('https://api.imgflip.com/get_memes');

    if (response.statusCode == 200) {
      Navigator.pushReplacementNamed(
        context,
        '/home',
        arguments: ScreenArguments(
          response.data['data']['memes'],
        ),
      );
    } else {
      throw Exception('Failed to load memes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/memeDrop.png',
            scale: 10.0,
          ),
          SpinKitThreeBounce(
            color: Colors.grey[600],
            size: 20.0,
          ),
        ],
      ),
    );
  }
}
