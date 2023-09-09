part of 'buyer_orders_list_bloc.dart';

abstract class BuyerOrdersListEvent {}

class BuyerOrdersListInit extends BuyerOrdersListEvent {}

class BuyerOrdersListMsgErr extends BuyerOrdersListEvent {
  final String msg;
  BuyerOrdersListMsgErr(this.msg);
}
