import 'package:buy_metal_app/data/models/deal_models/deal_get_find_deal_by_id_response.dart';
import 'package:buy_metal_app/domain/repository/deal_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'buyer_deal_supplier_proposal_event.dart';
part 'buyer_deal_supplier_proposal_state.dart';

class BuyerDealSupplierProposalBloc extends Bloc<BuyerDealSupplierProposalEvent, BuyerDealSupplierProposalState> {
  final DealRepository dealRepository;
  BuyerDealSupplierProposalBloc({
    required this.dealRepository,
    required PageState pageState,
  }) : super(BuyerDealSupplierProposalInitial(pageState)) {
    on<BuyerDealSupplierProposalInit>(buyerDealSupplierProposalInit);
    on<BuyerDealSupplierProposalMsgErr>(buyerDealSupplierProposalMsgErr);
    add(BuyerDealSupplierProposalInit());
  }

  buyerDealSupplierProposalInit(BuyerDealSupplierProposalInit event, emit) async {
    var model = dealRepository.deal;

    emit(BuyerDealSupplierProposalUp(state.pageState.copyWith(dealByIdInfo: model)));
  }

  buyerDealSupplierProposalMsgErr(BuyerDealSupplierProposalMsgErr event, emit) async {
    emit(BuyerDealSupplierProposalError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(BuyerDealSupplierProposalMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
