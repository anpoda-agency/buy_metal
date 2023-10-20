import 'package:buy_metal_app/data/models/deal_models/deal_get_find_deal_by_id_response.dart';
import 'package:buy_metal_app/domain/repository/deal_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'supplier_deal_buyer_contacts_event.dart';
part 'supplier_deal_buyer_contacts_state.dart';

class SupplierDealBuyerContactsBloc extends Bloc<SupplierDealBuyerContactsEvent, SupplierDealBuyerContactsState> {
  final DealRepository dealRepository;
  SupplierDealBuyerContactsBloc({
    required this.dealRepository,
    required PageState pageState,
  }) : super(SupplierDealBuyerContactsInitial(pageState)) {
    on<SupplierDealBuyerContactsInit>(supplierDealBuyerContactsInit);
    on<SupplierDealBuyerContactsMsgErr>(supplierDealBuyerContactsMsgErr);
    add(SupplierDealBuyerContactsInit());
  }

  supplierDealBuyerContactsInit(SupplierDealBuyerContactsInit event, emit) async {
    var model = dealRepository.deal;

    emit(SupplierDealBuyerContactsUp(state.pageState.copyWith(dealByIdInfo: model)));
  }

  supplierDealBuyerContactsMsgErr(SupplierDealBuyerContactsMsgErr event, emit) async {
    emit(SupplierDealBuyerContactsError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(SupplierDealBuyerContactsMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
