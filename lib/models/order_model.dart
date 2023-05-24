import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

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
      this.id = ''});

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

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
  }) {
    return OrderModel(
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
    );
  }
}
