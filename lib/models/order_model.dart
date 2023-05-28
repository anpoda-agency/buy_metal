import 'package:buy_metal_app/models/answer_order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
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
  final String requirement;
  @JsonKey(name: 'data_create')
  final String dataCreate;
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'buyer_id')
  final String buyerId;
  @JsonKey(name: 'list_proposals_models')
  final List<AnswerOrderModel> listProposalsModels;

  const OrderModel(
      {this.formRolled = '',
      this.type = '',
      this.sizeRolled = '',
      this.paramsRolled = '',
      this.gostRolled = '',
      this.brandMaterial = '',
      this.paramsMaterial = '',
      this.gostMaterial = '',
      this.requirement = '',
      this.dataCreate = '',
      this.buyerId = '',
      this.listProposalsModels = const [],
      this.id = ''});

  // factory OrderModel.fromJson(Map<String, dynamic> json) =>
  //     _$OrderModelFromJson(json);
  // Map<String, dynamic> toJson() => _$OrderModelToJson(this);

  OrderModel copyWith({
    String? formRolled,
    String? type,
    String? sizeRolled,
    String? paramsRolled,
    String? gostRolled,
    String? brandMaterial,
    String? paramsMaterial,
    String? gostMaterial,
    String? requirement,
    String? dataCreate,
    String? id,
    String? buyerId,
    List<AnswerOrderModel>? listProposalsModels,
  }) {
    return OrderModel(
        buyerId: buyerId ?? this.buyerId,
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
        listProposalsModels: listProposalsModels ?? this.listProposalsModels);
  }

  factory OrderModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();

    List<AnswerOrderModel> proposals = [];
    List<dynamic> proposalsMap = data?['list_proposals_models'];
    for (var element in proposalsMap) {
      proposals.add(AnswerOrderModel(
          id: element['id'],
          idOrder: element['id_order'],
          brandMaterial: element['brand_material'],
          gostMaterial: element['gost_material'],
          gostRolled: element['gost_golled'],
          paramsMaterial: element['params_material'],
          paramsRolled: element['params_rolled'],
          requirement: element['requirement'],
          sizeRolled: element['size_rolled'],
          type: element['type'],
          formRolled: element['form_rolled'],
          dataCreate: element['data_create'],
          dateToStorage: element['data_to_storage'],
          onStock: element['on_stock'],
          similar: element['similar'],
          pricePerTonne: element['price_per_tonne'],
          priceFull: element['price_full'],
          idSupplier: element['id_supplier']));
    }

    return OrderModel(
        listProposalsModels: proposals,
        id: data?['id'],
        buyerId: data?['buyer_id'],
        brandMaterial: data?['brand_material'],
        gostMaterial: data?['gost_material'],
        gostRolled: data?['gost_rolled'],
        paramsMaterial: data?['params_material'],
        paramsRolled: data?['params_rolled'],
        requirement: data?['requirement'],
        sizeRolled: data?['size_rolled'],
        type: data?['type'],
        formRolled: data?['form_rolled'],
        dataCreate: data?['data_create']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "list_proposals_models": listProposalsModels,
      "brand_material": brandMaterial,
      "gost_material": gostMaterial,
      "gost_rolled": gostRolled,
      "params_material": paramsMaterial,
      "params_rolled": paramsRolled,
      "requirement": requirement,
      "size_rolled": sizeRolled,
      "type": type,
      "buyer_id": buyerId,
      "form_rolled": formRolled,
      "data_create": dataCreate
    };
  }
}
