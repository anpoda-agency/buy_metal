part of 'reg_bloc.dart';

abstract class RegState {
  final PageState pageState;
  const RegState(this.pageState);
}

class RegInitial extends RegState {
  const RegInitial(PageState pageState) : super(pageState);
}

class RegUp extends RegState {
  const RegUp(PageState pageState) : super(pageState);
}

class RegError extends RegState {
  const RegError(PageState pageState) : super(pageState);
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
