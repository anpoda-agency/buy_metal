import 'package:buy_metal_app/domain/repository/activation_code_repository.dart';
import 'package:buy_metal_app/domain/router/route_constants.dart';
import 'package:buy_metal_app/domain/router/route_impl.dart';
import 'package:buy_metal_app/features/registration/reg_sms_code_page/bloc/reg_sms_code_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pinput/pinput.dart';

class RegSmsCodePage extends StatefulWidget {
  const RegSmsCodePage({super.key, required this.args});
  final Object? args;

  @override
  State<RegSmsCodePage> createState() => _RegSmsCodePageState();
}

class _RegSmsCodePageState extends State<RegSmsCodePage> {
  /* late String phone;

  @override
  void initState() {
    phone = (widget.args is String) ? widget.args as String : '';
    super.initState();
  } */

  @override
  Widget build(BuildContext context) {
    final phoneNumber = widget.args as String;
    return BlocProvider(
      create: (context) => RegSmsCodeBloc(
        //activationCodeRepository: context.read<GetIt>().get<ActivationCodeRepository>(),
        //phoneNumber: phone,
        activationCodeRepository: context.read<GetIt>().get<ActivationCodeRepository>(),
        phoneNumber: phoneNumber,
        pageState: const PageState(),
      ),
      child: BlocConsumer<RegSmsCodeBloc, RegSmsCodeState>(
        listener: (context, state) {
          if (state is RegSmsCodeAllowedToPush) {
            // Navigator.pushNamed(context, '/reg_password_page', arguments: state.pageState.request.source);
            context.read<RouteImpl>().push('auth/${RootRoutes.regPage.name}', args: state.pageState.request.source);
          }
          /* if (state is RegistrationCodeError) {
            PopUpCustomOneButtonWidget(
              popUpMessage: state.pageState.errMsg,
              buttonTitle: 'Закрыть',
              onPressed: () {
                Navigator.of(context).pop();
              },
            ).showPopUpCustomOneButtonWidget(context);
          } */
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.grey[900],

            appBar: AppBar(
              backgroundColor: Colors.grey[900],
              elevation: 0,
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              /* actions: [
                IconButton(
                    onPressed: () {
                      context
                          .read<RouteImpl>()
                          .push('auth/${RootRoutes.regPage.name}', args: state.pageState.request.source);
                      //Navigator.pushNamed(context, '/reg_password_page', arguments: state.pageState.request.source);
                    },
                    icon: const Icon(Icons.backup)),
              ], */
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Column(
                  children: [
                    const SizedBox(
                      //width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Код подтверждения',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.80,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Pinput(
                      defaultPinTheme: PinTheme(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 80, // 42
                          width: 60, // 36
                          textStyle:
                              const TextStyle(color: Colors.black, fontSize: 50, fontWeight: FontWeight.w700), // 24
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8))),
                      //onCompleted: (pin) => (), //context.read<AuthSmsCodeBloc>().add(AuthSmsCodeInputValue(pin, true)),
                      onChanged: (pin) => context.read<RegSmsCodeBloc>().add(RegSmsCodeInputValueEvent(pin, false)),
                      //context.read<AuthSmsCodeBloc>().add(AuthSmsCodeInputValue(pin, false)),
                    ),
                  ],
                ),
                /* AuthCustomSmsCodeInputWidget(
                  onChanged: (value) {},
                  //onChanged: (value) => context.read<RegistrationCodeBloc>().add(RegistrationCodeInput(value))
                ), */
                /* CustomButtonWidget(
                    onPressed: () => context.read<RegistrationCodeBloc>().add(RegistrationCodeSend()),
                    title: 'Продолжить',
                    backgroundColor: const Color(0xFFF5F5F5),
                    widthPadding: 50), */

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 75,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<RegSmsCodeBloc>().add(RegSmsCodeSendCodeEvent());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[700],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                      child: const Text(
                        'Отправить код',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //),
          );
        },
      ),
    );
  }
}

class AuthCustomSmsCodeInputWidget extends StatefulWidget {
  const AuthCustomSmsCodeInputWidget({
    super.key,
    required this.onChanged,
  });

  final Function(String) onChanged;

  @override
  State<AuthCustomSmsCodeInputWidget> createState() => _AuthCustomSmsCodeInputWidgetState();
}

class _AuthCustomSmsCodeInputWidgetState extends State<AuthCustomSmsCodeInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: 251,
          child: Text(
            'Код подтверждения',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'SF Pro Text',
              fontWeight: FontWeight.w300,
              letterSpacing: 0.80,
            ),
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        Center(
          child: Wrap(
            alignment: WrapAlignment.start,
            spacing: 10,
            direction: Axis.horizontal,
            runSpacing: 10,
            children: [
              _otpTextField(context: context, autoFocus: true, onChange: widget.onChanged),
              _otpTextField(context: context, autoFocus: true, onChange: widget.onChanged),
              _otpTextField(context: context, autoFocus: true, onChange: widget.onChanged),
              _otpTextField(context: context, autoFocus: true, onChange: widget.onChanged),
            ],
          ),
        ),
        const SizedBox(
          height: 37,
        ),
      ],
    );
  }
}

Widget _otpTextField(
    {required BuildContext context, required bool autoFocus, required Function(String value) onChange}) {
  return Container(
    width: 62,
    height: 90,
    decoration: ShapeDecoration(
      color: Colors.grey[300],
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Colors.white),
        borderRadius: BorderRadius.circular(18),
      ),
    ),
    child: AspectRatio(
      aspectRatio: 1,
      child: TextField(
        autofocus: autoFocus,
        decoration: const InputDecoration(
          //filled: true,
          //fillColor: Colors.grey[300],
          border: InputBorder.none,
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(
          fontSize: 50,
        ),
        maxLines: 1,
        onChanged: (value) {
          onChange(value);
          if (value.isNotEmpty) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    ),
  );
}
