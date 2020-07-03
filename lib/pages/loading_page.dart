import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meme_drop/services/screenArguments.dart';

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
      body: Center(child: CircularProgressIndicator()),
      // child: FutureBuilder<List>(
      //   future: futureMemes,
      //   builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
      //     if (snapshot.hasData) {
      //       print(snapshot.data[0]['url']);
      //       Navigator.pushReplacementNamed(
      //         context,
      //         '/home',
      //         arguments: ScreenArguments(
      //           snapshot.data,
      //         ),
      //       );

      //       return Container();
      //     } else if (snapshot.hasError) {
      //       return Text('Error: ${snapshot.error}');
      //     } else {
      //       return Center(child: CircularProgressIndicator());
      //     }
      //   },
      // ),
    );
  }
}
