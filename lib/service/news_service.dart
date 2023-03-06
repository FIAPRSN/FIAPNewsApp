import 'package:fiap_newsapp/models/news.dart';
import 'package:fiap_newsapp/utils/utils.dart';
import 'package:http/http.dart' as http;

class NewsService {

  static http.Client client = http.Client();

  static Future<List<News>?> fetchNews() async {

    final response = await client.get(Uri.parse(Utils.newsPage));

    if(response.statusCode == 200) {
      return newsJson(response.body);
    } else {
      return null;
    }
  }
}
