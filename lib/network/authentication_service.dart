import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoppify/model/user_model.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AppUser? _userFromFirebase(User? user){
    return user != null ? AppUser(mail: user.uid, uid: user.uid) : null;
  }

  Stream<AppUser?> get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  AppUser getUserFirebase(){
    final User? fUser = _firebaseAuth.currentUser;
    return AppUser(mail: fUser!.email, uid: fUser.uid);
  }

  Future signIn(
      {required String email, required String password}) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebase(user!);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signUp(
      {required String email, required String password}) async {
    try {
      UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebase(user!);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signOut() async{
    try{
      return  _firebaseAuth.signOut();
    } catch (e){
      print(e.toString());
      return null;
    }
  }
}
