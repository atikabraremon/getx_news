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
      author: json["author"] ?? "Author null",
      title: json["title"] ?? "null Title",
      description: json["description"] ?? "null Description",
      url: json["url"] ?? "null url",
      urlToImage: json["urlToImage"] ??
          "https://img.freepik.com/free-vector/flat-design-image-upload-concept_23-2148296955.jpg?t=st=1722154651~exp=1722158251~hmac=7f66e344bfaa96614d928d1f7d383663dac0840f3db7f01857ed16c6f6d415f6&w=740",
      publishedAt: DateTime.parse(json["publishedAt"]),
      content: json["content"] ?? 'null Content',
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
    id: json["id"] ?? "null ID",
    name: json["name"] ?? "null Name",
  );
}