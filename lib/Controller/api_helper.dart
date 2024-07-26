import 'package:get/get.dart';
import 'package:getx_news/Model/news_model.dart';

class NewsHelper extends GetConnect implements GetxService {
  Future<List<NewsModel>> getHeadLine() async {
    Response response = await get(
        "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=6a64088a10354809a8d52962ab69d263");

    List data = response.body["articles"];
    List<NewsModel> newsModel = data.map((e) => NewsModel.fromJson(e)).toList();

    return newsModel;
  }
}
