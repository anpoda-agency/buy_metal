// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_compliance_proposal_bloc.dart';

abstract class CreateComplianceProposalState {
  final PageState pageState;
  const CreateComplianceProposalState(this.pageState);
}

class CreateComplianceProposalInitial extends CreateComplianceProposalState {
  const CreateComplianceProposalInitial(PageState pageState) : super(pageState);
}

class CreateComplianceProposalUp extends CreateComplianceProposalState {
  const CreateComplianceProposalUp(PageState pageState) : super(pageState);
}

class CreateComplianceProposalInputErrorState extends CreateComplianceProposalState {
  const CreateComplianceProposalInputErrorState(PageState pageState) : super(pageState);
}

class CreateComplianceProposalError extends CreateComplianceProposalState {
  const CreateComplianceProposalError(PageState pageState) : super(pageState);
}

class CreateComplianceProposalAllowedToPush extends CreateComplianceProposalState {
  const CreateComplianceProposalAllowedToPush(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final ApplicationResponseUploadCreateRequest request;
  final ApplicationResponseUploadCreateResponse response;

  final bool priceError;
  final String errorPriceText;
  final bool deliverDateError;
  final String errorDeliverDateText;
  final bool isAvailableSelected;
  final bool availableSelectedError;
  final String errorAvailableSelectedText;

  const PageState({
    this.onAwait = false,
    this.errMsg = '',
    this.request = const ApplicationResponseUploadCreateRequest(),
    this.response = const ApplicationResponseUploadCreateResponse(),
    this.priceError = false,
    this.errorPriceText = '',
    this.deliverDateError = false,
    this.errorDeliverDateText = '',
    this.isAvailableSelected = false,
    this.availableSelectedError = false,
    this.errorAvailableSelectedText = '',
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    ApplicationResponseUploadCreateRequest? request,
    ApplicationResponseUploadCreateResponse? response,
    bool? priceError,
    String? errorPriceText,
    bool? deliverDateError,
    String? errorDeliverDateText,
    bool? isAvailableSelected,
    bool? availableSelectedError,
    String? errorAvailableSelectedText,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      request: request ?? this.request,
      response: response ?? this.response,
      priceError: priceError ?? this.priceError,
      errorPriceText: errorPriceText ?? this.errorPriceText,
      deliverDateError: deliverDateError ?? this.deliverDateError,
      errorDeliverDateText: errorDeliverDateText ?? this.errorDeliverDateText,
      isAvailableSelected: isAvailableSelected ?? this.isAvailableSelected,
      availableSelectedError: availableSelectedError ?? this.availableSelectedError,
      errorAvailableSelectedText: errorAvailableSelectedText ?? this.errorAvailableSelectedText,
    );
  }
}
