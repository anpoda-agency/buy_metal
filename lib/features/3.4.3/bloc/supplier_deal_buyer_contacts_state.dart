// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'supplier_deal_buyer_contacts_bloc.dart';

abstract class SupplierDealBuyerContactsState {
  final PageState pageState;
  const SupplierDealBuyerContactsState(this.pageState);
}

class SupplierDealBuyerContactsInitial extends SupplierDealBuyerContactsState {
  const SupplierDealBuyerContactsInitial(PageState pageState) : super(pageState);
}

class SupplierDealBuyerContactsUp extends SupplierDealBuyerContactsState {
  const SupplierDealBuyerContactsUp(PageState pageState) : super(pageState);
}

class SupplierDealBuyerContactsError extends SupplierDealBuyerContactsState {
  const SupplierDealBuyerContactsError(PageState pageState) : super(pageState);
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
