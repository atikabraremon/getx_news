import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_news/Controller/news_controller.dart';
import 'package:getx_news/View/Widget/category_widget.dart';
import 'package:getx_news/View/Widget/home_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(NewsController());
  final box = GetStorage();
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPod) async {
        if (didPod) {
          return;
        }
        return await Get.dialog(
          AlertDialog(
            title: const Text("Closing The app"),
            content: const Text("Are you sure to close the app?"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: const Text("Close"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("Cancel"),
              ),
            ],
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "NEWS APP",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          actions: [
            IconButton(
              onPressed: () => controller.changeThemeMode(),
              icon: box.read("theme") == "dark"
                  ? const Icon(Icons.dark_mode)
                  : const Icon(Icons.light_mode),
            ),
          ],
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: (index) =>
              controller.changeNavBar(currentIndex: index),
          children: const [
            HomeWidget(),
            CategoryWidget(),
          ],
        ),
        bottomNavigationBar: GetBuilder<NewsController>(
          builder: (controller) => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.index,
            onTap: (index) {
              controller.changeNavBar(currentIndex: index);
              pageController.jumpToPage(index);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_max_outlined),
                  activeIcon: Icon(Icons.home),
                  label: "Home",
                  tooltip: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category_outlined),
                  activeIcon: Icon(Icons.category),
                  label: "Category",
                  tooltip: "Category"),
            ],
          ),
        ),
      ),
    );
  }
}
