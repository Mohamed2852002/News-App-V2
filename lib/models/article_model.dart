class ArticleModel {
  final String? title;
  final String? source;
  final String? image;
  final String? siteUrl;
  final String? date;

  ArticleModel({
    required this.title,
    required this.source,
    required this.image,
    required this.date,
    required this.siteUrl,
  });

  factory ArticleModel.fromJson(json, int index) {
    return ArticleModel(
      title: json["articles"][index]["title"],
      source: json["articles"][index]["source"]["name"],
      image: json["articles"][index]["urlToImage"],
      date: json["articles"][index]["publishedAt"],
      siteUrl: json["articles"][index]["url"],
    );
  }
}
