import 'package:buy_metal_app/data/models/deal_models/deal_get_find_deal_by_id_response.dart';
import 'package:buy_metal_app/domain/repository/deal_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'buyer_deal_supplier_contacts_event.dart';
part 'buyer_deal_supplier_contacts_state.dart';

class BuyerDealSupplierContactsBloc extends Bloc<BuyerDealSupplierContactsEvent, BuyerDealSupplierContactsState> {
  final DealRepository dealRepository;
  BuyerDealSupplierContactsBloc({
    required this.dealRepository,
    required PageState pageState,
  }) : super(BuyerDealSupplierContactsInitial(pageState)) {
    on<BuyerDealSupplierContactsInit>(buyerDealSupplierContactsInit);
    on<BuyerDealSupplierContactsMsgErr>(buyerDealSupplierContactsMsgErr);
    add(BuyerDealSupplierContactsInit());
  }

  buyerDealSupplierContactsInit(BuyerDealSupplierContactsInit event, emit) async {
    var model = dealRepository.deal;

    emit(BuyerDealSupplierContactsUp(state.pageState.copyWith(dealByIdInfo: model)));
  }

  buyerDealSupplierContactsMsgErr(BuyerDealSupplierContactsMsgErr event, emit) async {
    emit(BuyerDealSupplierContactsError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(BuyerDealSupplierContactsMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
