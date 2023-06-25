import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  
  //step1==> take instance from firebase
  final _auth = FirebaseAuth.instance;

  //step2==> create signup method
  Future<dynamic> signup(String email, String password) async {
    final authresult = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return authresult;
  }

  
  //step3==> create signin method
  Future<dynamic> signin(String email, String password) async {
    final authresult = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return authresult;
  }
}
