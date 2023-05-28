// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'answer_order_model.g.dart';

@JsonSerializable()
class AnswerOrderModel {
  @JsonKey(name: 'form_rolled')
  final String formRolled;
  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'size_rolled')
  final String sizeRolled;
  @JsonKey(name: 'params_rolled')
  final String paramsRolled;
  @JsonKey(name: 'gost_rolled')
  final String gostRolled;
  @JsonKey(name: 'brand_material')
  final String brandMaterial;
  @JsonKey(name: 'params_material')
  final String paramsMaterial;
  @JsonKey(name: 'gost_material')
  final String gostMaterial;
  @JsonKey(name: 'requirement')
  final double requirement;
  @JsonKey(name: 'data_create')
  final String dataCreate;
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'date_to_storage')
  final String dateToStorage;
  @JsonKey(name: 'on_stock')
  final bool onStock;
  @JsonKey(name: 'similar')
  final bool similar;
  @JsonKey(name: 'price_per_tonne')
  final double pricePerTonne;
  @JsonKey(name: 'price_full')
  final double priceFull;
  @JsonKey(name: 'id_supplier')
  final String idSupplier;
  @JsonKey(name: 'id_order')
  final String idOrder;

  const AnswerOrderModel(
      {this.formRolled = '',
      this.dateToStorage = '',
      this.onStock = false,
      this.similar = false,
      this.pricePerTonne = 0,
      this.priceFull = 0,
      this.type = '',
      this.sizeRolled = '',
      this.paramsRolled = '',
      this.gostRolled = '',
      this.brandMaterial = '',
      this.paramsMaterial = '',
      this.gostMaterial = '',
      this.requirement = 0,
      this.dataCreate = '',
      this.idSupplier = '',
      this.idOrder = '',
      this.id = ''});

  // factory AnswerOrderModel.fromJson(Map<String, dynamic> json) =>
  //     _$AnswerOrderModelFromJson(json);
  // Map<String, dynamic> toJson() => _$AnswerOrderModelToJson(this);

  factory AnswerOrderModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return AnswerOrderModel(
        id: data?['id'],
        idOrder: data?['id_order'],
        brandMaterial: data?['brand_material'],
        gostMaterial: data?['gost_material'],
        gostRolled: data?['gost_golled'],
        paramsMaterial: data?['params_material'],
        paramsRolled: data?['params_rolled'],
        requirement: data?['requirement'],
        sizeRolled: data?['size_rolled'],
        type: data?['type'],
        formRolled: data?['form_rolled'],
        dataCreate: data?['data_create'],
        dateToStorage: data?['data_to_storage'],
        onStock: data?['on_stock'],
        similar: data?['similar'],
        pricePerTonne: data?['price_per_tonne'],
        priceFull: data?['price_full'],
        idSupplier: data?['id_supplier']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "id_order": idOrder,
      "brand_material": brandMaterial,
      "gost_material": gostMaterial,
      "gost_golled": gostRolled,
      "params_material": paramsMaterial,
      "params_rolled": paramsRolled,
      "requirement": requirement,
      "size_rolled": sizeRolled,
      "type": type,
      "form_rolled": formRolled,
      "data_create": dataCreate,
      "data_to_storage": dateToStorage,
      "on_stock": onStock,
      "similar": similar,
      "price_per_tonne": pricePerTonne,
      "price_full": priceFull,
      "id_supplier": idSupplier
    };
  }

  AnswerOrderModel copyWith(
      {String? formRolled,
      String? type,
      String? sizeRolled,
      String? paramsRolled,
      String? gostRolled,
      String? brandMaterial,
      String? paramsMaterial,
      String? gostMaterial,
      double? requirement,
      String? dataCreate,
      String? id,
      String? dateToStorage,
      bool? onStock,
      bool? similar,
      double? pricePerTonne,
      double? priceFull,
      String? idSupplier}) {
    return AnswerOrderModel(
        formRolled: formRolled ?? this.formRolled,
        type: type ?? this.type,
        sizeRolled: sizeRolled ?? this.sizeRolled,
        paramsRolled: paramsRolled ?? this.paramsRolled,
        gostRolled: gostRolled ?? this.gostRolled,
        brandMaterial: brandMaterial ?? this.brandMaterial,
        paramsMaterial: paramsMaterial ?? this.paramsMaterial,
        gostMaterial: gostMaterial ?? this.gostMaterial,
        requirement: requirement ?? this.requirement,
        dataCreate: dataCreate ?? this.dataCreate,
        id: id ?? this.id,
        dateToStorage: dateToStorage ?? this.dateToStorage,
        onStock: onStock ?? this.onStock,
        similar: similar ?? this.similar,
        pricePerTonne: pricePerTonne ?? this.pricePerTonne,
        priceFull: priceFull ?? this.priceFull,
        idSupplier: idSupplier ?? this.idSupplier);
  }
}
