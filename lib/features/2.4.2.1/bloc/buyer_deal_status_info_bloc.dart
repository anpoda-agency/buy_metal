import 'package:buy_metal_app/data/models/deal_models/deal_get_find_deal_by_id_response.dart';
import 'package:buy_metal_app/data/models/deal_models/deal_upload_update_order_status_request.dart';
import 'package:buy_metal_app/data/models/deal_models/deal_upload_update_order_status_response.dart';
import 'package:buy_metal_app/domain/repository/deal_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'buyer_deal_status_info_event.dart';
part 'buyer_deal_status_info_state.dart';

class BuyerDealStatusInfoBloc extends Bloc<BuyerDealStatusInfoEvent, BuyerDealStatusInfoState> {
  final String orderId;
  final DealRepository dealRepository;
  final UserRepository userRepository;
  BuyerDealStatusInfoBloc({
    required this.orderId,
    required this.dealRepository,
    required this.userRepository,
    required PageState pageState,
  }) : super(BuyerDealStatusInfoInitialState(pageState)) {
    on<BuyerDealStatusInfoInitEvent>(buyerDealStatusInfoInit);
    on<BuyerDealStatusInfoMsgErrEvent>(buyerDealStatusInfoMsgErr);
    on<BuyerDealStatusInfoOpenSupplierContactsInfoEvent>(buyerDealStatusInfoOpenSupplierContactsInfo);
    on<BuyerDealStatusInfoOpenSupplierProposalInfoEvent>(buyerDealStatusInfoOpenSupplierProposalInfo);
    on<BuyerDealStatusInfoConfirmPaymentEvent>(buyerDealStatusInfoConfirmPayment);
    on<BuyerDealStatusInfoConfirmReceiptProductEvent>(buyerDealStatusInfoConfirmReceiptProduct);
    on<BuyerDealStatusInfoCancelDealEvent>(buyerDealStatusInfoCancelDeal);

    add(BuyerDealStatusInfoInitEvent());
  }

  buyerDealStatusInfoInit(BuyerDealStatusInfoInitEvent event, emit) async {
    var accessToken = userRepository.user?.accessToken;

    var res = await dealRepository.dealGetFindDealById(path: orderId, accessToken: accessToken);

    await dealRepository.setDealData(deal: res);

    emit(BuyerDealStatusInfoUpState(state.pageState.copyWith(response: res)));

    if (res.status == 'AGREED') {
      emit(BuyerDealStatusInfoUpState(state.pageState.copyWith(
        isConfirmDeal: true,
      )));
    }
    if (res.status == 'WAITING_PAYMENT') {
      emit(BuyerDealStatusInfoUpState(state.pageState.copyWith(
        isConfirmDeal: true,
        isConfirmSupply: true,
      )));
    }
    if (res.status == 'DELIVERY') {
      emit(BuyerDealStatusInfoUpState(state.pageState.copyWith(
        isConfirmDeal: true,
        isConfirmSupply: true,
        isConfirmPayment: true,
      )));
    }
    if (res.status == 'COMPLETED') {
      emit(BuyerDealStatusInfoUpState(state.pageState.copyWith(
        isConfirmDeal: true,
        isConfirmSupply: true,
        isConfirmPayment: true,
        isConfirmReceiptProduct: true,
      )));
    }
  }

  buyerDealStatusInfoOpenSupplierContactsInfo(BuyerDealStatusInfoOpenSupplierContactsInfoEvent event, emit) async {
    emit(BuyerDealStatusInfoOpenSupplierContactsInfoState(state.pageState));
  }

  buyerDealStatusInfoOpenSupplierProposalInfo(BuyerDealStatusInfoOpenSupplierProposalInfoEvent event, emit) async {
    emit(BuyerDealStatusInfoOpenSupplierProposalInfoState(state.pageState));
  }

  buyerDealStatusInfoConfirmPayment(BuyerDealStatusInfoConfirmPaymentEvent event, emit) async {
    //var model = dealRepository.deal?.copyWith();
    var accessToken = userRepository.user?.accessToken;

    var model = state.pageState.requestUpdateStatus.copyWith(
      initiatorId: userRepository.user?.user.id,
      targetStatus: 'DELIVERY',
    );

    var res = await dealRepository.dealUploadUpdateOrderStatus(
      request: model,
      path: orderId,
      accessToken: accessToken,
      //userRepository.user?.user.id ?? '',
    );

    emit(BuyerDealStatusInfoConfirmPaymentState(state.pageState.copyWith(responseUpdateStatus: res)));
  }

  buyerDealStatusInfoConfirmReceiptProduct(BuyerDealStatusInfoConfirmReceiptProductEvent event, emit) async {
    //var model = dealRepository.deal?.copyWith();
    var accessToken = userRepository.user?.accessToken;

    var model = state.pageState.requestUpdateStatus.copyWith(
      initiatorId: userRepository.user?.user.id,
      targetStatus: 'COMPLETED',
    );

    var res = await dealRepository.dealUploadUpdateOrderStatus(
      request: model,
      path: orderId,
      accessToken: accessToken,
      //userRepository.user?.user.id ?? '',
    );

    emit(BuyerDealStatusInfoConfirmReceiptProductState(state.pageState.copyWith(responseUpdateStatus: res)));
  }

  buyerDealStatusInfoCancelDeal(BuyerDealStatusInfoCancelDealEvent event, emit) async {
    //var model = dealRepository.deal?.copyWith();
    var accessToken = userRepository.user?.accessToken;

    var model = state.pageState.requestUpdateStatus.copyWith(
      initiatorId: userRepository.user?.user.id,
      targetStatus: 'REJECTED',
    );

    var res = await dealRepository.dealUploadUpdateOrderStatus(
      request: model,
      path: orderId,
      accessToken: accessToken,
      //userRepository.user?.user.id ?? '',
    );

    emit(BuyerDealStatusInfoCancelDealState(state.pageState.copyWith(responseUpdateStatus: res)));
    //emit(SupplierDealStatusInfoCancelDealState(state.pageState));
  }

  buyerDealStatusInfoMsgErr(BuyerDealStatusInfoMsgErrEvent event, emit) async {
    emit(BuyerDealStatusInfoErrorState(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(BuyerDealStatusInfoMsgErrEvent(error.toString()));
    super.onError(error, stackTrace);
  }
}
