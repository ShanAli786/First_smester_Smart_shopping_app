// ignore_for_file: unused_import, unnecessary_import, implementation_imports

import 'package:emart_app/HomeSCreen/home.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/list.dart';
import 'package:emart_app/controllers/auth_controller.dart';
import 'package:emart_app/views/Auth_Screens/signup_screen.dart';
import 'package:emart_app/widgets_common/applogo_widget.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:emart_app/widgets_common/custom_textfield.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(AuthController());

    return  bgWidget (
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: redColor,
        body: Center(
          child: Column(
            children: [
            (context.screenHeight*0.1).heightBox,
            applogowidget(), 
          10.heightBox,
          "Login  to $appname".text.fontFamily(bold).white.size(18).make(),
          10.heightBox,
              Obx(()=> Column(
                  children: [
                    customTextField(hint: EmailHint, title: Email,isPass: false, controller: controller.emailController),
                    customTextField(hint: passwordHint, title: password,isPass: true, controller: controller.passwordController),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(onPressed: (){}, child: forgetPass.text.make())),         
             controller.isloading.value? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(redColor),
             ) :  ourButton(color: redColor, title: login, textColor: whiteColor, onPress: () async{
              controller.isloading(true);
                await controller.loginMethod(context: context).then((value){
                  if(value != null){
                    VxToast.show(context, msg: "You Are login Successfully");
                    Get.offAll(()=> const Home());
                  }else{
                  controller.isloading(false);

                  }
                });
              }).box.width(context.screenWidth-50).make(),
              5.heightBox,
              createNewAccount.text.make(),
              5.heightBox,
              ourButton(color: redColor, title: signup, textColor: whiteColor, onPress: (){
                Get.to(()=>  const SignupScreen());
              }).box.width(context.screenWidth-50).make(),
              
              10.heightBox,
              loginwith.text.make(),
              10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(1, (index) => CircleAvatar(
                        backgroundColor: lightGrey,
                        radius: 25,
                        child: Image.asset(socilicons[index],width: 30,).onTap(() {
                          
                        })
                      )),
                    ),
              
                  ],
                ).box.white.rounded.padding(const EdgeInsets.all(16)).make(),
              ),
          ],
          ),
        ),
      ),

    );
  }
}
