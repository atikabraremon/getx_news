import 'package:get/get.dart';
import 'package:getx_news/Model/news_model.dart';

class NewsHelper extends GetConnect implements GetxService {
  Future<List<NewsModel>> getHeadlines() async {
    List<NewsModel> newsData = [];
    String baseUrl =
        "https://newsapi.org/v2/everything?q=tesla&from=2024-06-28&sortBy=publishedAt&apiKey=";
    String apiKey = "6a64088a10354809a8d52962ab69d263";
    var response = await get(baseUrl + apiKey);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.body;
      final result = data["articles"] as List<dynamic>;
      newsData = result.map((e) {
        return NewsModel.fromMap(e);
      }).toList();
    }
    return newsData;
  }

  Future<List<NewsModel>> getNewsCategory({required String category}) async {
    List<NewsModel> newsData = [];
    String baseUrl =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=";
    String apiKey = "6a64088a10354809a8d52962ab69d263";
    var response = await get(baseUrl + apiKey);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.body;
      final result = data["articles"] as List<dynamic>;
      newsData = result.map((e) {
        return NewsModel.fromMap(e);
      }).toList();
    }
    return newsData;
  }
}
