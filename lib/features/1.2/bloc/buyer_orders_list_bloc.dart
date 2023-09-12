import 'package:buy_metal_app/data/models/application_models/application_get_customer_applications_response.dart';
import 'package:buy_metal_app/domain/repository/application_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
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
  }) : super(BuyerOrdersListInitial(pageState)) {
    on<BuyerOrdersListInit>(buyerOrdersListInit);
    on<BuyerOrdersListMsgErr>(buyerOrdersListMsgErr);
    add(BuyerOrdersListInit());
  }

  buyerOrdersListInit(BuyerOrdersListInit event, emit) async {
    emit(BuyerOrdersListUp(state.pageState.copyWith(onAwait: true)));
    //var model = applicationModel;
    //var model = applicationRepository.customerApplication;

    var userId = userRepository.user?.user.id ?? '';
    //var userId = applicationRepository.customerApplication.customer.id;
    //var token = userRepository.user?.accessToken;

    //var model = state.pageState.
    var token = userRepository.user?.accessToken;

    var res = await applicationRepository.applicationGetCustomerApplications(path: userId, accessToken: token);
    /* List<ApplicationGetCustomerApplicationsResponse> listApplcations = [];
    if (res is List<dynamic>) {
      //List<ApplicationGetCustomerApplicationsResponse> list = [];
      for (dynamic item in res as List<dynamic>) {
        listApplcations.add(ApplicationGetCustomerApplicationsResponse.fromJson(item as Map<String, dynamic>));
      }
    } */
    print(res);
    emit(BuyerOrdersListUp(state.pageState.copyWith(listApplcations: res, onAwait: false)));
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
