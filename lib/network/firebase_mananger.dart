import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoppify/model/user_model.dart';

class AddUser {
  final String mail;
  final String password;

  AddUser(this.mail, this.password);

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  addUser(String mail, String password) {
    User newUser = User(mail, password);
    return users
        .add({"mail": newUser.mail, "password": newUser.password})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
