part of 'supplier_proposal_description_bloc.dart';

abstract class SupplierProposalDescriptionEvent {}

class SupplierProposalDescriptionInit extends SupplierProposalDescriptionEvent {}

class SupplierProposalDescriptionMsgErr extends SupplierProposalDescriptionEvent {
  final String msg;
  SupplierProposalDescriptionMsgErr(this.msg);
}
