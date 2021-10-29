import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoppify/model/user_model.dart';

class FirebaseManager {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  addUser(AppUser user, String uid) {
    return users.doc(uid)
        .set({"mail": user.mail,
      "uid": user.uid,
      "age": user.age,
      "firstName": user.firstName,
      "lastName": user.lastName,
      "picture": user.picture,
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
