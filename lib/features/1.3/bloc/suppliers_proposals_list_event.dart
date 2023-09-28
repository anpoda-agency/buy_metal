part of 'suppliers_proposals_list_bloc.dart';

abstract class SuppliersProposalsListEvent {}

class SuppliersProposalsListInit extends SuppliersProposalsListEvent {}

class SuppliersProposalsListMsgErr extends SuppliersProposalsListEvent {
  final String msg;
  SuppliersProposalsListMsgErr(this.msg);
}

class SupplierProposalsListChooseProposalEvent extends SuppliersProposalsListEvent {
  final ApplicationGetResponsesByApplicationIdResponse proposalById;
  SupplierProposalsListChooseProposalEvent(this.proposalById);
}
