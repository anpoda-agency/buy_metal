import 'package:buy_metal_app/data/models/deal_models/deal_get_find_deal_by_id_response.dart';
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
    add(BuyerDealStatusInfoInitEvent());
  }

  buyerDealStatusInfoInit(BuyerDealStatusInfoInitEvent event, emit) async {
    var accessToken = userRepository.user?.accessToken;

    var res = await dealRepository.dealGetFindDealById(path: orderId, accessToken: accessToken);

    emit(BuyerDealStatusInfoUpState(state.pageState.copyWith(response: res)));
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
