class NewsModel {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;
  final NewsSource source;

  NewsModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.source,
  });

  factory NewsModel.fromMap(Map<String, dynamic> json) {
    final source = NewsSource.fromMap(json["source"]);

    return NewsModel(
      author: json["author"] ?? "null",
      title: json["title"],
      description: json["description"],
      url: json["url"] ?? "",
      urlToImage: json["urlToImage"] ??
          "https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg",
      publishedAt: DateTime.parse(json["publishedAt"]),
      content: json["content"],
      source: source,
    );
  }
}

class NewsSource {
  final String id;
  final String name;

  NewsSource({
    required this.id,
    required this.name,
  });

  factory NewsSource.fromMap(Map<String, dynamic> json) => NewsSource(
    id: json["id"] ?? "null",
    name: json["name"],
  );
}