import 'package:flutter_bloc/flutter_bloc.dart';

part 'buyer_deals_event.dart';
part 'buyer_deals_state.dart';

class BuyerDealsBloc extends Bloc<BuyerDealsEvent, BuyerDealsState> {
  BuyerDealsBloc({
    required PageState pageState,
  }) : super(BuyerDealsInitial(pageState)) {
    on<BuyerDealsInit>(buyerDealsInit);
    on<BuyerDealsMsgErr>(buyerDealsMsgErr);
    add(BuyerDealsInit());
  }

  buyerDealsInit(BuyerDealsInit event, emit) async {
    emit(BuyerDealsUp(state.pageState));
  }

  buyerDealsMsgErr(BuyerDealsMsgErr event, emit) async {
    emit(BuyerDealsError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(BuyerDealsMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
