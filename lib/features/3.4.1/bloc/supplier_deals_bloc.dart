import 'package:buy_metal_app/data/models/deal_models/deal_upload_search_request.dart';
import 'package:buy_metal_app/data/models/deal_models/deal_upload_search_response.dart';
import 'package:buy_metal_app/domain/repository/deal_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'supplier_deals_event.dart';
part 'supplier_deals_state.dart';

class SupplierDealsBloc extends Bloc<SupplierDealsEvent, SupplierDealsState> {
  final UserRepository userRepository;
  final DealRepository dealRepository;
  SupplierDealsBloc({
    required this.userRepository,
    required this.dealRepository,
    required PageState pageState,
  }) : super(SupplierDealsInitial(pageState)) {
    on<SupplierDealsInit>(supplierDealsInit);
    on<SupplierDealsMsgErr>(supplierDealsMsgErr);
    add(SupplierDealsInit());
  }

  supplierDealsInit(SupplierDealsInit event, emit) async {
    var buyerId = userRepository.user?.user.id;
    var userAccessToken = userRepository.user?.accessToken;

    //var model = state.pageState.request.copyWith(customerId: buyerId, limit: 15, offset: 0, statuses: ["OPEN"]);
    var model = state.pageState.request.copyWith(supplierId: buyerId, limit: 15, offset: 0, statuses: [
      "OPEN",
      "AGREED",
      "WAITING_PAYMENT",
      "DELIVERY",
    ]);

    var res = await dealRepository.dealUploadSearch(request: model, accessToken: userAccessToken);

    emit(SupplierDealsGetDealsState(state.pageState.copyWith(response: res)));
  }

  supplierDealsMsgErr(SupplierDealsMsgErr event, emit) async {
    emit(SupplierDealsError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(SupplierDealsMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
