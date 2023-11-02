part of 'reg_sms_code_bloc.dart';

abstract class RegSmsCodeEvent {}

class RegSmsCodeInit extends RegSmsCodeEvent {}

class RegSmsCodeMsgErr extends RegSmsCodeEvent {
  final String msg;
  RegSmsCodeMsgErr(this.msg);
}
