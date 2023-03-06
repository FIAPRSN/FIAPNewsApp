import 'package:fiap_newsapp/models/news.dart';
import 'package:fiap_newsapp/service/news_service.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {

  RxList<News> news = <News> [].obs;
  RxBool isLoading = true.obs;
  
  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  Future<void> fetchNews() async {
    try {
      isLoading(true);
      final dataNews = await NewsService.fetchNews();
      if (dataNews != null) {
        news(dataNews);
      }
    } finally {
      isLoading(false);
    }
  }
}
