part of 'description_of_supplier_proposal_bloc.dart';

abstract class DescriptionOfSupplierProposalEvent {}

class DescriptionOfSupplierProposalInitEvent extends DescriptionOfSupplierProposalEvent {}

class DescriptionOfSupplierProposalMsgErrEvent extends DescriptionOfSupplierProposalEvent {
  final String msg;
  DescriptionOfSupplierProposalMsgErrEvent(this.msg);
}

class DescriptionOfSupplierProposalConfirmDealEvent extends DescriptionOfSupplierProposalEvent {}
