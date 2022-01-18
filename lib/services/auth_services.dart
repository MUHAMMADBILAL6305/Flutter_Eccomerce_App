import 'package:firebase_auth/firebase_auth.dart';

//RegisterUser
class AuthServices {
  Future registerUser({required String email, required String password}) async {
    return await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }
}

//LoginUser
Future loginUser({required String email, required String password}) async {
  return await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password);
}

//ResetPassword
Future resetPassword({required String email}) async {
  return await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
}

//SignOut
Future signOut() async {
  return await FirebaseAuth.instance.signOut();
}
