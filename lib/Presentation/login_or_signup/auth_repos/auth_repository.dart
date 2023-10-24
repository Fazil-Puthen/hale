import 'package:firebase_auth/firebase_auth.dart';

class AuthReopsitoy{
  final fire=FirebaseAuth.instance;

  Future<bool> signup({required email,required password})async{
    try {
  final result=await fire.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
  print('tried at authrepository');
  return true;
} 
on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
  return false;
} catch (e) {
  print(e);
  return false;
}
  }

Future<bool> signin({required email,required password})async{
  try {
  final credential = await fire.signInWithEmailAndPassword(
    email: email,
    password: password
  );
  return true;
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
  return false;
}
}

Future<void> signout()async{
    final result=await fire.signOut();
}
  
}