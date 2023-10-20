part of 'supplier_deal_supplier_proposal_bloc.dart';

abstract class SupplierDealSupplierProposalEvent {}

class SupplierDealSupplierProposalInit extends SupplierDealSupplierProposalEvent {}

class SupplierDealSupplierProposalMsgErr extends SupplierDealSupplierProposalEvent {
  final String msg;
  SupplierDealSupplierProposalMsgErr(this.msg);
}
