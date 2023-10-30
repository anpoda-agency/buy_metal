import 'package:buy_metal_app/data/models/auth_models/auth_upload_login_response.dart';
import 'package:buy_metal_app/domain/repository/auth_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository userRepository;
  final AuthRepository authRepository;

  //final AuthUploadLoginResponse authModel;
  ProfileBloc({
    //required this.authModel,
    required this.userRepository,
    required this.authRepository,
    required PageState pageState,
  }) : super(ProfileInitial(pageState)) {
    on<ProfileInit>(profileInit);
    on<ProfileMsgErr>(profileMsgErr);
    on<ProfileLogOutEvent>(profileLogOut);
    on<ProfileUpdateEvent>(profileUpdate);
    on<ProfileGoStatisticEvent>(profileGoStatistic);
    add(ProfileInit());
  }

  profileInit(ProfileInit event, emit) async {
    var model = userRepository.user;

    //var modelR = authModel.user;

    String positionRu;

    if (model?.user.position == "CUSTOMER") {
      //state.pageState.user.user.position
      positionRu = 'Заказчик';
    } else {
      positionRu = 'Поставщик';
    }

    emit(ProfileUp(state.pageState.copyWith(user: model, positionRu: positionRu)));
  }

  profileLogOut(ProfileLogOutEvent event, emit) async {
    //await userRepository.clearUserData();
    authRepository.changeAuthStatus(val: false);
    emit(ProfileLogOutState(state.pageState.copyWith()));
  }

  profileUpdate(ProfileUpdateEvent event, emit) async {
    var model = userRepository.user;
    emit(ProfileUpdateUserInfoState(state.pageState.copyWith(user: model)));
  }

  profileGoStatistic(ProfileGoStatisticEvent event, emit) async {
    //var model = userRepository.user;
    emit(ProfileGoStatisticState(state.pageState));
  }

  profileMsgErr(ProfileMsgErr event, emit) async {
    emit(ProfileError(state.pageState.copyWith(
      onAwait: false,
      errMsg: event.msg,
    )));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(ProfileMsgErr(error.toString()));
    super.onError(error, stackTrace);
  }
}
