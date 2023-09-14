import 'package:buy_metal_app/data/models/application_models/application_upload_search_response.dart';
import 'package:buy_metal_app/data/models/application_response_models/application_response_upload_create_request.dart';
import 'package:buy_metal_app/data/models/application_response_models/application_response_upload_create_response.dart';
import 'package:buy_metal_app/domain/repository/application_response_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_compliance_proposal_event.dart';
part 'create_compliance_proposal_state.dart';

class CreateComplianceProposalBloc extends Bloc<CreateComplianceProposalEvent, CreateComplianceProposalState> {
  final ApplicationUploadSearchResponse applicationInfo;
  //final ApplicationResponseUploadCreateRequest applicationRequest;
  final ApplicationResponseRepository applicationResponseRepository;
  final UserRepository userRepository;
  CreateComplianceProposalBloc({
    required this.applicationInfo,
    //required this.applicationRequest,
    required this.applicationResponseRepository,
    required this.userRepository,
    required PageState pageState,
  }) : super(CreateComplianceProposalInitial(pageState)) {
    on<CreateComplianceProposalInit>(createComplianceProposalInit);
    on<CreateComplianceProposalMsgErr>(createComplianceProposalMsgErr);
    on<CreateComplianceProposalInputPrice>(createComplianceProposalInputPrice);
    on<CreateComplianceProposalInputFullPrice>(createComplianceProposalInputFullPrice);
    on<CreateComplianceProposalInputDeliverDate>(createComplianceProposalInputDeliverDate);
    on<CreateComplianceProposalInputInStock>(createComplianceProposalInputInStock);
    on<CreateComplianceProposalSendProposal>(createComplianceProposalSendProposal);
    add(CreateComplianceProposalInit());
  }

  createComplianceProposalInit(CreateComplianceProposalInit event, emit) async {
    var userId = userRepository.user?.user.id;
    var model = state.pageState.request.copyWith(
      amount: applicationInfo.amount,
      applicationId: applicationInfo.id,
      creationDate: applicationInfo.creationDate,
      materialBrand: applicationInfo.materialBrand,
      materialGost: applicationInfo.materialGost,
      materialParams: applicationInfo.materialParams,
      rolledForm: applicationInfo.rolledForm,
      rolledGost: applicationInfo.rolledGost,
      rolledParams: applicationInfo.rolledParams,
      rolledSize: applicationInfo.rolledSize,
      rolledType: applicationInfo.rolledType,
      similar: false,
      userID: userId,
    );

    emit(CreateComplianceProposalUp(state.pageState.copyWith(request: model)));
  }

  createComplianceProposalMsgErr(CreateComplianceProposalMsgErr event, emit) async {
    emit(CreateComplianceProposalError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  createComplianceProposalInputPrice(CreateComplianceProposalInputPrice event, emit) async {
    var model = state.pageState.request.copyWith(price: event.value);
    emit(CreateComplianceProposalUp(state.pageState.copyWith(request: model)));
  }

  createComplianceProposalInputFullPrice(CreateComplianceProposalInputFullPrice event, emit) async {
    var model = state.pageState.request.copyWith(fullPrice: event.value);
    emit(CreateComplianceProposalUp(state.pageState.copyWith(request: model)));
  }

  createComplianceProposalInputDeliverDate(CreateComplianceProposalInputDeliverDate event, emit) async {
    var model = state.pageState.request.copyWith(deliverDate: event.value);
    emit(CreateComplianceProposalUp(state.pageState.copyWith(request: model)));
  }

  createComplianceProposalInputInStock(CreateComplianceProposalInputInStock event, emit) async {
    var model = state.pageState.request.copyWith(inStock: event.value);
    emit(CreateComplianceProposalUp(state.pageState.copyWith(request: model)));
  }

  createComplianceProposalSendProposal(CreateComplianceProposalSendProposal event, emit) async {
    //var model = state.pageState.request.copyWith(position: event.value);
    var token = userRepository.user?.accessToken;

    var res = await applicationResponseRepository.applicationResponseUploadCreate(
        request: state.pageState.request, accessToken: token);
    emit(CreateComplianceProposalAllowedToPush(state.pageState.copyWith(
      response: res,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(CreateComplianceProposalMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
