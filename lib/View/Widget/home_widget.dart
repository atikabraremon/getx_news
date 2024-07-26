import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news/Controller/news_controller.dart';
import 'package:getx_news/View/Widget/list_item.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NewsController(),
      builder: (controller) => ListItem(list: controller.newsList,),
    );
  }
}
