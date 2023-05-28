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

    final ref = db.collection("proposals").doc(res.id).withConverter(
          fromFirestore: AnswerOrderModel.fromFirestore,
          toFirestore: (AnswerOrderModel proposal, _) => proposal.toFirestore(),
        );
    final docSnap = await ref.get();
    final proposalDB = docSnap.data();

    if (proposalDB != null) {
      await addProposalToUser(request: proposalDB);
      await addProposalToOrder(request: proposalDB);
    }
  }

  Future<void> addProposalToOrder({required AnswerOrderModel request}) async {
    var db = FirebaseFirestore.instance;
    final ref = db.collection("orders").doc(request.idOrder).withConverter(
          fromFirestore: OrderModel.fromFirestore,
          toFirestore: (OrderModel supplier, _) => supplier.toFirestore(),
        );
    final docSnap = await ref.get();
    final orderDB = docSnap.data();

    List<AnswerOrderModel> listProposalsModels = [];
    if (orderDB != null && orderDB.listProposalsModels.isNotEmpty) {
      listProposalsModels.addAll(orderDB.listProposalsModels);
    }
    listProposalsModels.add(request);
    List listProposalsModelsForFirestore = [];
    for (var i in listProposalsModels) {
      listProposalsModelsForFirestore.add(i.toFirestore());
    }

    await db
        .collection("orders")
        .doc(request.idOrder)
        .update({"list_proposals_models": listProposalsModelsForFirestore});
  }

  Future<void> addProposalToUser({required AnswerOrderModel request}) async {
    List<AnswerOrderModel> listProposalsModels = user.listProposalsModels;
    listProposalsModels.add(request);

    List listProposalsModelsForFirestore = [];
    for (var i in listProposalsModels) {
      listProposalsModelsForFirestore.add(i.toFirestore());
    }

    var db = FirebaseFirestore.instance;
    await db
        .collection("users")
        .doc(user.id)
        .update({"list_proposals_models": listProposalsModelsForFirestore});
    await saveUser(id: user.id);
    notifyListeners();
  }

  Future<OrderModel?> getCurrentOrder({required String idOrder}) async {
    var db = FirebaseFirestore.instance;
    final ref = db.collection("orders").doc(idOrder).withConverter(
          fromFirestore: OrderModel.fromFirestore,
          toFirestore: (OrderModel supplier, _) => supplier.toFirestore(),
        );
    final docSnap = await ref.get();
    final orderDB = docSnap.data();
    return orderDB ?? const OrderModel();
  }

  Future<List<UserModel>> getUserForCurrentOrder({required OrderModel order}) async {
    List<UserModel> resultListUsersModels = [];
    var db = FirebaseFirestore.instance;
    final ref = db.collection('users').withConverter(
          fromFirestore: UserModel.fromFirestore,
          toFirestore: (UserModel user, _) => user.toFirestore(),
        );
    final docSnap = await ref.get();
    final listUserModels = docSnap.docs;
    for (var answers in order.listProposalsModels) {
      for (var user in listUserModels) {
        if (user.id == answers.idSupplier) {
          final ref = db.collection("users").doc(user.id).withConverter(
                fromFirestore: UserModel.fromFirestore,
                toFirestore: (UserModel user, _) => user.toFirestore(),
              );
          final docSnap = await ref.get();
          final userDB = docSnap.data();
          resultListUsersModels.add(userDB!);
        }
      }
    }
    return resultListUsersModels;
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

  Future<UserModel> getUserInfo({required String userId}) async {
    var db = FirebaseFirestore.instance;
    final ref = db.collection("users").doc(userId).withConverter(
          fromFirestore: UserModel.fromFirestore,
          toFirestore: (UserModel user, _) => user.toFirestore(),
        );
    final docSnap = await ref.get();
    final userDB = docSnap.data();
    return userDB ?? const UserModel();
  }
}
