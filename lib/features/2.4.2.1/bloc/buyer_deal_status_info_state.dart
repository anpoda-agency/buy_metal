// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'buyer_deal_status_info_bloc.dart';

abstract class BuyerDealStatusInfoState {
  final PageState pageState;
  const BuyerDealStatusInfoState(this.pageState);
}

class BuyerDealStatusInfoInitialState extends BuyerDealStatusInfoState {
  const BuyerDealStatusInfoInitialState(PageState pageState) : super(pageState);
}

class BuyerDealStatusInfoUpState extends BuyerDealStatusInfoState {
  const BuyerDealStatusInfoUpState(PageState pageState) : super(pageState);
}

class BuyerDealStatusInfoErrorState extends BuyerDealStatusInfoState {
  const BuyerDealStatusInfoErrorState(PageState pageState) : super(pageState);
}

class BuyerDealStatusInfoOpenSupplierContactsInfoState extends BuyerDealStatusInfoState {
  const BuyerDealStatusInfoOpenSupplierContactsInfoState(PageState pageState) : super(pageState);
}

class BuyerDealStatusInfoOpenSupplierProposalInfoState extends BuyerDealStatusInfoState {
  const BuyerDealStatusInfoOpenSupplierProposalInfoState(PageState pageState) : super(pageState);
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
