// ignore_for_file: unnecessary_import, implementation_imports, unused_local_variable, non_constant_identifier_names, avoid_types_as_parameter_names, unused_import, depend_on_referenced_packages

import 'package:emart_app/HomeSCreen/home_screen.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/homecontroller.dart';
import 'package:emart_app/views/Account/profile_screen.dart';
import 'package:emart_app/views/Cart/cart_screen.dart';
import 'package:emart_app/views/catogary_screen/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(Homecontroller());

    var navbarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(
            icHome,
            width: 26,
          ),
          label: home),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCategories,
            width: 26,
          ),
          label: Categories),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCart,
            width: 26,
          ),
          label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(
            icProfile,
            width: 26,
          ),
          label: account),
    ];

    var navBody = [
         HomeScreen(cameras: const [],),
      const CategoryScreen(),
      const CartScreen(),
      const ProfileScreen(),
      

    ];
    
    return Scaffold(
      body: Column(
        children: [
          Obx(()=> Expanded(child: navBody.elementAt(controller.currentNavIndex.value))),
        ],
      ),
      bottomNavigationBar: Obx(
        ()=> BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: redColor,
          selectedLabelStyle: const TextStyle(fontFamily: semibold),
        backgroundColor: whiteColor,
        type: BottomNavigationBarType.fixed,
          items: navbarItem,
          onTap: (Value){
            controller.currentNavIndex.value = Value;
          },
        ),
      ),
    );
  }
}
//comment