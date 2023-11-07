import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {

  final _auth = FirebaseAuth.instance;

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String address,
    required String phone,
    required String fatherName,
    required String country,


  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          address.isNotEmpty || phone.isNotEmpty) {
        // registering user in auth with email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );


// bas thk hai shamsa i have work oki


        // adding user in our database
        await FirebaseFirestore.instance
            .collection("users")
            .doc(cred.user!.uid)
            .set({
          'name': username,
          'email': email,
          'password': password,
          'address': address,
          'phone': phone,
          'uid': _auth.currentUser!.uid,
          'fathername':fatherName,
          'country': country,
          // same yaha pe bhi phr form.dart screen pe aaja
        });

        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }


}