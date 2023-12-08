part of 'buyer_orders_list_bloc.dart';

abstract class BuyerOrdersListEvent {}

class BuyerOrdersListInitEvent extends BuyerOrdersListEvent {}

class BuyerOrdersListMsgErrEvent extends BuyerOrdersListEvent {
  final String msg;
  BuyerOrdersListMsgErrEvent(this.msg);
}

class BuyerOrdersListChooseOrderEvent extends BuyerOrdersListEvent {
  final String orderById;
  //  final ApplicationGetCustomerApplicationsResponse applicationResponse;

  final ApplicationUploadSearchResponse applicationResponse;
  BuyerOrdersListChooseOrderEvent(this.orderById, this.applicationResponse);
}

class BuyerOrdersListCreateOrderEvent extends BuyerOrdersListEvent {}
