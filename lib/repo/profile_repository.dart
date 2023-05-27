import 'package:buy_metal_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfileRepository extends ChangeNotifier {
  UserModel user = const UserModel();

  Future<void> saveUser({required String id}) async {
    var db = FirebaseFirestore.instance;
    final ref = db.collection("users").doc(id).withConverter(
          fromFirestore: UserModel.fromFirestore,
          toFirestore: (UserModel user, _) => user.toFirestore(),
        );
    final docSnap = await ref.get();
    print("doc id: ${docSnap.id}");
    final userDB = docSnap.data(); // Convert to City object
    user = userDB ?? const UserModel();
    notifyListeners();
  }
}
