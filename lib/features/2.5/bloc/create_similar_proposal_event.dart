part of 'create_similar_proposal_bloc.dart';

abstract class CreateSimilarProposalEvent {}

class CreateSimilarProposalInitEvent extends CreateSimilarProposalEvent {}

class CreateSimilarProposalMsgErrEvent extends CreateSimilarProposalEvent {
  final String msg;
  CreateSimilarProposalMsgErrEvent(this.msg);
}

class CreateSimilarProposalInputRolledTypeEvent extends CreateSimilarProposalEvent {
  final String value;
  CreateSimilarProposalInputRolledTypeEvent(this.value);
}

class CreateSimilarProposalInputRolledSizeEvent extends CreateSimilarProposalEvent {
  final String value;
  CreateSimilarProposalInputRolledSizeEvent(this.value);
}

class CreateSimilarProposalInputRolledParamsEvent extends CreateSimilarProposalEvent {
  final String value;
  CreateSimilarProposalInputRolledParamsEvent(this.value);
}

class CreateSimilarProposalInputRolledGostEvent extends CreateSimilarProposalEvent {
  final String value;
  CreateSimilarProposalInputRolledGostEvent(this.value);
}

class CreateSimilarProposalInputMaterialBrandEvent extends CreateSimilarProposalEvent {
  final String value;
  CreateSimilarProposalInputMaterialBrandEvent(this.value);
}

class CreateSimilarProposalInputMaterialParamsEvent extends CreateSimilarProposalEvent {
  final String value;
  CreateSimilarProposalInputMaterialParamsEvent(this.value);
}

class CreateSimilarProposalInputMaterialGostEvent extends CreateSimilarProposalEvent {
  final String value;
  CreateSimilarProposalInputMaterialGostEvent(this.value);
}

class CreateSimilarProposalInputPriceEvent extends CreateSimilarProposalEvent {
  final double value;
  CreateSimilarProposalInputPriceEvent(this.value);
}

class CreateSimilarProposalInputFullPriceEvent extends CreateSimilarProposalEvent {
  final double value;
  CreateSimilarProposalInputFullPriceEvent(this.value);
}

class CreateSimilarProposalInputDeliverDateEvent extends CreateSimilarProposalEvent {
  final String value;
  CreateSimilarProposalInputDeliverDateEvent(this.value);
}

class CreateSimilarProposalInputInStockEvent extends CreateSimilarProposalEvent {
  final bool value;
  CreateSimilarProposalInputInStockEvent(this.value);
}

class CreateSimilarProposalSendEvent extends CreateSimilarProposalEvent {}
