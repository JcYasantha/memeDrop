import 'package:flutter/material.dart';
import 'package:meme_drop/services/screenArguments.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    // return Container(
    //   child: Text(args.memes[0]),
    // );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black87,
        title: Text("Select a meme template"),
      ),
      body: Container(
        color: Colors.black54,
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: args.memes.length,
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              args.memes[index]['url'],
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
    // return ListView.separated(
    //   padding: const EdgeInsets.all(8),
    //   itemCount: args.memes.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return Image.network(
    //       args.memes[index]['url'],
    //     );
    //   },
    //   separatorBuilder: (BuildContext context, int index) => const Divider(),
    // );
  }
}
