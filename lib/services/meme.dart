class Meme {
  final String url;

  Meme({this.url});

  factory Meme.fromJson(Map<String, dynamic> json) {
    return Meme(url: json['url']);
  }
}
