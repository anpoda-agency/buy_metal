import 'dart:async';

import 'package:buy_metal_app/data/models/application_models/application_get_customer_applications_response.dart';
import 'package:buy_metal_app/data/models/application_models/application_upload_search_request.dart';
import 'package:buy_metal_app/data/models/application_models/application_upload_search_response.dart';
import 'package:buy_metal_app/data/storage/enum.dart';
import 'package:buy_metal_app/domain/repository/application_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:buy_metal_app/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'buyer_orders_list_event.dart';
part 'buyer_orders_list_state.dart';

class BuyerOrdersListBloc extends Bloc<BuyerOrdersListEvent, BuyerOrdersListState> {
  final ApplicationRepository applicationRepository;
  final UserRepository userRepository;
  //final UserRepository userRepository;
  //final ApplicationGetCustomerApplicationsResponse applicationModel;
  BuyerOrdersListBloc({
    //required this.applicationModel,
    required this.userRepository,
    required this.applicationRepository,
    required PageState pageState,
  }) : super(BuyerOrdersListInitialState(pageState)) {
    on<BuyerOrdersListInitEvent>(buyerOrdersListInit);
    on<BuyerOrdersListMsgErrEvent>(buyerOrdersListMsgErr);
    on<BuyerOrdersListChooseOrderEvent>(buyerOrdersListOrderProposal);
    on<BuyerOrdersListCreateOrderEvent>(buyerOrdersListCreateOrder);
    add(BuyerOrdersListInitEvent());
    subGS = globalStream.stream.listen(_refresh);
  }

  StreamSubscription<GlobalEvents>? subGS;

  _refresh(GlobalEvents event) {
    if (event == GlobalEvents.createOrder) {
      add(BuyerOrdersListInitEvent());
    }
  }

  buyerOrdersListInit(BuyerOrdersListInitEvent event, emit) async {
    emit(BuyerOrdersListUpState(state.pageState.copyWith(onAwait: true)));
    //var model = applicationModel;
    //var model = applicationRepository.customerApplication;
/* 
    var userId = userRepository.user?.user.id ?? '';
    //var userId = applicationRepository.customerApplication.customer.id;
    //var token = userRepository.user?.accessToken;

    //var model = state.pageState.
    var token = userRepository.user?.accessToken;

    var res = await applicationRepository.applicationGetCustomerApplications(path: userId, accessToken: token);
    
    
    emit(BuyerOrdersListUpState(state.pageState.copyWith(listApplcations: res, onAwait: false)));
 */

    var token = userRepository.user?.accessToken;
    var status = state.pageState.request.copyWith(statuses: ['OPEN']);
    var res = await applicationRepository.applicationUploadSearch(request: status, accessToken: token);

    emit(BuyerOrdersListUpState(state.pageState.copyWith(listApplcations: res, onAwait: false)));
  }

  buyerOrdersListOrderProposal(BuyerOrdersListChooseOrderEvent event, emit) async {
    //var model = userRepository.user;
    //var model = state.pageState.copyWith(proposalById: event.proposalById);
    await applicationRepository.setApplicationData(customerApplication: event.applicationResponse);
    emit(BuyerOrdersListChooseOrderState(state.pageState.copyWith(orderById: event.orderById)));
  }

  buyerOrdersListCreateOrder(BuyerOrdersListCreateOrderEvent event, emit) async {
    //var model = userRepository.user;
    emit(BuyerOrdersListCreateOrderState(state.pageState));
  }

  buyerOrdersListMsgErr(BuyerOrdersListMsgErrEvent event, emit) async {
    emit(BuyerOrdersListErrorState(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(BuyerOrdersListMsgErrEvent(error.toString()));
    super.onError(error, stackTrace);
  }
}
