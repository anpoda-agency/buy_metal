part of 'reg_confirm_conditions_bloc.dart';

abstract class RegConfirmConditionsEvent {}

class RegConfirmConditionsInitEvent extends RegConfirmConditionsEvent {}

class RegConfirmConditionsMsgErrEvent extends RegConfirmConditionsEvent {
  final String msg;
  RegConfirmConditionsMsgErrEvent(this.msg);
}

class RegConfirmConditionSendRegEvent extends RegConfirmConditionsEvent {}
