part of 'supplier_proposal_description_bloc.dart';

abstract class SupplierProposalDescriptionState {
  final PageState pageState;
  const SupplierProposalDescriptionState(this.pageState);
}

class SupplierProposalDescriptionInitial extends SupplierProposalDescriptionState {
  const SupplierProposalDescriptionInitial(PageState pageState) : super(pageState);
}

class SupplierProposalDescriptionUp extends SupplierProposalDescriptionState {
  const SupplierProposalDescriptionUp(PageState pageState) : super(pageState);
}

class SupplierProposalDescriptionError extends SupplierProposalDescriptionState {
  const SupplierProposalDescriptionError(PageState pageState) : super(pageState);
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
