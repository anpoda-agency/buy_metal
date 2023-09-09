// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_order_bloc.dart';

abstract class CreateOrderState {
  final PageState pageState;
  const CreateOrderState(this.pageState);
}

class CreateOrderInitial extends CreateOrderState {
  const CreateOrderInitial(PageState pageState) : super(pageState);
}

class CreateOrderUp extends CreateOrderState {
  const CreateOrderUp(PageState pageState) : super(pageState);
}

class CreateOrderError extends CreateOrderState {
  const CreateOrderError(PageState pageState) : super(pageState);
}

class CreateOrderAllowedToPush extends CreateOrderState {
  const CreateOrderAllowedToPush(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final ApplicationUploadCreateApplicationRequest request;
  final ApplicationUploadCreateApplicationResponse response;
  final String creationDate;
  final String userId;

  const PageState({
    this.onAwait = false,
    this.errMsg = '',
    this.request = const ApplicationUploadCreateApplicationRequest(),
    this.response = const ApplicationUploadCreateApplicationResponse(),
    this.creationDate = '',
    this.userId = '',
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    ApplicationUploadCreateApplicationRequest? request,
    ApplicationUploadCreateApplicationResponse? response,
    String? creationDate,
    String? userId,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      request: request ?? this.request,
      response: response ?? this.response,
      creationDate: creationDate ?? this.creationDate,
      userId: userId ?? this.userId,
    );
  }
}
