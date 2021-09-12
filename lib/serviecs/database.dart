import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreDatabaseMethods{
 FirebaseFirestore _fireStore=FirebaseFirestore.instance;
  void upLoadProfile(Map<String,dynamic> userInfo)
  {
    _fireStore.collection('users').add(userInfo);
  }
 Future<QuerySnapshot<Map<String, dynamic>>> getData(String name) async{
   return await _fireStore
       .collection('users')
   /// search email
       .where('name', isGreaterThanOrEqualTo: name)
       .where('name', isLessThan: name + 'z')
   ///not search about currentUser(myself)
    //.where('name',isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
       .get();
 }
}