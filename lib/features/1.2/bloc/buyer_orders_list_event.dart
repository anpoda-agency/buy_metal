part of 'buyer_orders_list_bloc.dart';

abstract class BuyerOrdersListEvent {}

class BuyerOrdersListInitEvent extends BuyerOrdersListEvent {}

class BuyerOrdersListMsgErrEvent extends BuyerOrdersListEvent {
  final String msg;
  BuyerOrdersListMsgErrEvent(this.msg);
}

class BuyerOrdersListChooseProposalEvent extends BuyerOrdersListEvent {
  final String proposalById;
  BuyerOrdersListChooseProposalEvent(this.proposalById);
}

class BuyerOrdersListCreateOrderEvent extends BuyerOrdersListEvent {}
