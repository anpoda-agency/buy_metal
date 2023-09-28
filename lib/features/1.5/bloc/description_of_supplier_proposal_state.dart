part of 'description_of_supplier_proposal_bloc.dart';

abstract class DescriptionOfSupplierProposalState {
  final PageState pageState;
  const DescriptionOfSupplierProposalState(this.pageState);
}

class DescriptionOfSupplierProposalInitialState extends DescriptionOfSupplierProposalState {
  const DescriptionOfSupplierProposalInitialState(PageState pageState) : super(pageState);
}

class DescriptionOfSupplierProposalUpState extends DescriptionOfSupplierProposalState {
  const DescriptionOfSupplierProposalUpState(PageState pageState) : super(pageState);
}

class DescriptionOfSupplierProposalErrorState extends DescriptionOfSupplierProposalState {
  const DescriptionOfSupplierProposalErrorState(PageState pageState) : super(pageState);
}

class DescriptionOfSupplierProposalConfirmDealState extends DescriptionOfSupplierProposalState {
  const DescriptionOfSupplierProposalConfirmDealState(PageState pageState) : super(pageState);
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
