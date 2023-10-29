// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:buy_metal_app/data/models/from_json.dart';

part 'statistics_get_statistics_response.g.dart';

@JsonSerializable()
class StatisticsGetStatisticsResponse {
  @JsonKey(name: 'completedOrdersAmount', fromJson: FromJsonBase.jsonToInt)
  final int completedOrdersAmount;
  @JsonKey(name: 'createdOrdersAmount', fromJson: FromJsonBase.jsonToInt)
  final int createdOrdersAmount;
  @JsonKey(name: 'detailedStatistic')
  final List<DetailedStatistic> detailedStatistic;
  @JsonKey(name: 'from', fromJson: FromJsonBase.jsonToString)
  final String from;
  @JsonKey(name: 'rejectedOrdersAmount', fromJson: FromJsonBase.jsonToInt)
  final int rejectedOrdersAmount;

  @JsonKey(name: 'to', fromJson: FromJsonBase.jsonToString)
  final String to;

  @JsonKey(name: 'totalApplicationAmount', fromJson: FromJsonBase.jsonToInt)
  final int totalApplicationAmount;
  @JsonKey(name: 'totalApplicationResponseAmount', fromJson: FromJsonBase.jsonToInt)
  final int totalApplicationResponseAmount;
  @JsonKey(name: 'totalMoneyAmount', fromJson: FromJsonBase.jsonToInt)
  final int totalMoneyAmount;

  const StatisticsGetStatisticsResponse({
    this.completedOrdersAmount = 0,
    this.createdOrdersAmount = 0,
    this.detailedStatistic = const [],
    this.from = '',
    this.rejectedOrdersAmount = 0,
    this.to = '',
    this.totalApplicationAmount = 0,
    this.totalApplicationResponseAmount = 0,
    this.totalMoneyAmount = 0,
  });

  factory StatisticsGetStatisticsResponse.fromJson(Map<String, dynamic> json) =>
      _$StatisticsGetStatisticsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$StatisticsGetStatisticsResponseToJson(this);

  StatisticsGetStatisticsResponse copyWith({
    int? completedOrdersAmount,
    int? createdOrdersAmount,
    List<DetailedStatistic>? detailedStatistic,
    String? from,
    int? rejectedOrdersAmount,
    String? to,
    int? totalApplicationAmount,
    int? totalApplicationResponseAmount,
    int? totalMoneyAmount,
  }) {
    return StatisticsGetStatisticsResponse(
      completedOrdersAmount: completedOrdersAmount ?? this.completedOrdersAmount,
      createdOrdersAmount: createdOrdersAmount ?? this.createdOrdersAmount,
      detailedStatistic: detailedStatistic ?? this.detailedStatistic,
      from: from ?? this.from,
      rejectedOrdersAmount: rejectedOrdersAmount ?? this.rejectedOrdersAmount,
      to: to ?? this.to,
      totalApplicationAmount: totalApplicationAmount ?? this.totalApplicationAmount,
      totalApplicationResponseAmount: totalApplicationResponseAmount ?? this.totalApplicationResponseAmount,
      totalMoneyAmount: totalMoneyAmount ?? this.totalMoneyAmount,
    );
  }
}

@JsonSerializable()
class DetailedStatistic {
  @JsonKey(name: 'completedOrders', fromJson: FromJsonBase.jsonToInt)
  final int completedOrders;
  @JsonKey(name: 'createdApplicationResponeses', fromJson: FromJsonBase.jsonToInt)
  final int createdApplicationResponeses;
  @JsonKey(name: 'createdApplications', fromJson: FromJsonBase.jsonToInt)
  final int createdApplications;
  @JsonKey(name: 'createdOrders', fromJson: FromJsonBase.jsonToInt)
  final int createdOrders;
  @JsonKey(name: 'date', fromJson: FromJsonBase.jsonToString)
  final String date;
  @JsonKey(name: 'rejectedOrders', fromJson: FromJsonBase.jsonToInt)
  final int rejectedOrders;

  const DetailedStatistic({
    this.completedOrders = 0,
    this.createdApplicationResponeses = 0,
    this.createdApplications = 0,
    this.createdOrders = 0,
    this.date = '',
    this.rejectedOrders = 0,
  });

  factory DetailedStatistic.fromJson(Map<String, dynamic> json) => _$DetailedStatisticFromJson(json);
  Map<String, dynamic> toJson() => _$DetailedStatisticToJson(this);

  DetailedStatistic copyWith({
    int? completedOrders,
    int? createdApplicationResponeses,
    int? createdApplications,
    int? createdOrders,
    String? date,
    int? rejectedOrders,
  }) {
    return DetailedStatistic(
      completedOrders: completedOrders ?? this.completedOrders,
      createdApplicationResponeses: createdApplicationResponeses ?? this.createdApplicationResponeses,
      createdApplications: createdApplications ?? this.createdApplications,
      createdOrders: createdOrders ?? this.createdOrders,
      date: date ?? this.date,
      rejectedOrders: rejectedOrders ?? this.rejectedOrders,
    );
  }
}
