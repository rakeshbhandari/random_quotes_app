class RandomData {
  RandomData({
    required this.content,
    required this.author,
  });

  factory RandomData.fromJson(Map<String, dynamic> json) =>
      RandomData(content: json['content'], author: json['author']);

  final String content;
  final String author;
}
