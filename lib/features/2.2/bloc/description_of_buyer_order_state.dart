// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'description_of_buyer_order_bloc.dart';

abstract class DescriptionOfBuyerOrderState {
  final PageState pageState;
  const DescriptionOfBuyerOrderState(this.pageState);
}

class DescriptionOfBuyerOrderInitial extends DescriptionOfBuyerOrderState {
  const DescriptionOfBuyerOrderInitial(PageState pageState) : super(pageState);
}

class DescriptionOfBuyerOrderUp extends DescriptionOfBuyerOrderState {
  const DescriptionOfBuyerOrderUp(PageState pageState) : super(pageState);
}

class DescriptionOfBuyerOrderError extends DescriptionOfBuyerOrderState {
  const DescriptionOfBuyerOrderError(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  //final ApplicationRepository applicationRepository;
  final ApplicationUploadSearchResponse applicationInfo;

  const PageState({
    this.onAwait = false,
    this.errMsg = '',
    //this.applicationRepository = const ApplicationRepository(),
    this.applicationInfo = const ApplicationUploadSearchResponse(),
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    ApplicationUploadSearchResponse? applicationInfo,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      applicationInfo: applicationInfo ?? this.applicationInfo,
    );
  }
}
