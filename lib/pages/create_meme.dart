import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:meme_drop/services/argumantURL.dart';

class MemeCreate extends StatefulWidget {
  @override
  _MemeCreateState createState() => _MemeCreateState();
}

class _MemeCreateState extends State<MemeCreate> {
  final firstLine = TextEditingController();
  final secondLine = TextEditingController();

  void sendMeme(
      String id, String url, String firstLine, String secondLine) async {
    // ignore: non_constant_identifier_names
    final String template_id = id;
    final String username = 'place your username here';
    final String password = 'place your password here';
    final String text0 = firstLine;
    final String text1 = secondLine;

    var response = await Dio().get(
        'https://api.imgflip.com/caption_image?template_id=$template_id&text0=$text0&text1=$text1&username=$username&password=$password');

    if (response.statusCode == 200) {
      print(response.data['data']['url']);
      Navigator.pushNamed(
        context,
        '/downloadMeme',
        arguments: ArgumentURL(
          response.data['data']['url'],
          template_id,
        ),
      );
    } else {
      throw Exception('Failed to load memes');
    }
  }

  @override
  Widget build(BuildContext context) {
    final ArgumentURL args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue[700],
        title: Text("Edit Meme"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(
              args.url,
              scale: 3.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: firstLine,
                    decoration:
                        InputDecoration(labelText: 'Enter the first line'),
                  ),
                  TextField(
                    controller: secondLine,
                    decoration:
                        InputDecoration(labelText: 'Enter the second line'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue[700],
        onPressed: () {
          sendMeme(args.id, args.url, firstLine.text, secondLine.text);
        },
        child: Icon(Icons.create),
      ),
    );
  }
}
