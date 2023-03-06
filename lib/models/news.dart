import 'dart:convert';

List<News> newsJson(String str) => List<News>.from(
      json.decode(str)['articles'].map(
            (x) => News.fromJson(Map<String, dynamic>.from(x)),
          ),
    );

class News {
  News({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  News.fromJson(Map<String, dynamic> json) {
    author = json['author'].toString();
    title = json['title'].toString();
    description = json['description'].toString();
    url = json['url'].toString();
    urlToImage = json['urlToImage'].toString();
    publishedAt = json['publishedAt'].toString();
    content = json['content'].toString();
  }

  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}
