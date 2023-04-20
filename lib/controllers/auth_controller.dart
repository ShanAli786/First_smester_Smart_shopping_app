// import 'package:emart_seller/const/const.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';

// class AuthController extends GetxController {
//   final FirebaseAuth auth = FirebaseAuth.instance;

//   var isloading = false.obs;

//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();

//   //login method
//   Future<UserCredential?> loginMethod({context}) async {
//     UserCredential? userCredential;

//     try {
//       userCredential = await auth.signInWithEmailAndPassword(
//           email: emailController.text, password: passwordController.text);
//     } on FirebaseAuthException catch (e) {
//       VxToast.show(context, msg: e.toString());
//     }

//     return userCredential;
//   }

//   //signup method
//   // Future<UserCredential?> signupMethod({context}) async {
//   //   UserCredential? userCredential;

//   //   try {
//   //     userCredential = await auth.signInwithEmailAndPassword(
//   //         email: emailController.text, password: passwordController);
//   //   } on FirebaseAuthException catch (e) {
//   //     VxToast.show(context, msg: e.toString());
//   //   }

//   //   return userCredential;
//   // }

//   signOutMethod(context) async {
//     try {
//       await auth.signOut();
//     } catch (e) {
//       VxToast.show(context, msg: e.toString());
//     }
//   }
// }
//import 'package:emart_seller/const/const.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../consts/consts.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  var isloading = false.obs;

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordretypeController = TextEditingController();

  //login method
  Future<UserCredential?> loginMethod({context,email,password}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      
      VxToast.show(context, msg: e.toString());
    }

    return userCredential;
  }

  //store data method

  storeUserData({name,password,email}) async{
    DocumentReference store  =  firestore.collection(usersCollections).doc(currentUser!.uid);
    store.set({ 'name': name, 'password': password, 'email': email, 'imageUrl': '', 
    'id':currentUser!.uid, 'cart_count' : "00"});

  }

  //signup method
  Future<UserCredential?> signupMethod({context, required String email, required String password}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: name);
    } 

    return userCredential;
  }

  signOutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: "this an error");
    }
  }
}
