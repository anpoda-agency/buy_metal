import 'package:buy_metal_app/models/order_model.dart';
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
    final userDB = docSnap.data();
    user = userDB ?? const UserModel();
    notifyListeners();
  }

  Future<void> createOrder({required OrderModel request}) async {
    var db = FirebaseFirestore.instance;
    var res = await db.collection("orders").add(request.toFirestore());
    await db.collection("orders").doc(res.id).update({"id": res.id});

    List<OrderModel> listOrdersModels = user.listOrdersModels;
    listOrdersModels.add(request.copyWith(id: res.id));

    List listOrdersModelsForFirestore = [];
    for (var i in listOrdersModels) {
      listOrdersModelsForFirestore.add(i.toFirestore());
    }

    await db
        .collection("users")
        .doc(user.id)
        .update({"list_orders_models": listOrdersModelsForFirestore});
    await saveUser(id: user.id);
    notifyListeners();
  }
}
