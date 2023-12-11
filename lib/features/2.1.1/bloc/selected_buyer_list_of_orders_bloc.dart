import 'dart:async';

import 'package:buy_metal_app/data/models/application_models/application_upload_search_request.dart';
import 'package:buy_metal_app/data/models/application_models/application_upload_search_response.dart';
import 'package:buy_metal_app/data/storage/enum.dart';
import 'package:buy_metal_app/domain/repository/application_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:buy_metal_app/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'selected_buyer_list_of_orders_event.dart';
part 'selected_buyer_list_of_orders_state.dart';

class SelectedBuyerListOfOrdersBloc extends Bloc<SelectedBuyerListOfOrdersEvent, SelectedBuyerListOfOrdersState> {
  final ApplicationRepository applicationRepository;
  final UserRepository userRepository;
  SelectedBuyerListOfOrdersBloc({
    required this.applicationRepository,
    required this.userRepository,
    required PageState pageState,
  }) : super(SelectedBuyerListOfOrdersInitial(pageState)) {
    on<SelectedBuyerListOfOrdersInit>(selectedBuyerListOfOrdersInit);
    on<SelectedBuyerListOfOrdersMsgErr>(selectedBuyerListOfOrdersMsgErr);
    add(SelectedBuyerListOfOrdersInit());
    subGS = globalStream.stream.listen(_refresh);
  }

  StreamSubscription<GlobalEvents>? subGS;

  _refresh(GlobalEvents event) {
    if (event == GlobalEvents.createOrder) {
      add(SelectedBuyerListOfOrdersInit());
    }
  }

  selectedBuyerListOfOrdersInit(SelectedBuyerListOfOrdersInit event, emit) async {
    var token = userRepository.user?.accessToken;
    var status = state.pageState.request.copyWith(statuses: ['OPEN']);
    var res = await applicationRepository.applicationUploadSearch(request: status, accessToken: token);

    emit(SelectedBuyerListOfOrdersUp(state.pageState.copyWith(response: res)));
  }

  selectedBuyerListOfOrdersMsgErr(SelectedBuyerListOfOrdersMsgErr event, emit) async {
    emit(SelectedBuyerListOfOrdersError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(SelectedBuyerListOfOrdersMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
