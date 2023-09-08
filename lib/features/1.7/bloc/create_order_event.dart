part of 'create_order_bloc.dart';

abstract class CreateOrderEvent {}

class CreateOrderInit extends CreateOrderEvent {}

class CreateOrderMsgErr extends CreateOrderEvent {
  final String msg;
  CreateOrderMsgErr(this.msg);
}
