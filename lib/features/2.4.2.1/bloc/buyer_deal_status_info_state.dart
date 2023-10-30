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

class BuyerDealStatusInfoConfirmPaymentState extends BuyerDealStatusInfoState {
  const BuyerDealStatusInfoConfirmPaymentState(PageState pageState) : super(pageState);
}

class BuyerDealStatusInfoConfirmReceiptProductState extends BuyerDealStatusInfoState {
  const BuyerDealStatusInfoConfirmReceiptProductState(PageState pageState) : super(pageState);
}

class BuyerDealStatusInfoCancelDealState extends BuyerDealStatusInfoState {
  const BuyerDealStatusInfoCancelDealState(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final DealGetFindDealByIdResponse response;
  final DealUploadUpdateOrderStatusRequest requestUpdateStatus;
  final DealUploadUpdateOrderStatusResponse responseUpdateStatus;
  final bool isConfirmDeal;
  final bool isConfirmSupply;
  final bool isConfirmPayment;
  final bool isConfirmReceiptProduct;

  const PageState({
    this.onAwait = false,
    this.errMsg = '',
    this.response = const DealGetFindDealByIdResponse(),
    this.requestUpdateStatus = const DealUploadUpdateOrderStatusRequest(),
    this.responseUpdateStatus = const DealUploadUpdateOrderStatusResponse(),
    this.isConfirmDeal = false,
    this.isConfirmSupply = false,
    this.isConfirmPayment = false,
    this.isConfirmReceiptProduct = false,
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    DealGetFindDealByIdResponse? response,
    DealUploadUpdateOrderStatusRequest? requestUpdateStatus,
    DealUploadUpdateOrderStatusResponse? responseUpdateStatus,
    bool? isConfirmDeal,
    bool? isConfirmSupply,
    bool? isConfirmPayment,
    bool? isConfirmReceiptProduct,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      response: response ?? this.response,
      requestUpdateStatus: requestUpdateStatus ?? this.requestUpdateStatus,
      responseUpdateStatus: responseUpdateStatus ?? this.responseUpdateStatus,
      isConfirmDeal: isConfirmDeal ?? this.isConfirmDeal,
      isConfirmSupply: isConfirmSupply ?? this.isConfirmSupply,
      isConfirmPayment: isConfirmPayment ?? this.isConfirmPayment,
      isConfirmReceiptProduct: isConfirmReceiptProduct ?? this.isConfirmReceiptProduct,
    );
  }
}
