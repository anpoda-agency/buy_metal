part of 'buyer_deal_supplier_proposal_bloc.dart';

abstract class BuyerDealSupplierProposalEvent {}

class BuyerDealSupplierProposalInit extends BuyerDealSupplierProposalEvent {}

class BuyerDealSupplierProposalMsgErr extends BuyerDealSupplierProposalEvent {
  final String msg;
  BuyerDealSupplierProposalMsgErr(this.msg);
}
