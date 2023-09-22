// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'reg_confirm_conditions_bloc.dart';

abstract class RegConfirmConditionsState {
  final PageState pageState;
  const RegConfirmConditionsState(this.pageState);
}

class RegConfirmConditionsInitialState extends RegConfirmConditionsState {
  const RegConfirmConditionsInitialState(PageState pageState) : super(pageState);
}

class RegConfirmConditionsUpState extends RegConfirmConditionsState {
  const RegConfirmConditionsUpState(PageState pageState) : super(pageState);
}

class RegConfirmConditionsErrorState extends RegConfirmConditionsState {
  const RegConfirmConditionsErrorState(PageState pageState) : super(pageState);
}

class RegConfirmConditionsAllowedToPushState extends RegConfirmConditionsState {
  const RegConfirmConditionsAllowedToPushState(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;

  final AuthUploadRegisterNewUserResponse response;

  const PageState({
    this.onAwait = false,
    this.errMsg = '',
    this.response = const AuthUploadRegisterNewUserResponse(),
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    AuthUploadRegisterNewUserResponse? response,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      response: response ?? this.response,
    );
  }
}
