//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/list.dart';
import 'package:emart_app/controllers/auth_controller.dart';
import 'package:emart_app/controllers/profile_controller.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:emart_app/views/Account/Components/details_card.dart';
import 'package:emart_app/views/Account/edit_profilescreen.dart';
import 'package:emart_app/views/Auth_Screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
//import 'package:emart_app/widgets_common/bg_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
  
    return Container(
      color: const Color.fromARGB(255, 230, 206, 206),
      child: Scaffold(   
        body: StreamBuilder(
            stream: FirestoreServices.getUser(currentUser?.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  
              if (!snapshot.hasData) {

                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                  ), // CircularProgressIndicator
                ); // Center
              } else {
                // ignore: prefer_typing_uninitialized_variables
                var data = snapshot.data!.docs[0];
               
                return SafeArea(
                    child: Container(
                 // padding: const EdgeInsets.only(top: (30)),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //================================Edit Profile Button

                      //20.heightBox,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: profile.text
                              .color(darkFontGrey)
                              .size(25)
                              .fontFamily(semibold)
                              .make(),
                        ),
                      ),

                      20.heightBox,
                      //User Details Section
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            data ['imageUrl'] == ''?
                            Image.asset(
                              imgProfile2,
                              width: 120,
                              fit: BoxFit.cover,
                            ).box.roundedFull.clip(Clip.antiAlias).make()
                            :Image.network(data['imageUrl'],width: 100,fit: BoxFit.cover,),
                            10.widthBox,
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 "${data['name']}".text.fontFamily(semibold).black.make(),
                      
                                 "${data['email']}".text.black.make(),
                                    
                              ],
                                )),
                                const Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(Icons.settings),
                                )
                                    .onTap(() {
                                      controller.nameController.text = data['name'];
                                       //controller.newpassController.text = data['password'];
                                      // Get.to(() => EditProfileScreen(data: data,));
                                       Get.to(() =>  EditProfileScreen(data: data));
                      
                                    })
                                    .box
                                    .margin(const EdgeInsets.symmetric(
                                        horizontal: 10))
                                    .make(),
                              
                            
                            // OutlinedButton(
                            //     style: OutlinedButton.styleFrom(
                            //       side: const BorderSide(color: Colors.black),
                            //     ),
                            //     onPressed: (() {}),
                            //     child: "Logout".text.fontFamily(semibold).black.make()),
                           ],
                         ),
                      ),
                    
                      
                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          detailsCard(
                              //count: "0",
                              title: data['cart_count'],
                              //title: "cart_count",
                              width: context.screenWidth / 1.1),
                        ],
                      ),
                      //Buttons section

                      40.heightBox,
                      ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return const Divider(
                            color: lightGrey,
                          );
                        },
                        itemCount: profileButtonsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Image.asset(
                              profileButtonsIcons[index],
                              width: 22,
                            ),
                            title: profileButtonsList[index]
                                .text
                                .color(darkFontGrey)
                                .fontFamily(semibold)
                                .make(),
                          );
                        },
                      )
                          .box
                          .gray100
                          .rounded
                          .padding(const EdgeInsets.symmetric(horizontal: 16))
                          .shadowSm
                          .make(),
                      FloatingActionButton.extended(
                        label: const Text('Logout'), // <-- Text
                        backgroundColor: const Color.fromARGB(255, 40, 35, 15),
                        icon: const Icon(
                          // <-- Icon
                          Icons.logout_outlined,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          await Get.put(AuthController())
                              .signOutMethod(context);
                          Get.offAll(() => const LoginScreen());
                        },
                      )
                          .box
                          .margin(const EdgeInsets.symmetric(vertical: 80))
                          .make(),
               ], ),
                 ),
                 
             );
        }
   },
    ),
    )
 
 
 );
 }
}




