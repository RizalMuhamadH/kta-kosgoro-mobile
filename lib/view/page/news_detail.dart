import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kta/config/constant.dart';
import 'package:kta/controller/news_controller.dart';

class NewsDetail extends GetView<NewsController> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: size.height * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        "$STORAGE_NEWS/${controller.data.value.id}/${controller.data.value.thumbnail}"),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.45),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      controller.data.value.title ?? "",
                      style: const TextStyle(fontSize: 20, height: 1.5),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Row(
                    //   children: <Widget>[
                    //     Container(
                    //       width: 40,
                    //       height: 40,
                    //       decoration: BoxDecoration(
                    //           shape: BoxShape.circle,
                    //           image: DecorationImage(
                    //               image: NetworkImage(
                    //                   "$STORAGE_NEWS/${controller.data.value.id}/${controller.data.value.thumbnail}"),
                    //               fit: BoxFit.cover)),
                    //     ),
                    //     const SizedBox(
                    //       width: 20,
                    //     ),
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: <Widget>[
                    //         Text(
                    //           controller.data.value.author!.name ?? "",
                    //           style: const TextStyle(
                    //               fontSize: 16, fontWeight: FontWeight.bold),
                    //         ),
                    //         const SizedBox(
                    //           height: 3,
                    //         ),
                    //         // const Text(
                    //         //   "Interior Design",
                    //         //   style: TextStyle(fontSize: 13),
                    //         // )
                    //       ],
                    //     )
                    //   ],
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Row(
                    //   children: <Widget>[
                    //     Container(
                    //       decoration: BoxDecoration(
                    //           border: Border.all(color: Colors.grey),
                    //           borderRadius: BorderRadius.circular(3)),
                    //       child: Padding(
                    //         padding: const EdgeInsets.all(6.0),
                    //         child: Text("Interior"),
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 20,
                    //     ),
                    //     Container(
                    //       decoration: BoxDecoration(
                    //           border: Border.all(color: Colors.grey),
                    //           borderRadius: BorderRadius.circular(3)),
                    //       child: Padding(
                    //         padding: const EdgeInsets.all(6.0),
                    //         child: Text("40m2"),
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 20,
                    //     ),
                    //     Container(
                    //       decoration: BoxDecoration(
                    //           border: Border.all(color: Colors.grey),
                    //           borderRadius: BorderRadius.circular(3)),
                    //       child: Padding(
                    //         padding: const EdgeInsets.all(6.0),
                    //         child: Text("Ideas"),
                    //       ),
                    //     )
                    //   ],
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    HtmlWidget(controller.data.value.body ?? ""),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // Text(
                    //   "Gallery",
                    //   style: TextStyle(fontSize: 18),
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //     children: <Widget>[
                    //       Padding(
                    //         padding: const EdgeInsets.only(right: 20),
                    //         child: Container(
                    //           width: 150,
                    //           height: 150,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(10),
                    //               image: DecorationImage(
                    //                   image: AssetImage(
                    //                       "assets/images/image_2.png"),
                    //                   fit: BoxFit.cover)),
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.only(right: 20),
                    //         child: Container(
                    //           width: 150,
                    //           height: 150,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(10),
                    //               image: DecorationImage(
                    //                   image: AssetImage(
                    //                       "assets/images/image_3.png"),
                    //                   fit: BoxFit.cover)),
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.only(right: 20),
                    //         child: Container(
                    //           width: 150,
                    //           height: 150,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(10),
                    //               image: DecorationImage(
                    //                   image: AssetImage(
                    //                       "assets/images/image_4.png"),
                    //                   fit: BoxFit.cover)),
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
