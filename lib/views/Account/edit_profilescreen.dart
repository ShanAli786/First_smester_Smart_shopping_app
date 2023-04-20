import 'dart:io';

import 'package:emart_app/controllers/profile_controller.dart';
import 'package:emart_app/widgets_common/custom_textfield.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';

class EditProfileScreen extends StatelessWidget {

final dynamic data;


  const EditProfileScreen({Key? key, this.data}):super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    controller.nameController.text = data['name'];
    controller.newpassController.text = data['password'];
    
        return Scaffold(
      //backgroundColor: whiteColor,
      appBar: AppBar(
         backgroundColor: const Color.fromARGB(255, 240, 41, 41),
       //Color.fromARGB(255, 238, 236, 231),
      title: const Text("Smart Shopping", style: TextStyle(color: Color.fromARGB(255, 245, 238, 238),fontFamily: bold,)),
      iconTheme: const IconThemeData(color: Color.fromARGB(255, 228, 215, 215)),
      //leading: Image.asset("your_image_asset"),
      actions: <Widget>[
        IconButton(icon: const Icon(Icons.search, color: Color.fromARGB(255, 238, 230, 230),), onPressed: () {}),
    IconButton(icon: const Icon(Icons.mic, color: Color.fromARGB(255, 243, 237, 237),), onPressed: () {}),
         IconButton(icon: const Icon(Icons.camera_alt_outlined, color: Color.fromARGB(255, 236, 233, 233),), onPressed: () {}),
    
       ],
      ),
      body: Obx(() => SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              data['imageUrl'] == '' && controller.profileImgPath.isEmpty
              ?Image.asset(
                    imgProfile2,
                    width: 120,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make()
                  :
                  data['imageUrl'] == '' && controller.profileImgPath.isEmpty
                  ?Image.network(data['imageUrl'],width: 100,
                  fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()
                  :Image.file(File(controller.profileImgPath.value),
                  width: 100,
                  fit: BoxFit.cover,
        
                  ).box.roundedFull.clip(Clip.antiAlias).make(),
                  20.heightBox,
                  ourButton(color: redColor,onPress: (){
                    controller.changeImage(context);
                    //Get.find<ProfileController>().changeImage(context);
                  }, textColor: whiteColor, title: "change"),
                  const Divider(),
                  customTextField( controller: controller.nameController, title: name, hint: namehint,isPass: false,),
                  customTextField( controller: controller.oldpassController, title: newpassword, hint: passwordHint,isPass: false),
                  customTextField( controller: controller.newpassController, title: oldpassword, hint: passwordHint,isPass:false),
                  20.heightBox,
                  controller.isloading.value 
                  ?const CircularProgressIndicator(): SizedBox(
                    width: context.screenWidth-60,
                    child: ourButton(
                    color: redColor,
                    onPress: ()async{

                      controller.isloading(true);
                      
                      //if image is not selected

                      if(controller.profileImgPath.value.isNotEmpty){
                        await controller.uploadProfileImage();
                      }else{
                        controller.profileImageLink = data['imageUrl'];
                      }
                      //if old password matches database 
                      if(data['password'] == controller.oldpassController.text){
                        await controller.changeAuthPassword(
                          email: data['email'],
                          password: controller.oldpassController.text,
                          newpassword: controller.newpassController.text,

                        );
                        await controller.updateProfile(
                        imgUrl: controller.profileImageLink,
                        name:controller.nameController.text,
                        password: controller.newpassController.text);
                        // ignore: use_build_context_synchronously
                        VxToast.show(context, msg: "Updated successfully");
                      }else{
                        // ignore: use_build_context_synchronously
                        VxToast.show(context, msg: "Old password is wrong ");
                        controller.isloading(false);
                      }
                      
                        
                      
                    }, textColor: whiteColor, title: "save")),
        
            ],
          ).box.rounded.shadowSm.padding(const EdgeInsets.all(16)).margin(const EdgeInsets.only(top: 50,left: 12, right: 12)).make(),
      ),
      ),
    );
  }
}