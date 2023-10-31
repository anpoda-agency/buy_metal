part of 'supplier_proposals_bloc.dart';

abstract class SupplierProposalsEvent {}

class SupplierProposalsInit extends SupplierProposalsEvent {}

class SupplierProposalsMsgErr extends SupplierProposalsEvent {
  final String msg;
  SupplierProposalsMsgErr(this.msg);
}

class SupplierProposalsChooseProposalEvent extends SupplierProposalsEvent {
  final ApplicationResponseGetSupplierResponsesResponse proposalById;
  SupplierProposalsChooseProposalEvent(this.proposalById);
}
