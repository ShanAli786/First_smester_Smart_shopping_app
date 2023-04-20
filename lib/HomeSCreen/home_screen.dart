// ignore_for_file: avoid_unnecessary_containers, unnecessary_string_escapes, duplicate_ignore, prefer_const_constructors_in_immutables, library_private_types_in_public_api

import 'package:emart_app/HomeSCreen/components/featured_button.dart';
import 'package:emart_app/HomeSCreen/speech_to_text.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgets_common/home_buttons.dart';
import 'package:flutter/material.dart';

import '../consts/list.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
//import 'package:your_app/services/speech_recognition_service.dart';

//import '../services/Speech_RecognitionService.dart';
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 
  @override
  Widget build(BuildContext context) {
    //================================App Bar=========================================================================================

    //=================================================================================================================================
   // const Divider();
    return Scaffold(
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
         backgroundColor: const Color.fromARGB(255, 240, 41, 41),
         //Color.fromARGB(255, 238, 236, 231),
        title: const Text("Smart Shopping", style: TextStyle(color: Color.fromARGB(255, 245, 238, 238),fontFamily: bold,)),
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 228, 215, 215)),
        //leading: Image.asset("your_image_asset"),
        actions: <Widget>[
         // IconButton(icon: const Icon(Icons.search, color: Color.fromARGB(255, 238, 230, 230),), onPressed: () { }),
    IconButton(icon: const Icon(Icons.mic, color: Color.fromARGB(255, 243, 237, 237),), onPressed: () {
        TextToSpeech tts = TextToSpeech();
    tts.speak("Hello, world!");

     } ),
   
           IconButton(icon: const Icon(Icons.camera_alt_outlined, color: Color.fromARGB(255, 236, 233, 233),), onPressed: () {}),
    
         ],
      ),
      
      body: Column(
          
          children: [
            Container(
              height: 60,
              width: double.infinity,
              color: lightGrey,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: whiteColor,
                  hintText: searchanything,
                  hintStyle: TextStyle(color: textfieldGrey),
                ),
              ),
            ).box.margin(const EdgeInsets.only(top: 20)).make(),
          
            10.heightBox,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        height: 150,
                        enlargeCenterPage: true,
                        itemCount: slidersList.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            slidersList[index],
                            //fit: BoxFit.fitWidth,
                          )
                              .box
                              .rounded
                              .height(650)
                              .clip(Clip.antiAlias)
                              .margin(const EdgeInsets.symmetric(horizontal: 8))
                              .make();
                        }),
                    10.heightBox,
                    //deals Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          2,
                          (index) => homeButtons(
                                height: context.screenHeight * 0.12,
                                width: context.screenWidth / 2.5,
                                icon: index == 0 ? icTodaysDeal : icFlashDeal,
                                title: index == 0 ? todayDeal : flashsale,
                              )),
                    ),
                    10.heightBox,
                    // VxSwiper.builder(
                    //     aspectRatio: 16 / 9,
                    //     autoPlay: true,
                    //     height: 150,
                    //     enlargeCenterPage: true,
                    //     itemCount: secondSlidersList.length,
                    //     itemBuilder: (context, index) {
                    //       return Image.asset(
                    //         secondSlidersList[index],
                    //         fit: BoxFit.fitWidth,
                    //       )
                    //           .box
                    //           .rounded
                    //           .clip(Clip.antiAlias)
                    //           .margin(const EdgeInsets.symmetric(horizontal: 8))
                    //           .make();
                    //     }),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          3,
                          (index) => homeButtons(
                                height: context.screenHeight * 0.12,
                                width: context.screenWidth / 3.4,
                                icon: index == 0
                                    ? icTopCategories
                                    : index == 1
                                        ? icBrands
                                        : icTopSeller,
                                title: index == 0
                                    ? topCategories
                                    : index == 1
                                        ? brand
                                        : topsellers,
                              )),
                    ),
                    //**********************Featured Cateogries */
                    20.heightBox,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: featuredcategories.text
                          .color(darkFontGrey)
                          .size(20)
                          .fontFamily(semibold)
                          .make(),
                    ),
                    20.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            3,
                            (index) => Column(
                                  children: [
                                    featuredButton(
                                        icon: featuredImages1[index],
                                        title: featuredTitle1[index]),
                                    10.heightBox,
                                    featuredButton(
                                        icon: featuredImages2[index],
                                        title: featuredTitle2[index]),
                                  ],
                                )),
                      ),
                    ),

                    //**************************Featured Products */

                    20.heightBox,
                    Container(
                      padding: const EdgeInsets.all(12),
                      width: double.infinity,
                      decoration:
                          const BoxDecoration(color: Color.fromARGB(255, 240, 41, 41),),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          featuredproducts.text.white
                              .fontFamily(bold)
                              .size(20)
                              .make(),
                          10.heightBox,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                  6,
                                  (index) => Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            imgFc7,
                                            width: 150,
                                            fit: BoxFit.cover,
                                          ),
                                          10.heightBox,
                                          "Women Dresses"
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
                                          .margin(const EdgeInsets.symmetric(
                                              horizontal: 4))
                                          .padding(const EdgeInsets.all(8))
                                          .rounded
                                          .make()),
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.heightBox,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Allproducts.text
                          .color(Colors.black)
                          .size(20)
                          .fontFamily(semibold)
                          .make(),
                    ),
                    0.heightBox,
                    GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                mainAxisExtent: 300),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                imgS1,
                                width: 190,
                                fit: BoxFit.cover,
                              ),
                              const Spacer(),
                              10.heightBox,
                              "T-shirt"
                                  .text
                                  .fontFamily(semibold)
                                  .color(darkFontGrey)
                                  .make(),
                              10.heightBox,
                              // ignore: unnecessary_string_escapes
                              "\Brand t-shirts with glamrous look \n"
                              "\Pkr: 500"
                                  .text
                                  .color(const Color.fromARGB(255, 15, 19, 20))
                                  .fontFamily(semibold)
                                  .size(16)
                                  .make(),
                            ],
                          )
                              .box
                              .white
                              .margin(const EdgeInsets.symmetric(horizontal: 4))
                              .padding(const EdgeInsets.all(12))
                              .rounded
                              .make();
                        })
                  ],//children
                ),
              ),
            ),
          ]

    ));
  }

}