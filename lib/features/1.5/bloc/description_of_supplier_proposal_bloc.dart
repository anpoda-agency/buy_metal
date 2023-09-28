import 'package:flutter_bloc/flutter_bloc.dart';

part 'description_of_supplier_proposal_event.dart';
part 'description_of_supplier_proposal_state.dart';

class DescriptionOfSupplierProposalBloc
    extends Bloc<DescriptionOfSupplierProposalEvent, DescriptionOfSupplierProposalState> {
  DescriptionOfSupplierProposalBloc({
    required PageState pageState,
  }) : super(DescriptionOfSupplierProposalInitialState(pageState)) {
    on<DescriptionOfSupplierProposalInitEvent>(descriptionOfSupplierProposalInit);
    on<DescriptionOfSupplierProposalMsgErrEvent>(descriptionOfSupplierProposalMsgErr);
    on<DescriptionOfSupplierProposalConfirmDealEvent>(descriptionOfSupplierProposalConfirmDeal);
    add(DescriptionOfSupplierProposalInitEvent());
  }

  descriptionOfSupplierProposalInit(DescriptionOfSupplierProposalInitEvent event, emit) async {
    emit(DescriptionOfSupplierProposalUpState(state.pageState));
  }

  descriptionOfSupplierProposalConfirmDeal(DescriptionOfSupplierProposalConfirmDealEvent event, emit) async {
    emit(DescriptionOfSupplierProposalConfirmDealState(state.pageState));
  }

  descriptionOfSupplierProposalMsgErr(DescriptionOfSupplierProposalMsgErrEvent event, emit) async {
    emit(DescriptionOfSupplierProposalErrorState(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(DescriptionOfSupplierProposalMsgErrEvent(error.toString()));
    super.onError(error, stackTrace);
  }
}
