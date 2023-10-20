// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'supplier_deals_bloc.dart';

abstract class SupplierDealsState {
  final PageState pageState;
  const SupplierDealsState(this.pageState);
}

class SupplierDealsInitial extends SupplierDealsState {
  const SupplierDealsInitial(PageState pageState) : super(pageState);
}

class SupplierDealsUp extends SupplierDealsState {
  const SupplierDealsUp(PageState pageState) : super(pageState);
}

class SupplierDealsError extends SupplierDealsState {
  const SupplierDealsError(PageState pageState) : super(pageState);
}

class SupplierDealsGetDealsState extends SupplierDealsState {
  const SupplierDealsGetDealsState(PageState pageState) : super(pageState);
}

class PageState {
  final bool onAwait;
  final String errMsg;
  final DealUploadSearchRequest request;
  final List<DealUploadSearchResponse> response;

  const PageState({
    this.onAwait = false,
    this.errMsg = '',
    this.request = const DealUploadSearchRequest(),
    this.response = const [],
  });

  PageState copyWith({
    bool? onAwait,
    String? errMsg,
    DealUploadSearchRequest? request,
    List<DealUploadSearchResponse>? response,
  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      errMsg: errMsg ?? this.errMsg,
      request: request ?? this.request,
      response: response ?? this.response,
    );
  }
}
