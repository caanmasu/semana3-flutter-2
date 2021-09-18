import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:semana3noticias/models/articles.model.dart';

class ArticleProvider{

  Future<List<Article>> getArticles() async {

    List<Article> listArticles = [];

    Map<String, String> parameters = {
      'q': 'tesla',
      'from': '2021-09-17',
      'sortBy': 'publishedAt',
      'apiKey': '582aaf867cf34c05a2d8b9b3b726fd04',
      };

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(Uri.https('newsapi.org', '/v2/everything', parameters));
    if (response.statusCode == 200)
      convert.jsonDecode(response.body)["articles"].forEach((item) => listArticles.add(Article.fromJson(item)));

    return listArticles;
  }
}