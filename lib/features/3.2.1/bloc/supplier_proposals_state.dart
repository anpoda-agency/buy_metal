// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'supplier_proposals_bloc.dart';

abstract class SupplierProposalsState {
  final PageState pageState;
  const SupplierProposalsState(this.pageState);
}

class SupplierProposalsInitial extends SupplierProposalsState {
  const SupplierProposalsInitial(PageState pageState) : super(pageState);
}

class SupplierProposalsUp extends SupplierProposalsState {
  const SupplierProposalsUp(PageState pageState) : super(pageState);
}

class SupplierProposalsError extends SupplierProposalsState {
  const SupplierProposalsError(PageState pageState) : super(pageState);
}

class SupplierProposalsChooseProposalState extends SupplierProposalsState {
  const SupplierProposalsChooseProposalState(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final List<ApplicationResponseGetSupplierResponsesResponse> response;
  final ApplicationResponseGetSupplierResponsesResponse proposalById;

  const PageState({
    this.onAwait = false,
    this.errMsg = '',
    this.response = const [],
    this.proposalById = const ApplicationResponseGetSupplierResponsesResponse(),
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    List<ApplicationResponseGetSupplierResponsesResponse>? response,
    ApplicationResponseGetSupplierResponsesResponse? proposalById,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      response: response ?? this.response,
      proposalById: proposalById ?? this.proposalById,
    );
  }
}
