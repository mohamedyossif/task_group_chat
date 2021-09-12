import 'package:chat_group_cat/component/reused_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseMethods
{
 static FirebaseAuth firebaseAuth=FirebaseAuth.instance;
    signUp(context,email,password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
   
   

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
    signInWithEmailAndPassword(context,email,password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
     
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        reusedDialog(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        reusedDialog(context, 'Wrong password provided for that user.');
      }
    }
  }
    signOut()async
   {
     try{
       return await firebaseAuth.signOut();
     }
     catch(e)
     {
       print(e);
     }
   }
}