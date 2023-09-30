import 'package:buy_metal_app/data/models/application_models/application_get_responses_by_application_id_response.dart';
import 'package:buy_metal_app/data/models/deal_models/deal_upload_create_deal_request.dart';
import 'package:buy_metal_app/data/models/deal_models/deal_upload_create_deal_response.dart';
import 'package:buy_metal_app/domain/repository/application_repository.dart';
import 'package:buy_metal_app/domain/repository/deal_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'description_of_supplier_proposal_event.dart';
part 'description_of_supplier_proposal_state.dart';

class DescriptionOfSupplierProposalBloc
    extends Bloc<DescriptionOfSupplierProposalEvent, DescriptionOfSupplierProposalState> {
  final ApplicationGetResponsesByApplicationIdResponse infoForDeal;
  final DealRepository dealRepository;
  final ApplicationRepository applicationRepository;
  final UserRepository userRepository;
  DescriptionOfSupplierProposalBloc({
    required this.infoForDeal,
    required this.dealRepository,
    required this.applicationRepository,
    required this.userRepository,
    required PageState pageState,
  }) : super(DescriptionOfSupplierProposalInitialState(pageState)) {
    on<DescriptionOfSupplierProposalInitEvent>(descriptionOfSupplierProposalInit);
    on<DescriptionOfSupplierProposalMsgErrEvent>(descriptionOfSupplierProposalMsgErr);
    on<DescriptionOfSupplierProposalConfirmDealEvent>(descriptionOfSupplierProposalConfirmDeal);
    add(DescriptionOfSupplierProposalInitEvent());
  }

  descriptionOfSupplierProposalInit(DescriptionOfSupplierProposalInitEvent event, emit) async {
    emit(DescriptionOfSupplierProposalUpState(state.pageState));
  }

  descriptionOfSupplierProposalConfirmDeal(DescriptionOfSupplierProposalConfirmDealEvent event, emit) async {
    var model = state.pageState.request
        .copyWith(applicationId: applicationRepository.customerApplication?.id, applicationResponseId: infoForDeal.id);

    var userAccessToken = userRepository.user?.accessToken;

    var res = await dealRepository.dealUploadCreateDeal(request: model, accessToken: userAccessToken);
    emit(DescriptionOfSupplierProposalConfirmDealState(state.pageState.copyWith(response: res)));
  }

  descriptionOfSupplierProposalMsgErr(DescriptionOfSupplierProposalMsgErrEvent event, emit) async {
    emit(DescriptionOfSupplierProposalErrorState(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(DescriptionOfSupplierProposalMsgErrEvent(error.toString()));
    super.onError(error, stackTrace);
  }
}
