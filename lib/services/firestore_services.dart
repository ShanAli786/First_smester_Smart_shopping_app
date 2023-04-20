import '../consts/firebase_const.dart';

class FirestoreServices {
  static getUser(uid){
    return firestore.collection(usersCollections).where('id', isEqualTo:uid).snapshots();
  }
}