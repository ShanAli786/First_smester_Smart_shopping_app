// ignore_for_file: implementation_imports, camel_case_types, avoid_unnecessary_containers, depend_on_referenced_packages

//import 'package:emart_app/consts/consts.dart';
//import 'package:flutter/material.dart';
// ignore: unnecessary_import
//import 'package:flutter/src/widgets/framework.dart';
// ignore: unused_import
import 'package:emart_app/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/list.dart';
import 'category_details.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
//import 'package:flutter_application_2/Consts/lists.dart';
//import 'package:emart_app/views/widgets_common/bg_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {

   return Container(
    color: Colors.blueAccent,
      child: Scaffold(
        appBar: AppBar(
        
      backgroundColor: const Color.fromARGB(255, 139, 132, 235),
         //Color.fromARGB(255, 238, 236, 231),
        title: const Text("Smart Shopping", style: TextStyle(color: Colors.black,)),
        iconTheme: const IconThemeData(color: Colors.black),
        //leading: Image.asset("your_image_asset"),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.search, color: Colors.black,), onPressed: () {}),
    IconButton(icon: const Icon(Icons.mic, color: Colors.black,), onPressed: () {}),
           IconButton(icon: const Icon(Icons.camera_alt_outlined, color: Colors.black,), onPressed: () {}),
    
         ],
      ),
        body: Container(
          //physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(12),          
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 3,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, mainAxisSpacing: 8, crossAxisSpacing: 8, mainAxisExtent: 200),
             itemBuilder: (context,index){
              return Column(
                
                children: [
                  Image.asset(categoryImages[index], height: 150, width: 350, fit: BoxFit.cover),
                  10.heightBox,
                  // ignore: unnecessary_string_interpolations
                  "${categoriesList[index]}".text.color(darkFontGrey).align(TextAlign.center).make(), 
                  
                ],
              ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make().onTap(() { 
      Get.to(()=>CategoryDetails(title: categoriesList[index]));
    });
          }),
                    
        )
      )
   );
  }
}