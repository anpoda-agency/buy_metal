part of 'reg_bloc.dart';

abstract class RegEvent {}

class RegInit extends RegEvent {}

class RegMsgErr extends RegEvent {
  final String msg;
  RegMsgErr(this.msg);
}

class RegInputPosition extends RegEvent {
  final String value;
  RegInputPosition(this.value);
}

class RegInputFullName extends RegEvent {
  final String value;
  RegInputFullName(this.value);
}

class RegInputCompanyName extends RegEvent {
  final String value;
  RegInputCompanyName(this.value);
}

class RegInputCompanyAddress extends RegEvent {
  final String value;
  RegInputCompanyAddress(this.value);
}

class RegInputTIN extends RegEvent {
  final String value;
  RegInputTIN(this.value);
}

class RegInputPhoneNumber extends RegEvent {
  final String value;
  RegInputPhoneNumber(this.value);
}

class RegInputEmail extends RegEvent {
  final String value;
  RegInputEmail(this.value);
}

class RegInputPassword extends RegEvent {
  final String value;
  RegInputPassword(this.value);
}

class RegSendReg extends RegEvent {}
