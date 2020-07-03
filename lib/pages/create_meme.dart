import 'package:flutter/material.dart';
import 'package:meme_drop/services/argumantURL.dart';

class MemeCreate extends StatefulWidget {
  @override
  _MemeCreateState createState() => _MemeCreateState();
}

class _MemeCreateState extends State<MemeCreate> {
  final firstLine = TextEditingController();
  final secondLine = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ArgumentURL args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black87,
        title: Text("Edit Meme"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(
              args.url,
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
        backgroundColor: Colors.black87,
        onPressed: () {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text('${firstLine.text} ${secondLine.text}'),
              );
            },
          );
        },
        child: Icon(Icons.create),
      ),
    );
  }
}
