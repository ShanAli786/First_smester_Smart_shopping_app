// ignore: duplicate_ignore
// ignore_for_file: unused_import, duplicate_ignore, depend_on_referenced_packages

import 'package:emart_app/consts/list.dart';
import 'package:emart_app/views/catogary_screen/item_details.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports, unnecessary_import
import 'package:flutter/src/widgets/framework.dart';
// ignore: unused_import, implementation_imports
import 'package:flutter/src/widgets/placeholder.dart';
// ignore: unused_import
import 'package:emart_app/consts/consts.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var controller = Get.find<ProductController>();
    // ignore: avoid_unnecessary_containers
    var controller;
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          //Color.fromARGB(255, 238, 236, 231),
          title: const Text("Smart Shopping",
              style: TextStyle(
                  color: Color.fromARGB(255, 240, 235, 235), fontFamily: bold)),
          iconTheme:
              const IconThemeData(color: Color.fromARGB(255, 238, 231, 231)),
          //leading: Image.asset("your_image_asset"),
          actions: <Widget>[
            IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 245, 242, 242),
                ),
                onPressed: () {}),
            IconButton(
                icon: const Icon(
                  Icons.mic,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                onPressed: () {}),
            IconButton(
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  color: Color.fromARGB(255, 255, 253, 253),
                ),
                onPressed: () {}),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      6,
                      (index) =>"${controller.subcat[index]}"
                          .text
                          .fontFamily(bold)
                          .color(darkFontGrey)
                          .makeCentered()
                          .box
                          .white
                          .rounded
                          .size(150, 60)
                          .margin(const EdgeInsets.symmetric(horizontal: 4))
                          .make()),
                ),
              ),
              //=========================Items container=====================
              20.heightBox,
              //backgroundColor(Colors.blueAccent),
              Expanded(
                  child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 8,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 250,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              imgFc1,
                              width: 190,
                              fit: BoxFit.cover,
                            ),
                            //                              const Spacer(),
                            10.heightBox,
                            "T-shirt"
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                            10.heightBox,
                            "\$500"
                                .text
                                .color(redColor)
                                .fontFamily(semibold)
                                .size(16)
                                .make(),
                          ],
                        )
                            .box
                            .white
                            .margin(const EdgeInsets.symmetric(horizontal: 4))
                            .padding(const EdgeInsets.all(12))
                            .roundedSM
                            .outerShadow
                            .make()
                            .onTap(() {
                          Get.to(() => const ItemDetails(title: "Dummy Item"));
                        });
                      }))
            ],
          ),
        ),
        //bottomNavigationBar: Footer(),
      ),
    );
  }
}
