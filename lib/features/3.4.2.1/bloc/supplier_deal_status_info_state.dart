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

class SupplierDealStatusInfoConfirmDealState extends SupplierDealStatusInfoState {
  const SupplierDealStatusInfoConfirmDealState(PageState pageState) : super(pageState);
}

class SupplierDealStatusInfoCancelDealState extends SupplierDealStatusInfoState {
  const SupplierDealStatusInfoCancelDealState(PageState pageState) : super(pageState);
}

class SupplierDealStatusInfoConfirmSupplyState extends SupplierDealStatusInfoState {
  const SupplierDealStatusInfoConfirmSupplyState(PageState pageState) : super(pageState);
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
