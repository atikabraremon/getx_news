import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news/Controller/news_controller.dart';
import 'package:getx_news/Model/news_model.dart';
import 'package:getx_news/View/Widget/list_item.dart';
import 'package:getx_news/shared/constant.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget>
    with SingleTickerProviderStateMixin {
  late TabController? controller;
  final newsController = Get.put(NewsController());

  @override
  void initState() {
    controller =
        TabController(length: CategoryList.categoryItem.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          isScrollable: true,
          controller: controller,
          tabs: CategoryList.categoryItem.map((e) {
            return Text(e.toUpperCase());
          }).toList(),
        ),
        Expanded(
          child: TabBarView(
              controller: controller,
              children: CategoryList.categoryItem.map(
                (e) {
                  return FutureBuilder(
                    future: newsController.getCategory(category: e),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListItem(list: snapshot.data as List<NewsModel>);
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  );
                },
              ).toList()),
        )
      ],
    );
  }
}
