part of 'buyer_deal_status_info_bloc.dart';

abstract class BuyerDealStatusInfoEvent {}

class BuyerDealStatusInfoInitEvent extends BuyerDealStatusInfoEvent {}

class BuyerDealStatusInfoMsgErrEvent extends BuyerDealStatusInfoEvent {
  final String msg;
  BuyerDealStatusInfoMsgErrEvent(this.msg);
}

class BuyerDealStatusInfoOpenSupplierContactsInfoEvent extends BuyerDealStatusInfoEvent {}

class BuyerDealStatusInfoOpenSupplierProposalInfoEvent extends BuyerDealStatusInfoEvent {}
