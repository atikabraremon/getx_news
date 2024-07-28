import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_news/Controller/api_helper.dart';
import '../Model/news_model.dart';

class NewsController extends GetxController {
  final box = GetStorage();
  int index = 0;

  void changeThemeMode() {
    String? theme = box.read("theme");
    if (theme == null || theme == "dark") {
      Get.changeThemeMode(ThemeMode.light);
      box.write("theme", "light");
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      box.write("theme", "dark");
    }
    update();
  }

  void changeNavBar({required int currentIndex}) {
    index = currentIndex;
    update();
  }

  NewsHelper newsHelper = NewsHelper();

  List<NewsModel> newsData = [];

  void getHeadlines() async {
    newsData = await newsHelper.getHeadlines();
    update();
  }

  @override
  void onInit() {
    getHeadlines();
    super.onInit();
  }
}
