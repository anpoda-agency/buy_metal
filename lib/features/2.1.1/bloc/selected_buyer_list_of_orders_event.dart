part of 'selected_buyer_list_of_orders_bloc.dart';

abstract class SelectedBuyerListOfOrdersEvent {}

class SelectedBuyerListOfOrdersInit extends SelectedBuyerListOfOrdersEvent {}

class SelectedBuyerListOfOrdersMsgErr extends SelectedBuyerListOfOrdersEvent {
  final String msg;
  SelectedBuyerListOfOrdersMsgErr(this.msg);
}
