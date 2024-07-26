import 'package:flutter/material.dart';

import '../../Model/news_model.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.list});

  final List<NewsModel> list;

  @override
  Widget build(BuildContext context) {
    return list.isNotEmpty
        ? ListView.builder(
            itemCount: list.length - 1,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: NetworkImage(
                    list[index].urlToImage.toString(),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Text(
                  list[index].title.toString(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
              // child: const Center(child: Text("Category Widget")),
            ),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
