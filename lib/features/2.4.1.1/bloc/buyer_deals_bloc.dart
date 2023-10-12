import 'package:buy_metal_app/data/models/deal_models/deal_upload_search_request.dart';
import 'package:buy_metal_app/data/models/deal_models/deal_upload_search_response.dart';
import 'package:buy_metal_app/domain/repository/deal_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'buyer_deals_event.dart';
part 'buyer_deals_state.dart';

class BuyerDealsBloc extends Bloc<BuyerDealsEvent, BuyerDealsState> {
  final UserRepository userRepository;
  final DealRepository dealRepository;
  BuyerDealsBloc({
    required this.userRepository,
    required this.dealRepository,
    required PageState pageState,
  }) : super(BuyerDealsInitialState(pageState)) {
    on<BuyerDealsInitEvent>(buyerDealsInit);
    on<BuyerDealsMsgErrEvent>(buyerDealsMsgErr);
    add(BuyerDealsInitEvent());
  }

  buyerDealsInit(BuyerDealsInitEvent event, emit) async {
    var buyerId = userRepository.user?.user.id;
    var userAccessToken = userRepository.user?.accessToken;

    var model = state.pageState.request.copyWith(customerId: buyerId, limit: 15, offset: 1, statuses: ["OPEN"]);

    var res = await dealRepository.dealUploadSearch(request: model, accessToken: userAccessToken);

    emit(BuyerDealsGetDealsState(state.pageState.copyWith(response: res)));
  }

  buyerDealsMsgErr(BuyerDealsMsgErrEvent event, emit) async {
    emit(BuyerDealsErrorState(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(BuyerDealsMsgErrEvent(error.toString()));
    super.onError(error, stackTrace);
  }
}
