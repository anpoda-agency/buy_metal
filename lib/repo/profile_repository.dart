import 'package:buy_metal_app/models/answer_order_model.dart';
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

  Future<void> createProposal({required AnswerOrderModel request}) async {
    var db = FirebaseFirestore.instance;
    var res = await db.collection("proposals").add(request.toFirestore());
    await db.collection("proposals").doc(res.id).update({"id": res.id});

    List<AnswerOrderModel> listProposalsModels = user.listProposalsModels;
    listProposalsModels.add(request.copyWith(id: res.id));

    List listProposalsModelsForFirestore = [];
    for (var i in listProposalsModels) {
      listProposalsModelsForFirestore.add(i.toFirestore());
    }

    await db
        .collection("users")
        .doc(user.id)
        .update({"list_proposals_models": listProposalsModelsForFirestore});

    await saveUser(id: user.id);

    final ref = db.collection("orders").doc(request.idOrder).withConverter(
          fromFirestore: UserModel.fromFirestore,
          toFirestore: (UserModel user, _) => user.toFirestore(),
        );
    final docSnap = await ref.get();
    final orderDB = docSnap.data();
    List<AnswerOrderModel> listAnswersForOrder = orderDB?.listProposalsModels ?? [];
    listAnswersForOrder.add(request);
    await db
        .collection("orders")
        .doc(request.idOrder)
        .update({"list_proposals_models": listAnswersForOrder});

    notifyListeners();
  }

  Future<List<OrderModel>> getAllOrders() async {
    List<OrderModel> resultListOrderModels = [];
    var db = FirebaseFirestore.instance;
    final ref = db.collection('orders').withConverter(
          fromFirestore: OrderModel.fromFirestore,
          toFirestore: (OrderModel order, _) => order.toFirestore(),
        );
    final docSnap = await ref.get();
    final listOrderModels = docSnap.docs;
    for (var element in listOrderModels) {
      resultListOrderModels.add(OrderModel(
          listProposalsModels: List.from(element['list_proposals_models']),
          id: element['id'],
          brandMaterial: element['brand_material'],
          gostMaterial: element['gost_material'],
          gostRolled: element['gost_rolled'],
          paramsMaterial: element['params_material'],
          paramsRolled: element['params_rolled'],
          requirement: element['requirement'],
          buyerId: element['buyer_id'],
          sizeRolled: element['size_rolled'],
          type: element['type'],
          formRolled: element['form_rolled'],
          dataCreate: element['data_create']));
    }
    return resultListOrderModels;
  }

  Future<UserModel> getUserInfo({required String buyerId}) async {
    var db = FirebaseFirestore.instance;
    final ref = db.collection("users").doc(buyerId).withConverter(
          fromFirestore: UserModel.fromFirestore,
          toFirestore: (UserModel user, _) => user.toFirestore(),
        );
    final docSnap = await ref.get();
    final userDB = docSnap.data();
    return userDB ?? const UserModel();
  }
}
