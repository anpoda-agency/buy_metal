import 'package:buy_metal_app/data/models/application_models/application_get_customer_applications_response.dart';
import 'package:buy_metal_app/domain/repository/application_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'buyer_orders_list_event.dart';
part 'buyer_orders_list_state.dart';

class BuyerOrdersListBloc extends Bloc<BuyerOrdersListEvent, BuyerOrdersListState> {
  final ApplicationRepository applicationRepository;
  //final ApplicationGetCustomerApplicationsResponse applicationModel;
  BuyerOrdersListBloc({
    //required this.applicationModel,
    required this.applicationRepository,
    required PageState pageState,
  }) : super(BuyerOrdersListInitial(pageState)) {
    on<BuyerOrdersListInit>(buyerOrdersListInit);
    on<BuyerOrdersListMsgErr>(buyerOrdersListMsgErr);
    add(BuyerOrdersListInit());
  }

  buyerOrdersListInit(BuyerOrdersListInit event, emit) async {
    //var model = applicationModel;

    emit(BuyerOrdersListUp(state.pageState));
  }

  buyerOrdersListMsgErr(BuyerOrdersListMsgErr event, emit) async {
    emit(BuyerOrdersListError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(BuyerOrdersListMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
