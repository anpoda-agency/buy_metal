// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'buyer_deal_supplier_proposal_bloc.dart';

abstract class BuyerDealSupplierProposalState {
  final PageState pageState;
  const BuyerDealSupplierProposalState(this.pageState);
}

class BuyerDealSupplierProposalInitial extends BuyerDealSupplierProposalState {
  const BuyerDealSupplierProposalInitial(PageState pageState) : super(pageState);
}

class BuyerDealSupplierProposalUp extends BuyerDealSupplierProposalState {
  const BuyerDealSupplierProposalUp(PageState pageState) : super(pageState);
}

class BuyerDealSupplierProposalError extends BuyerDealSupplierProposalState {
  const BuyerDealSupplierProposalError(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final DealGetFindDealByIdResponse dealByIdInfo;

  const PageState({
    this.onAwait = false,
    this.errMsg = '',
    this.dealByIdInfo = const DealGetFindDealByIdResponse(),
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    DealGetFindDealByIdResponse? dealByIdInfo,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      dealByIdInfo: dealByIdInfo ?? this.dealByIdInfo,
    );
  }
}
