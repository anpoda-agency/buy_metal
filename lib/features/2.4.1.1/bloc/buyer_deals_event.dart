part of 'buyer_deals_bloc.dart';

abstract class BuyerDealsEvent {}

class BuyerDealsInit extends BuyerDealsEvent {}

class BuyerDealsMsgErr extends BuyerDealsEvent {
  final String msg;
  BuyerDealsMsgErr(this.msg);
}
