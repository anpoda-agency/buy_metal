// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'buyer_deal_supplier_contacts_bloc.dart';

abstract class BuyerDealSupplierContactsState {
  final PageState pageState;
  const BuyerDealSupplierContactsState(this.pageState);
}

class BuyerDealSupplierContactsInitial extends BuyerDealSupplierContactsState {
  const BuyerDealSupplierContactsInitial(PageState pageState) : super(pageState);
}

class BuyerDealSupplierContactsUp extends BuyerDealSupplierContactsState {
  const BuyerDealSupplierContactsUp(PageState pageState) : super(pageState);
}

class BuyerDealSupplierContactsError extends BuyerDealSupplierContactsState {
  const BuyerDealSupplierContactsError(PageState pageState) : super(pageState);
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
