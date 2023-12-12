// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_similar_proposal_bloc.dart';

abstract class CreateSimilarProposalState {
  final PageState pageState;
  const CreateSimilarProposalState(this.pageState);
}

class CreateSimilarProposalInitialState extends CreateSimilarProposalState {
  const CreateSimilarProposalInitialState(PageState pageState) : super(pageState);
}

class CreateSimilarProposalUpState extends CreateSimilarProposalState {
  const CreateSimilarProposalUpState(PageState pageState) : super(pageState);
}

class CreateSimilarProposalInputErrorState extends CreateSimilarProposalState {
  const CreateSimilarProposalInputErrorState(PageState pageState) : super(pageState);
}

class CreateSimilarProposalErrorState extends CreateSimilarProposalState {
  const CreateSimilarProposalErrorState(PageState pageState) : super(pageState);
}

class CreateSimilarProposalAllowedToPushState extends CreateSimilarProposalState {
  const CreateSimilarProposalAllowedToPushState(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final ApplicationResponseUploadCreateRequest request;
  final ApplicationResponseUploadCreateResponse response;

  final bool rolledTypeError;
  final String errorRolledTypeText;
  final bool rolledSizeError;
  final String errorRolledSizeText;
  final bool rolledParamsError;
  final String errorRolledParamsText;
  final bool materialBrandError;
  final String errorMaterialBrandText;

  final bool priceError;
  final String errorPriceText;
  final bool deliverDateError;
  final String errorDeliverDateText;
  final bool isAvailableSelected;
  final bool availableSelectedError;
  final String errorAvailableSelectedText;

  const PageState({
    this.rolledTypeError = false,
    this.errorRolledTypeText = '',
    this.rolledSizeError = false,
    this.errorRolledSizeText = '',
    this.rolledParamsError = false,
    this.errorRolledParamsText = '',
    this.materialBrandError = false,
    this.errorMaterialBrandText = '',
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
    bool? rolledTypeError,
    String? errorRolledTypeText,
    bool? rolledSizeError,
    String? errorRolledSizeText,
    bool? rolledParamsError,
    String? errorRolledParamsText,
    bool? materialBrandError,
    String? errorMaterialBrandText,
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
      rolledTypeError: rolledTypeError ?? this.rolledTypeError,
      errorRolledTypeText: errorRolledTypeText ?? this.errorRolledTypeText,
      rolledSizeError: rolledSizeError ?? this.rolledSizeError,
      errorRolledSizeText: errorRolledSizeText ?? this.errorRolledSizeText,
      rolledParamsError: rolledParamsError ?? this.rolledParamsError,
      errorRolledParamsText: errorRolledParamsText ?? this.errorRolledParamsText,
      materialBrandError: materialBrandError ?? this.materialBrandError,
      errorMaterialBrandText: errorMaterialBrandText ?? this.errorMaterialBrandText,
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
