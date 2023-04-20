// ignore_for_file: unnecessary_import, non_constant_identifier_names, unused_import, avoid_types_as_parameter_names, unnecessary_string_escapes, prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, depend_on_referenced_packages

import 'package:emart_app/consts/colors.dart';
import 'package:emart_app/consts/list.dart';
import 'package:emart_app/consts/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../consts/consts.dart';
import '../../widgets_common/home_buttons.dart';
//import '../../consts/styles.dart';
//import 'package:flutter/src/widgets/container.dart';
//import 'package:flutter/src/widgets/framework.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({Key? key, required this.title}) : super(key: key);


  @override
  // ignore: duplicate_ignore
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(

        //backgroundColor: const Color.fromARGB(255, 244, 245, 247),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: darkFontGrey),
        title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.share), color: Colors.black,),
        IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_outline),color: Colors.black,),
        ],
        
      ),

      body: Column(
       
        children: [
          Expanded(child: Padding(padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //swiper section

                  VxSwiper.builder(
                    autoPlay: true,
                    height: 350,
                    aspectRatio: 16/9,
                    itemCount: 4, itemBuilder: (context,index){
                    return Image.asset(imgFc1, width: double.infinity, fit: BoxFit.cover,);
                  }),
                  //===============Title and Details section======================
                  10.heightBox,
                  title!.text.size(18).fontFamily(bold).color(darkFontGrey).make(),
                  10.heightBox,
                  //================Rating and reviews=======================

                  VxRating(onRatingUpdate: (Value){},
                  normalColor: textfieldGrey,
                  selectionColor: golden,
                  maxRating: 5,
                  count: 5,
                  size: 25,
                  ),
                  10.heightBox,
                  "\Pkr: 15000".text.color(darkFontGrey).size(16).fontFamily(bold).make(),
                  10.heightBox,
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Seller".text.white.fontFamily(semibold).make(),
                            5.heightBox,
                            "In House Brands".text.fontFamily(semibold).make(),
                          ],
                        )),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.message_rounded, color: darkFontGrey,),  
                      ),
                    ],
                  ).box.height(60).padding(const EdgeInsets.symmetric(horizontal: 10)) .color(textfieldGrey).make(),
                //====================Color Section =========================================
                20.heightBox,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Color".text.color(darkFontGrey).make(),
                        ),
                        Row(
                          children: List.generate(3, (index) => VxBox().size(30, 30).roundedFull.color(Vx.randomPrimaryColor).margin(const EdgeInsets.symmetric(horizontal: 6)).make()),
                        ),
                      ],
                    ).box.shadowMd.white.padding(const EdgeInsets.all(12)).make(),

                    //Quantity Section ========================================
                    Row(
                     
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Quantity".text.color(darkFontGrey).make(),
                        ),
                        Row(
                          //children: List.generate(3, (index) => VxBox().size(30, 30).roundedFull.color(Vx.randomPrimaryColor).margin(const EdgeInsets.symmetric(horizontal: 6)).make()),
                        children: [
                          IconButton(onPressed: (){}, icon: const Icon(Icons.remove_circle)),
                          "0".text.fontFamily(bold).color(darkFontGrey).make(),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.add_circle)),
                          10.heightBox,

                          "(0 Available)".text.color(redColor).make(),

                        ],
                        ),
                      ],
                   ).box.white.shadowMd.padding(const EdgeInsets.all(12)).make(),
                   //===================================total Row==================================
                  
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Total".text.color(darkFontGrey).make(),
                        ),
                        Row(
                          //children: List.generate(3, (index) => VxBox().size(30, 30).roundedFull.color(Vx.randomPrimaryColor).margin(const EdgeInsets.symmetric(horizontal: 6)).make()),
                        children: [
                          "\pkr: 0.00".text.color(redColor).make(),
                        ],
                        ),
                      ],
                   ).box.white.shadowMd.padding(const EdgeInsets.all(12)).make(),
                  
                ],
              ),
              10.heightBox,
          "description".text.color(darkFontGrey).size(18).fontFamily(bold).make(),
          10.heightBox,
          "Sunaina Textile Unstitched Malai 3 Piece \nwith Net Stole for Girls/Women-116".text.color(darkFontGrey).make(),

          //========================Buttons Section ==================================================================
            10.heightBox,
           ListView(
           
            shrinkWrap: true,
            children: 
              List.generate(ItemDetailsButtonsList.length, (index) =>  ListTile(
                title: ItemDetailsButtonsList[index].text.bold.make(),
                trailing: const Icon(Icons.arrow_forward),

              ),
              ),
            
          ).box.shadowSm.white.padding(const EdgeInsets.all(12)).make(),
          10.heightBox,
//*********************************Add to cart button**************************************************************************
   
//    ElevatedButton.icon(
//   onPressed: () {},
//   icon: Icon( // <-- Icon
//     Icons.shopping_cart_checkout,
//     size: 24.0,
//   ),
//   label: Text('Download'), // <-- Text
// ).box.shadowSm.white.padding(const EdgeInsets.all(22)).make(),
            SizedBox.fromSize(
  size: Size(150, 50),
    
    child: Material(
      color: Color.fromRGBO(210, 228, 6, 1),
      child: InkWell(
        splashColor: Colors.green, 
        onTap: () {}, 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.shopping_cart), // <-- Icon
            Text("Add to cart"), // <-- Text
          ],
        ),
      ),
    ),
  ).box.rounded.padding(const EdgeInsets.symmetric(horizontal: 14)).make(),
    
   ],
          
        ),
          )
          ),
      ),
      const SizedBox(
        
      ),
      
      ],
      ),


    );
  }
}