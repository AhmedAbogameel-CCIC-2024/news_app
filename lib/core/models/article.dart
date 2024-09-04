class Article {
  final String? image;
  final String title;
  final String? author;
  final String publishedAt;
  final String? description;
  final String? content;
  final String? source;
  final String url;

  Article({
    required this.image,
    required this.title,
    required this.author,
    required this.publishedAt,
    required this.description,
    required this.content,
    required this.source,
    required this.url,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      image: json['urlToImage'],
      title: json['title'],
      author: json['author'],
      publishedAt: json['publishedAt'],
      content: json['content'],
      description: json['description'],
      source: json['source']?['name'],
      url: json['url'],
    );
  }
}
