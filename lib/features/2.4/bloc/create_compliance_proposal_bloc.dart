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
      //creationDate: applicationInfo.creationDate,
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
    if (state.pageState.request.price > 0) {
      emit(CreateComplianceProposalUp(state.pageState.copyWith(priceError: false)));
    }
  }

  createComplianceProposalInputFullPrice(CreateComplianceProposalInputFullPrice event, emit) async {
    var model = state.pageState.request.copyWith(fullPrice: event.value);
    emit(CreateComplianceProposalUp(state.pageState.copyWith(request: model)));
  }

  createComplianceProposalInputDeliverDate(CreateComplianceProposalInputDeliverDate event, emit) async {
    var model = state.pageState.request.copyWith(deliverDate: event.value);
    emit(CreateComplianceProposalUp(state.pageState.copyWith(request: model)));
    if (state.pageState.request.deliverDate.length == 10) {
      emit(CreateComplianceProposalUp(state.pageState.copyWith(deliverDateError: false)));
    }
  }

  createComplianceProposalInputInStock(CreateComplianceProposalInputInStock event, emit) async {
    var model = state.pageState.request.copyWith(inStock: event.value);
    emit(CreateComplianceProposalUp(state.pageState.copyWith(request: model, isAvailableSelected: true)));
    if (state.pageState.isAvailableSelected) {
      emit(CreateComplianceProposalUp(state.pageState.copyWith(availableSelectedError: false)));
    }
  }

  createComplianceProposalSendProposal(CreateComplianceProposalSendProposal event, emit) async {
    // Если на складе стоит true, то не должна дата доствки проверяться
    // Еще бага есть, что если не выбрать на складе Да или Нет, то по умолчанию отправляется false.
    if (state.pageState.request.price > 0 && state.pageState.isAvailableSelected) {
      emit(CreateComplianceProposalUp(state.pageState.copyWith(
        priceError: false,
        availableSelectedError: false,
      )));
      if (state.pageState.request.inStock) {
        DateTime now = DateTime.now();

        String creationDate =
            "${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year.toString()} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
        var model = state.pageState.request.copyWith(creationDate: creationDate);
        emit(CreateComplianceProposalUp(state.pageState.copyWith(request: model)));
        //var model = state.pageState.request.copyWith(position: event.value);
        var token = userRepository.user?.accessToken;

        var res = await applicationResponseRepository.applicationResponseUploadCreate(
            request: state.pageState.request, accessToken: token);
        emit(CreateComplianceProposalAllowedToPush(state.pageState.copyWith(
          response: res,
        )));
      } else if (!state.pageState.request.inStock &&
          state.pageState.request.deliverDate.isNotEmpty &&
          state.pageState.request.deliverDate.length == 10) {
        DateTime now = DateTime.now();

        String creationDate =
            "${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year.toString()} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
        var model = state.pageState.request.copyWith(creationDate: creationDate);
        emit(CreateComplianceProposalUp(state.pageState.copyWith(request: model)));
        //var model = state.pageState.request.copyWith(position: event.value);
        var token = userRepository.user?.accessToken;

        var res = await applicationResponseRepository.applicationResponseUploadCreate(
            request: state.pageState.request, accessToken: token);
        emit(CreateComplianceProposalAllowedToPush(state.pageState.copyWith(
          response: res,
        )));
      } else if (state.pageState.request.deliverDate.isEmpty) {
        emit(CreateComplianceProposalInputErrorState(state.pageState.copyWith(
          onAwait: false,
          deliverDateError: true,
          errorDeliverDateText: 'Введите дату',
        )));
      } else if (state.pageState.request.deliverDate.length < 10 || state.pageState.request.deliverDate.length > 10) {
        emit(CreateComplianceProposalInputErrorState(state.pageState.copyWith(
          onAwait: false,
          deliverDateError: true,
          errorDeliverDateText: 'Введите корректную дату',
        )));
      } else {
        emit(CreateComplianceProposalInputErrorState(state.pageState.copyWith(
          onAwait: false,
          deliverDateError: false,
        )));
      }
    } else {
      if (state.pageState.request.price <= 0) {
        emit(CreateComplianceProposalInputErrorState(state.pageState.copyWith(
          onAwait: false,
          priceError: true,
          errorPriceText: 'Введите стоимость больше 0',
        )));
      } else {
        emit(CreateComplianceProposalInputErrorState(state.pageState.copyWith(
          onAwait: false,
          priceError: false,
        )));
      }
      if (!state.pageState.isAvailableSelected) {
        emit(CreateComplianceProposalInputErrorState(state.pageState.copyWith(
          onAwait: false,
          availableSelectedError: true,
          errorAvailableSelectedText: 'Выберите наличие на складе',
        )));
      } else {
        emit(CreateComplianceProposalInputErrorState(state.pageState.copyWith(
          onAwait: false,
          availableSelectedError: false,
        )));
      }
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(CreateComplianceProposalMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
