import 'package:emart_app/HomeSCreen/home.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/auth_controller.dart';
import 'package:emart_app/views/Auth_Screens/login_screen.dart';
import 'package:emart_app/widgets_common/our_button.dart';
// ignore: import_of_legacy_library_into_null_safe
//import 'package:emart_app/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets_common/applogo_widget.dart';
import '../../widgets_common/bg_widget.dart';
import '../../widgets_common/custom_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());

  
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          "join the $appname".text.fontFamily(bold).white.size(18).make(),
          10.heightBox,
              Column(
                children: [
                  customTextField(hint: namehint, title: name, controller: nameController,isPass: false),
                  customTextField(hint: EmailHint, title: Email,controller: emailController,isPass: false),
                  customTextField(hint: passwordHint, title: password, controller: passwordController,isPass: true),
                  customTextField(hint: password, title: passwordretype, controller: passwordRetypeController,isPass: true),
               
      //            ElevatedButton(
                  
      // onPressed: () async{
        
      //   if(isCheck != true){
      //     try {
      //       await controller.signupMethod(context: context, email: emailController.text, password: passwordController.text )
      //       .then((value){
      //         return controller.storeUserData(
      //           email: emailController.text,
      //           name: nameController.text,
      //           password: passwordController.text
      //         );
      //       }).then((value){
      //         VxToast.show(context, msg: "loggedin");
      //         Get.offAll(()=>  const Home());
      //       });
      //     } catch (e) {
      //       auth.signOut();
      //       VxToast.show(context, msg: toString());
      //     }
      //   }
      // },
      // // ignore: sort_child_properties_last
      // child: const Text('Sign Up'),
      // style: ElevatedButton.styleFrom(
      //   foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 239, 46, 32), // Set text color
      //   elevation: 2, // Set elevation
      //   shape: RoundedRectangleBorder(
      // borderRadius: BorderRadius.circular(10), // Set border radius
      //   ),
      // ),
      // ).box.width(400).make(),

      
    Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          //checkColor: redColor,
          Checkbox(
            activeColor: redColor,
            checkColor: whiteColor,
            value: isCheck, 
            onChanged: (newValue){
              setState(() {
                isCheck = newValue;
              });
            },
          
          ),
          10.widthBox,
          RichText(text: const TextSpan(
            children: [
              TextSpan(
                text: "i agree to the  ", 
                style: TextStyle(
                  fontFamily: bold,
                  color: fontGrey,
                ),
              ),
              TextSpan(
                text: termsConditions, 
                style: TextStyle(
                  fontFamily: bold,
                  color: redColor,
                ),
              ),
            ],
          ))
        ],
    ),
       ourButton(
        color: isCheck == true ? redColor: lightGrey, 
        title: signup, 
        textColor: whiteColor, 
        onPress: () async {

           if(isCheck != false){
          try {
            await controller.signupMethod(
              context: context, 
            email: emailController.text, password: passwordController.text )
            .then((value){
              return controller.storeUserData(
                email: emailController.text,
                name: nameController.text,
                password: passwordController.text
              );
            }).then((value){
            VxToast.show(context, msg:"Registerd successfully");
              Get.offAll(()=>  const LoginScreen());
            });
          } catch (e) {
            auth.signOut();
           
           VxToast.show(context, msg: "Not registerd ");
           //Get.offAll(()=>  const LoginScreen());
          }
        }

       }).box.width(context.screenWidth-50).make(),
      5.heightBox,
           RichText(text: const TextSpan(
               children: [
                TextSpan(
                   text: alreadyaccount,
                style: TextStyle(color: Colors.black),

                ),
              
                TextSpan(
                  text: login,
                  style: TextStyle(color: Colors.red, fontFamily: bold),

                ),
               ],
              ), 
              ).onTap(() {Get.back();}),
                ],

              ).box.white.rounded.padding(const EdgeInsets.all(16)).make(),
              
          ],
          ),
        ),
      ),

    );
  }
}