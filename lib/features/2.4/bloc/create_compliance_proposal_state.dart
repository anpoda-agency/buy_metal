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

  const PageState({
    this.onAwait = false,
    this.errMsg = '',
    this.request = const ApplicationResponseUploadCreateRequest(),
    this.response = const ApplicationResponseUploadCreateResponse(),
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    ApplicationResponseUploadCreateRequest? request,
    ApplicationResponseUploadCreateResponse? response,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      request: request ?? this.request,
      response: response ?? this.response,
    );
  }
}
