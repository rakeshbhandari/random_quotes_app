class JokeModel {
  JokeModel({
    required this.content,
    required this.author,
  });

  factory JokeModel.fromJson(Map<String, dynamic> json) =>
      JokeModel(content: json['content'], author: json['author']);

  final String content;
  final String author;
}
