import 'package:buy_metal_app/data/models/deal_models/deal_get_find_deal_by_id_response.dart';
import 'package:buy_metal_app/domain/repository/deal_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'supplier_deal_supplier_proposal_event.dart';
part 'supplier_deal_supplier_proposal_state.dart';

class SupplierDealSupplierProposalBloc
    extends Bloc<SupplierDealSupplierProposalEvent, SupplierDealSupplierProposalState> {
  final DealRepository dealRepository;
  SupplierDealSupplierProposalBloc({
    required this.dealRepository,
    required PageState pageState,
  }) : super(SupplierDealSupplierProposalInitial(pageState)) {
    on<SupplierDealSupplierProposalInit>(supplierDealSupplierProposalInit);
    on<SupplierDealSupplierProposalMsgErr>(supplierDealSupplierProposalMsgErr);
    add(SupplierDealSupplierProposalInit());
  }

  supplierDealSupplierProposalInit(SupplierDealSupplierProposalInit event, emit) async {
    var model = dealRepository.deal;

    emit(SupplierDealSupplierProposalUp(state.pageState.copyWith(dealByIdInfo: model)));
  }

  supplierDealSupplierProposalMsgErr(SupplierDealSupplierProposalMsgErr event, emit) async {
    emit(SupplierDealSupplierProposalError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(SupplierDealSupplierProposalMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
