part of 'buyer_deals_bloc.dart';

abstract class BuyerDealsEvent {}

class BuyerDealsInitEvent extends BuyerDealsEvent {}

class BuyerDealsMsgErrEvent extends BuyerDealsEvent {
  final String msg;
  BuyerDealsMsgErrEvent(this.msg);
}
