import 'package:json_annotation/json_annotation.dart';

part 'answer_order_model.g.dart';

@JsonSerializable()
class AnswerOrderModel {
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
  @JsonKey(name: 'data_answer')
  final String dataAnswer;
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'price_tonne')
  final String priceTonne;
  @JsonKey(name: 'sum')
  final String sum;
  @JsonKey(name: 'availible')
  final String availible;
  @JsonKey(name: 'availability')
  final String availability;
  @JsonKey(name: 'date_arrive')
  final String dateArrive;
  @JsonKey(name: 'concidence')
  final String concidence;

  const AnswerOrderModel(
      {this.formRental = '',
      this.type = '',
      this.sizeRental = '',
      this.paramsRental = '',
      this.gostRental = '',
      this.brandMaterial = '',
      this.paramsMaterial = '',
      this.gostMaterial = '',
      this.requirement = '',
      this.priceTonne = '',
      this.id = '',
      this.availability = '',
      this.availible = '',
      this.concidence = '',
      this.dataAnswer = '',
      this.dateArrive = '',
      this.sum = ''});

  factory AnswerOrderModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerOrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerOrderModelToJson(this);

  AnswerOrderModel copyWith({
    String? formRental,
    String? type,
    String? sizeRental,
    String? paramsRental,
    String? gostRental,
    String? brandMaterial,
    String? paramsMaterial,
    String? gostMaterial,
    String? requirement,
    String? dataAnswer,
    String? id,
    String? priceTonne,
    String? sum,
    String? availible,
    String? availability,
    String? dateArrive,
    String? concidence,
  }) {
    return AnswerOrderModel(
      formRental: formRental ?? this.formRental,
      type: type ?? this.type,
      sizeRental: sizeRental ?? this.sizeRental,
      paramsRental: paramsRental ?? this.paramsRental,
      gostRental: gostRental ?? this.gostRental,
      brandMaterial: brandMaterial ?? this.brandMaterial,
      paramsMaterial: paramsMaterial ?? this.paramsMaterial,
      gostMaterial: gostMaterial ?? this.gostMaterial,
      requirement: requirement ?? this.requirement,
      dataAnswer: dataAnswer ?? this.dataAnswer,
      id: id ?? this.id,
      priceTonne: priceTonne ?? this.priceTonne,
      sum: sum ?? this.sum,
      availible: availible ?? this.availible,
      availability: availability ?? this.availability,
      dateArrive: dateArrive ?? this.dateArrive,
      concidence: concidence ?? this.concidence,
    );
  }
}
