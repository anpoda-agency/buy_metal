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
