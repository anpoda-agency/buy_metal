part of 'create_compliance_proposal_bloc.dart';

abstract class CreateComplianceProposalEvent {}

class CreateComplianceProposalInit extends CreateComplianceProposalEvent {}

class CreateComplianceProposalMsgErr extends CreateComplianceProposalEvent {
  final String msg;
  CreateComplianceProposalMsgErr(this.msg);
}

class CreateComplianceProposalInputPrice extends CreateComplianceProposalEvent {
  final double value;
  CreateComplianceProposalInputPrice(this.value);
}

class CreateComplianceProposalInputFullPrice extends CreateComplianceProposalEvent {
  final double value;
  CreateComplianceProposalInputFullPrice(this.value);
}

class CreateComplianceProposalInputDeliverDate extends CreateComplianceProposalEvent {
  final String value;
  CreateComplianceProposalInputDeliverDate(this.value);
}

class CreateComplianceProposalInputInStock extends CreateComplianceProposalEvent {
  final bool value;
  CreateComplianceProposalInputInStock(this.value);
}

class CreateComplianceProposalSendProposal extends CreateComplianceProposalEvent {}
