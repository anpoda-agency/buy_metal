// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerOrderModel _$AnswerOrderModelFromJson(Map<String, dynamic> json) =>
    AnswerOrderModel(
      formRental: json['form_rental'] as String? ?? '',
      type: json['type'] as String? ?? '',
      sizeRental: json['size_rental'] as String? ?? '',
      paramsRental: json['params_rental'] as String? ?? '',
      gostRental: json['gost_rental'] as String? ?? '',
      brandMaterial: json['brand_material'] as String? ?? '',
      paramsMaterial: json['params_material'] as String? ?? '',
      gostMaterial: json['gost_material'] as String? ?? '',
      requirement: json['requirement'] as String? ?? '',
      priceTonne: json['price_tonne'] as String? ?? '',
      id: json['id'] as String? ?? '',
      availability: json['availability'] as String? ?? '',
      availible: json['availible'] as String? ?? '',
      concidence: json['concidence'] as String? ?? '',
      dataAnswer: json['data_answer'] as String? ?? '',
      dateArrive: json['date_arrive'] as String? ?? '',
      sum: json['sum'] as String? ?? '',
    );

Map<String, dynamic> _$AnswerOrderModelToJson(AnswerOrderModel instance) =>
    <String, dynamic>{
      'form_rental': instance.formRental,
      'type': instance.type,
      'size_rental': instance.sizeRental,
      'params_rental': instance.paramsRental,
      'gost_rental': instance.gostRental,
      'brand_material': instance.brandMaterial,
      'params_material': instance.paramsMaterial,
      'gost_material': instance.gostMaterial,
      'requirement': instance.requirement,
      'data_answer': instance.dataAnswer,
      'id': instance.id,
      'price_tonne': instance.priceTonne,
      'sum': instance.sum,
      'availible': instance.availible,
      'availability': instance.availability,
      'date_arrive': instance.dateArrive,
      'concidence': instance.concidence,
    };
