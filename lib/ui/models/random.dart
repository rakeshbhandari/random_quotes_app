class Random {
  Random({
    required this.content,
    required this.author,
  });

  factory Random.fromJson(Map<String, dynamic> json) =>
      Random(content: json['content'], author: json['author']);

  final String content;
  final String author;
}
