import 'package:buy_metal_app/data/models/application_models/application_upload_create_application_response.dart';
import 'package:buy_metal_app/data/models/application_models/application_upload_search_response.dart';
import 'package:buy_metal_app/domain/repository/application_repository.dart';
import 'package:buy_metal_app/domain/repository/application_response_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'description_of_buyer_order_event.dart';
part 'description_of_buyer_order_state.dart';

class DescriptionOfBuyerOrderBloc extends Bloc<DescriptionOfBuyerOrderEvent, DescriptionOfBuyerOrderState> {
  //final ApplicationResponseRepository applicationResponseRepository;
  final ApplicationUploadSearchResponse applicationInfo;
  //final ApplicationRepository applicationRepository;
  DescriptionOfBuyerOrderBloc({
    //required this.applicationResponseRepository,
    required this.applicationInfo,
    //required this.applicationRepository,
    required PageState pageState,
  }) : super(DescriptionOfBuyerOrderInitial(pageState)) {
    on<DescriptionOfBuyerOrderInit>(descriptionOfBuyerOrderInit);
    on<DescriptionOfBuyerOrderMsgErr>(descriptionOfBuyerOrderMsgErr);
    add(DescriptionOfBuyerOrderInit());
  }

  descriptionOfBuyerOrderInit(DescriptionOfBuyerOrderInit event, emit) async {
    //var model = applicationInfo;

    emit(DescriptionOfBuyerOrderUp(state.pageState.copyWith(applicationInfo: applicationInfo)));
  }

  descriptionOfBuyerOrderMsgErr(DescriptionOfBuyerOrderMsgErr event, emit) async {
    emit(DescriptionOfBuyerOrderError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(DescriptionOfBuyerOrderMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
