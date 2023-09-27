// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'buyer_orders_list_bloc.dart';

abstract class BuyerOrdersListState {
  final PageState pageState;
  const BuyerOrdersListState(this.pageState);
}

class BuyerOrdersListInitialState extends BuyerOrdersListState {
  const BuyerOrdersListInitialState(PageState pageState) : super(pageState);
}

class BuyerOrdersListUpState extends BuyerOrdersListState {
  const BuyerOrdersListUpState(PageState pageState) : super(pageState);
}

class BuyerOrdersListErrorState extends BuyerOrdersListState {
  const BuyerOrdersListErrorState(PageState pageState) : super(pageState);
}

class BuyerOrdersListChooseProposalState extends BuyerOrdersListState {
  const BuyerOrdersListChooseProposalState(PageState pageState) : super(pageState);
}

class BuyerOrdersListCreateOrderState extends BuyerOrdersListState {
  const BuyerOrdersListCreateOrderState(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final ApplicationGetCustomerApplicationsResponse applicationResponse;
  final List<ApplicationGetCustomerApplicationsResponse> listApplcations;
  final String proposalById;

  const PageState({
    this.onAwait = false,
    this.errMsg = '',
    this.applicationResponse = const ApplicationGetCustomerApplicationsResponse(),
    this.listApplcations = const [],
    this.proposalById = '',
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    ApplicationGetCustomerApplicationsResponse? applicationResponse,
    List<ApplicationGetCustomerApplicationsResponse>? listApplcations,
    String? proposalById,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      applicationResponse: applicationResponse ?? this.applicationResponse,
      listApplcations: listApplcations ?? this.listApplcations,
      proposalById: proposalById ?? this.proposalById,
    );
  }
}
