import 'package:buy_metal_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfileRepository extends ChangeNotifier {
  UserModel user = const UserModel();

  void saveUser({required String id}) async {
    var db = FirebaseFirestore.instance;
    final ref = db.collection("users").doc(id).withConverter(
          fromFirestore: UserModel.fromFirestore,
          toFirestore: (UserModel user, _) => user.toFirestore(),
        );
    final docSnap = await ref.get();
    final userDB = docSnap.data(); // Convert to City object
    user = userDB ?? const UserModel();
    print(userDB?.id);
    print(user.id);
    // if (user != null) {
    //   print(user);
    // } else {
    //   print("No such document.");
    // }
    notifyListeners();
  }
}
