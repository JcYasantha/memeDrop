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
      //print(json.decode(response.body)['data']['memes'][0]);
      //return json.decode(response.body)['data']['memes'][0];
      Navigator.pushReplacementNamed(
        context,
        '/home',
        arguments: ScreenArguments(
          response.data['data']['memes'],
        ),
      );
      //return response.data['data']['memes'];
    } else {
      throw Exception('Failed to load memes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        //CrossAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SpinKitWanderingCubes(
            color: Colors.white,
            size: 20.0,
          ),
          Text(
            'memeDrop',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 30.0),
          ),
        ],
      ),
    );
  }
}
