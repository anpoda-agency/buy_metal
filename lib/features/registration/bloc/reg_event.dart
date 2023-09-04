part of 'reg_bloc.dart';

abstract class RegEvent {}

class RegInit extends RegEvent {}

class RegMsgErr extends RegEvent {
  final String msg;
  RegMsgErr(this.msg);
}
