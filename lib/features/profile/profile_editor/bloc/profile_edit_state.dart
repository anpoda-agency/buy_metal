part of 'profile_edit_bloc.dart';

abstract class ProfileEditState {
  final PageState pageState;
  const ProfileEditState(this.pageState);
}

class ProfileEditInitial extends ProfileEditState {
  const ProfileEditInitial(PageState pageState) : super(pageState);
}

class ProfileEditUp extends ProfileEditState {
  const ProfileEditUp(PageState pageState) : super(pageState);
}

class ProfileEditError extends ProfileEditState {
  const ProfileEditError(PageState pageState) : super(pageState);
}

class ProfileEditAllowedToPush extends ProfileEditState {
  const ProfileEditAllowedToPush(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;

  const PageState({
    this.onAwait = false,
    this.errMsg = '',
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
    );
  }
}
