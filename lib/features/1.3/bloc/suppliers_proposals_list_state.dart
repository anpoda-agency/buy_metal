// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'suppliers_proposals_list_bloc.dart';

abstract class SuppliersProposalsListState {
  final PageState pageState;
  const SuppliersProposalsListState(this.pageState);
}

class SuppliersProposalsListInitial extends SuppliersProposalsListState {
  const SuppliersProposalsListInitial(PageState pageState) : super(pageState);
}

class SuppliersProposalsListUp extends SuppliersProposalsListState {
  const SuppliersProposalsListUp(PageState pageState) : super(pageState);
}

class SuppliersProposalsListError extends SuppliersProposalsListState {
  const SuppliersProposalsListError(PageState pageState) : super(pageState);
}

class SupplierProposalsListChooseProposalState extends SuppliersProposalsListState {
  const SupplierProposalsListChooseProposalState(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final List<ApplicationGetResponsesByApplicationIdResponse> response;
  final ApplicationGetResponsesByApplicationIdResponse proposalById;

  const PageState({
    this.onAwait = false,
    this.errMsg = '',
    this.response = const [],
    this.proposalById = const ApplicationGetResponsesByApplicationIdResponse(),
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    List<ApplicationGetResponsesByApplicationIdResponse>? response,
    ApplicationGetResponsesByApplicationIdResponse? proposalById,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      response: response ?? this.response,
      proposalById: proposalById ?? this.proposalById,
    );
  }
}
