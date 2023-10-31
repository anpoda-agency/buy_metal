import 'package:buy_metal_app/data/models/application_response_models/application_response_get_supplier_responses_response.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'supplier_proposal_description_event.dart';
part 'supplier_proposal_description_state.dart';

class SupplierProposalDescriptionBloc extends Bloc<SupplierProposalDescriptionEvent, SupplierProposalDescriptionState> {
  final ApplicationResponseGetSupplierResponsesResponse proposalInfo;
  final UserRepository userRepository;
  SupplierProposalDescriptionBloc({
    required this.proposalInfo,
    required this.userRepository,
    required PageState pageState,
  }) : super(SupplierProposalDescriptionInitial(pageState)) {
    on<SupplierProposalDescriptionInit>(supplierProposalDescriptionInit);
    on<SupplierProposalDescriptionMsgErr>(supplierProposalDescriptionMsgErr);
    add(SupplierProposalDescriptionInit());
  }

  supplierProposalDescriptionInit(SupplierProposalDescriptionInit event, emit) async {
    emit(SupplierProposalDescriptionUp(state.pageState));
  }

  supplierProposalDescriptionMsgErr(SupplierProposalDescriptionMsgErr event, emit) async {
    emit(SupplierProposalDescriptionError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(SupplierProposalDescriptionMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
