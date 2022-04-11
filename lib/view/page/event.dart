import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kta/config/constant.dart';
import 'package:kta/controller/event_controller.dart';
import 'package:kta/model/event.dart';
import 'package:kta/route/route_name.dart';

class EventPage extends GetView<EventController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        title: const Text('Event',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
      ),
      body: Obx((() => controller.events.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: controller.events.length,
              itemBuilder: (context, index) {
                return item(context, controller.events[index]);
              },
            ))),
    );
  }

  String getTruncatedTitle(String actualString, int maxLetters) {
    return actualString.length > maxLetters
        ? actualString.substring(0, maxLetters) + "..."
        : actualString;
  }

  item(context, Data event) => GestureDetector(
        onTap: () {
          controller.data.value = event;
          Get.toNamed(Routes.eventDetail);
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
                        "$STORAGE_EVENT/${event.id}/${event.thumbnail}"),
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
                        event.title ?? "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Color(0xFF1C1C1C),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      // Text("timeAgo(event.createdAt, DateTime.now())",
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
