import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthReopsitoy{
  final fire=FirebaseAuth.instance;

  Future<bool> signup({required email,required password,required name,required phone})async{
    try {
  await fire.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
     await Future.delayed(const Duration(seconds: 3));
        await FirebaseFirestore.instance.collection('users').doc(email).set({
      'Name':name,
      'Phone':phone,
      'Mail':email,
    });
  return true;
} 
on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
  } else if (e.code == 'email-already-in-use') {
  }
  return false;
} catch (e) {
  return false;
}
  }

Future<bool> signin({required email,required password})async{
  try {
  await fire.signInWithEmailAndPassword(
    email: email,
    password: password
  );
  return true;
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
  } else if (e.code == 'wrong-password') {
  }
  return false;
}
}

Future<void> signout()async{
    await fire.signOut();
}
  
}