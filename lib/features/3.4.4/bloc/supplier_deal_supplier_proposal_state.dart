// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'supplier_deal_supplier_proposal_bloc.dart';

abstract class SupplierDealSupplierProposalState {
  final PageState pageState;
  const SupplierDealSupplierProposalState(this.pageState);
}

class SupplierDealSupplierProposalInitial extends SupplierDealSupplierProposalState {
  const SupplierDealSupplierProposalInitial(PageState pageState) : super(pageState);
}

class SupplierDealSupplierProposalUp extends SupplierDealSupplierProposalState {
  const SupplierDealSupplierProposalUp(PageState pageState) : super(pageState);
}

class SupplierDealSupplierProposalError extends SupplierDealSupplierProposalState {
  const SupplierDealSupplierProposalError(PageState pageState) : super(pageState);
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
