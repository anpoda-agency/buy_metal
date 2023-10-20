import 'package:buy_metal_app/data/models/deal_models/deal_get_find_deal_by_id_response.dart';
import 'package:buy_metal_app/domain/repository/deal_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'supplier_deal_status_info_event.dart';
part 'supplier_deal_status_info_state.dart';

class SupplierDealStatusInfoBloc extends Bloc<SupplierDealStatusInfoEvent, SupplierDealStatusInfoState> {
  final String orderId;
  final DealRepository dealRepository;
  final UserRepository userRepository;
  SupplierDealStatusInfoBloc({
    required this.orderId,
    required this.dealRepository,
    required this.userRepository,
    required PageState pageState,
  }) : super(SupplierDealStatusInfoInitial(pageState)) {
    on<SupplierDealStatusInfoInit>(supplierDealStatusInfoInit);
    on<SupplierDealStatusInfoMsgErr>(supplierDealStatusInfoMsgErr);
    on<SupplierDealStatusInfoOpenSupplierContactsInfoEvent>(supplierDealStatusInfoOpenSupplierContactsInfo);
    on<SupplierDealStatusInfoOpenSupplierProposalInfoEvent>(supplierDealStatusInfoOpenSupplierProposalInfo);
    add(SupplierDealStatusInfoInit());
  }

  supplierDealStatusInfoInit(SupplierDealStatusInfoInit event, emit) async {
    var accessToken = userRepository.user?.accessToken;

    var res = await dealRepository.dealGetFindDealById(path: orderId, accessToken: accessToken);

    await dealRepository.setDealData(deal: res);

    emit(SupplierDealStatusInfoUp(state.pageState.copyWith(response: res)));
  }

  supplierDealStatusInfoOpenSupplierContactsInfo(
      SupplierDealStatusInfoOpenSupplierContactsInfoEvent event, emit) async {
    emit(SupplierDealStatusInfoOpenSupplierContactsInfoState(state.pageState));
  }

  supplierDealStatusInfoOpenSupplierProposalInfo(
      SupplierDealStatusInfoOpenSupplierProposalInfoEvent event, emit) async {
    emit(SupplierDealStatusInfoOpenSupplierProposalInfoState(state.pageState));
  }

  supplierDealStatusInfoMsgErr(SupplierDealStatusInfoMsgErr event, emit) async {
    emit(SupplierDealStatusInfoError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(SupplierDealStatusInfoMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
