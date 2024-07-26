class NewsModel {
  String? name;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  NewsModel({
    required this.name,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        name: json['source']["name"] ?? "",
        author: json["author"] ?? "",
        title: json['title'] ?? "",
        description: json['description'] ?? "",
        url: json["url"] ?? "",
        urlToImage: json['urlToImage'] ??
            "https://img.freepik.com/free-vector/couple-drawing-conversation-cartoon-style-illustration_1150-37533.jpg?t=st=1721889439~exp=1721893039~hmac=6b019d3cc472a495973fb96bc2d0848b8b4bd9ec55852b6850c8128720063e92&w=740",
        publishedAt: json["publishedAt"] ?? " ",
        content: json["content"] ?? " ",
      );
}
