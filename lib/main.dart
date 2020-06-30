import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MemeGenerate();
  }
}

class MemeGenerate extends StatefulWidget {
  @override
  _MemeGenerateState createState() => _MemeGenerateState();
}

class _MemeGenerateState extends State<MemeGenerate> {
  Future<List> memes;

  Future<List> getMemes() async {
    var response = await Dio().get('https://api.imgflip.com/get_memes');
    return response.data['data']['memes'];
  }

  @override
  void initState() {
    memes = getMemes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'memeDrop',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('memeDrop'),
        ),
        body: Container(
          child: FutureBuilder<List>(
            future: memes,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data[0]['url']);
                return ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                      snapshot.data[index]['url'],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                );
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}
// class MyApp extends StatelessWidget {
//   void tt() async {
//     var response = await Dio().get('https://api.imgflip.com/get_memes');
//     var memes = response.data['data']['memes'];
//     print(memes[89]['url']);
//   }

//   @override
//   Widget build(BuildContext context) {
//     tt();
//     return MaterialApp(
//       title: 'memeDrop',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('memeDrop'),
//         ),
//         body: Image.network(
//           'https://i.imgflip.com/ljk.jpg',
//         ),
//       ),
//     );
//   }
// }
