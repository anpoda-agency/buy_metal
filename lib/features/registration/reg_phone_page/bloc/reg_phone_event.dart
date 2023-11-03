part of 'reg_phone_bloc.dart';

abstract class RegPhoneEvent {}

class RegPhoneInit extends RegPhoneEvent {}

class RegPhoneMsgErr extends RegPhoneEvent {
  final String msg;
  RegPhoneMsgErr(this.msg);
}

class RegPhoneInputNumberEvent extends RegPhoneEvent {
  final String value;
  RegPhoneInputNumberEvent(this.value);
}

class RegPhoneSendRequestEvent extends RegPhoneEvent {}
