import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kta/config/constant.dart';
import 'package:kta/controller/news_controller.dart';
import 'package:kta/model/news.dart';
import 'package:kta/route/route_name.dart';

class NewsPage extends GetView<NewsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        title: const Text('News',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
      ),
      body: Obx((() => controller.news.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: controller.news.length,
              itemBuilder: (context, index) {
                return item(context, controller.news[index]);
              },
            ))),
    );
  }

  String getTruncatedTitle(String actualString, int maxLetters) {
    return actualString.length > maxLetters
        ? actualString.substring(0, maxLetters) + "..."
        : actualString;
  }

  item(context, Data news) => GestureDetector(
        onTap: () {
          controller.data.value = news;
          Get.toNamed(Routes.newsDetail);
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 120,
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Row(
            children: [
              Container(
                width: 100.0,
                height: 135.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "$STORAGE_NEWS/${news.id}/${news.thumbnail}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news.title ?? "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Color(0xFF1C1C1C),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      // Text("timeAgo(news.createdAt, DateTime.now())",
                      //     style: const TextStyle(
                      //       fontSize: 14.0,
                      //       color: Color(0xFF6D6D6D),
                      //     )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
