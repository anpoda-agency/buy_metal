// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'supplier_deal_status_info_bloc.dart';

abstract class SupplierDealStatusInfoState {
  final PageState pageState;
  const SupplierDealStatusInfoState(this.pageState);
}

class SupplierDealStatusInfoInitial extends SupplierDealStatusInfoState {
  const SupplierDealStatusInfoInitial(PageState pageState) : super(pageState);
}

class SupplierDealStatusInfoUp extends SupplierDealStatusInfoState {
  const SupplierDealStatusInfoUp(PageState pageState) : super(pageState);
}

class SupplierDealStatusInfoError extends SupplierDealStatusInfoState {
  const SupplierDealStatusInfoError(PageState pageState) : super(pageState);
}

class SupplierDealStatusInfoOpenSupplierContactsInfoState extends SupplierDealStatusInfoState {
  const SupplierDealStatusInfoOpenSupplierContactsInfoState(PageState pageState) : super(pageState);
}

class SupplierDealStatusInfoOpenSupplierProposalInfoState extends SupplierDealStatusInfoState {
  const SupplierDealStatusInfoOpenSupplierProposalInfoState(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final DealGetFindDealByIdResponse response;

  const PageState({
    this.onAwait = false,
    this.errMsg = '',
    this.response = const DealGetFindDealByIdResponse(),
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    DealGetFindDealByIdResponse? response,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      response: response ?? this.response,
    );
  }
}
