// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      formRolled: json['form_rental'] as String? ?? '',
      type: json['type'] as String? ?? '',
      sizeRolled: json['size_rental'] as String? ?? '',
      paramsRolled: json['params_rental'] as String? ?? '',
      gostRolled: json['gost_rental'] as String? ?? '',
      brandMaterial: json['brand_material'] as String? ?? '',
      paramsMaterial: json['params_material'] as String? ?? '',
      gostMaterial: json['gost_material'] as String? ?? '',
      requirement: json['requirement'] as String? ?? '',
      dataCreate: json['data_create'] as String? ?? '',
      id: json['id'] as String? ?? '',
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'form_rental': instance.formRolled,
      'type': instance.type,
      'size_rental': instance.sizeRolled,
      'params_rental': instance.paramsRolled,
      'gost_rental': instance.gostRolled,
      'brand_material': instance.brandMaterial,
      'params_material': instance.paramsMaterial,
      'gost_material': instance.gostMaterial,
      'requirement': instance.requirement,
      'data_create': instance.dataCreate,
      'id': instance.id,
    };
