import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  @JsonKey(name: 'form_rental')
  final String formRental;
  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'size_rental')
  final String sizeRental;
  @JsonKey(name: 'params_rental')
  final String paramsRental;
  @JsonKey(name: 'gost_rental')
  final String gostRental;
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
      {this.formRental = '',
      this.type = '',
      this.sizeRental = '',
      this.paramsRental = '',
      this.gostRental = '',
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
    String? formRental,
    String? type,
    String? sizeRental,
    String? paramsRental,
    String? gostRental,
    String? brandMaterial,
    String? paramsMaterial,
    String? gostMaterial,
    String? requirement,
    String? dataCreate,
    String? id,
  }) {
    return OrderModel(
      formRental: formRental ?? this.formRental,
      type: type ?? this.type,
      sizeRental: sizeRental ?? this.sizeRental,
      paramsRental: paramsRental ?? this.paramsRental,
      gostRental: gostRental ?? this.gostRental,
      brandMaterial: brandMaterial ?? this.brandMaterial,
      paramsMaterial: paramsMaterial ?? this.paramsMaterial,
      gostMaterial: gostMaterial ?? this.gostMaterial,
      requirement: requirement ?? this.requirement,
      dataCreate: dataCreate ?? this.dataCreate,
      id: id ?? this.id,
    );
  }
}
