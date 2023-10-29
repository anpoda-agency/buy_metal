// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_get_statistics_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatisticsGetStatisticsResponse _$StatisticsGetStatisticsResponseFromJson(
        Map<String, dynamic> json) =>
    StatisticsGetStatisticsResponse(
      completedOrdersAmount: json['completedOrdersAmount'] == null
          ? 0
          : FromJsonBase.jsonToInt(json['completedOrdersAmount']),
      createdOrdersAmount: json['createdOrdersAmount'] == null
          ? 0
          : FromJsonBase.jsonToInt(json['createdOrdersAmount']),
      detailedStatistic: (json['detailedStatistic'] as List<dynamic>?)
              ?.map(
                  (e) => DetailedStatistic.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      from: json['from'] == null ? '' : FromJsonBase.jsonToString(json['from']),
      rejectedOrdersAmount: json['rejectedOrdersAmount'] == null
          ? 0
          : FromJsonBase.jsonToInt(json['rejectedOrdersAmount']),
      to: json['to'] == null ? '' : FromJsonBase.jsonToString(json['to']),
      totalApplicationAmount: json['totalApplicationAmount'] == null
          ? 0
          : FromJsonBase.jsonToInt(json['totalApplicationAmount']),
      totalApplicationResponseAmount:
          json['totalApplicationResponseAmount'] == null
              ? 0
              : FromJsonBase.jsonToInt(json['totalApplicationResponseAmount']),
      totalMoneyAmount: json['totalMoneyAmount'] == null
          ? 0
          : FromJsonBase.jsonToInt(json['totalMoneyAmount']),
    );

Map<String, dynamic> _$StatisticsGetStatisticsResponseToJson(
        StatisticsGetStatisticsResponse instance) =>
    <String, dynamic>{
      'completedOrdersAmount': instance.completedOrdersAmount,
      'createdOrdersAmount': instance.createdOrdersAmount,
      'detailedStatistic': instance.detailedStatistic,
      'from': instance.from,
      'rejectedOrdersAmount': instance.rejectedOrdersAmount,
      'to': instance.to,
      'totalApplicationAmount': instance.totalApplicationAmount,
      'totalApplicationResponseAmount': instance.totalApplicationResponseAmount,
      'totalMoneyAmount': instance.totalMoneyAmount,
    };

DetailedStatistic _$DetailedStatisticFromJson(Map<String, dynamic> json) =>
    DetailedStatistic(
      completedOrders: json['completedOrders'] == null
          ? 0
          : FromJsonBase.jsonToInt(json['completedOrders']),
      createdApplicationResponeses: json['createdApplicationResponeses'] == null
          ? 0
          : FromJsonBase.jsonToInt(json['createdApplicationResponeses']),
      createdApplications: json['createdApplications'] == null
          ? 0
          : FromJsonBase.jsonToInt(json['createdApplications']),
      createdOrders: json['createdOrders'] == null
          ? 0
          : FromJsonBase.jsonToInt(json['createdOrders']),
      date: json['date'] == null ? '' : FromJsonBase.jsonToString(json['date']),
      rejectedOrders: json['rejectedOrders'] == null
          ? 0
          : FromJsonBase.jsonToInt(json['rejectedOrders']),
    );

Map<String, dynamic> _$DetailedStatisticToJson(DetailedStatistic instance) =>
    <String, dynamic>{
      'completedOrders': instance.completedOrders,
      'createdApplicationResponeses': instance.createdApplicationResponeses,
      'createdApplications': instance.createdApplications,
      'createdOrders': instance.createdOrders,
      'date': instance.date,
      'rejectedOrders': instance.rejectedOrders,
    };
