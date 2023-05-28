import 'package:buy_metal_app/models/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'login')
  final String login;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'company_name')
  final String companyName;
  @JsonKey(name: 'company_adress')
  final String companyAdress;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'phone')
  final String phone;
  @JsonKey(name: 'user_fio')
  final String userFIO;
  @JsonKey(name: 'inn')
  final String inn;
  @JsonKey(name: 'post')
  final String post;
  @JsonKey(name: 'buyer')
  final bool buyer;
  @JsonKey(name: 'supplier')
  final bool supplier;
  @JsonKey(name: 'list_orders_models')
  final List<OrderModel> listOrdersModels;

  const UserModel(
      {this.id = '',
      this.login = '',
      this.password = '',
      this.companyName = '',
      this.buyer = false,
      this.supplier = false,
      this.companyAdress = '',
      this.email = '',
      this.phone = '',
      this.userFIO = '',
      this.inn = '',
      this.post = '',
      this.listOrdersModels = const []});

  // factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  // Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    String? id,
    String? login,
    String? password,
    String? companyName,
    String? companyAdress,
    String? email,
    String? phone,
    String? userFIO,
    String? inn,
    String? post,
    bool? buyer,
    bool? supplier,
    List<OrderModel>? listOrdersModels,
  }) {
    return UserModel(
      id: id ?? this.id,
      login: login ?? this.login,
      password: password ?? this.password,
      companyName: companyName ?? this.companyName,
      buyer: buyer ?? this.buyer,
      supplier: supplier ?? this.supplier,
      companyAdress: companyAdress ?? this.companyAdress,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      userFIO: userFIO ?? this.userFIO,
      inn: inn ?? this.inn,
      post: post ?? this.post,
      listOrdersModels: listOrdersModels ?? this.listOrdersModels,
    );
  }

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    List<OrderModel> orders = [];
    List<dynamic> ordersMap = data?['list_orders_models'];
    for (var element in ordersMap) {
      orders.add(OrderModel(
          listIdAnswers: List.from(element['list_id_answers']),
          id: element['id'],
          brandMaterial: element['brand_material'],
          gostMaterial: element['gost_material'],
          gostRolled: element['gost_golled'],
          paramsMaterial: element['params_material'],
          paramsRolled: element['params_rolled'],
          requirement: element['requirement'],
          sizeRolled: element['size_rolled'],
          type: element['type'],
          formRolled: element['form_rolled'],
          dataCreate: element['data_create']));
    }
    return UserModel(
      id: data?['id'],
      listOrdersModels: orders,
      password: data?['password'],
      companyName: data?['company_name'],
      buyer: data?['buyer'],
      supplier: data?['supplier'],
      companyAdress: data?['company_adress'],
      email: data?['email'],
      phone: data?['phone'],
      userFIO: data?['user_fio'],
      inn: data?['inn'],
      post: data?['post'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "password": password,
      "company_name": companyName,
      "buyer": buyer,
      "supplier": supplier,
      "company_adress": companyAdress,
      "email": email,
      "phone": phone,
      "user_fio": userFIO,
      "inn": inn,
      "post": post,
      "list_orders_models": listOrdersModels,
    };
  }
}
