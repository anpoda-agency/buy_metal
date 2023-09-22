import 'package:buy_metal_app/data/models/auth_models/auth_upload_register_new_user_request.dart';
import 'package:buy_metal_app/domain/repository/auth_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:buy_metal_app/features/registration/reg_confirm_conditions/bloc/reg_confirm_conditions_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class RegConfirmConditionsPage extends StatefulWidget {
  const RegConfirmConditionsPage({
    required this.arsg,
    super.key,
  });

  final Object? arsg;

  @override
  State<RegConfirmConditionsPage> createState() => _RegConfirmConditionsPageState();
}

class _RegConfirmConditionsPageState extends State<RegConfirmConditionsPage> {
  //    final args = ModalRoute.of(context)!.settings.arguments as ApplicationUploadSearchResponse;

  bool isAgree = false;
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as AuthUploadRegisterNewUserRequest;

    return BlocProvider(
      create: (context) => RegConfirmConditionsBloc(
          userRegInfoRequest: args,
          authRepository: context.read<GetIt>().get<AuthRepository>(),
          userRepository: context.read<GetIt>().get<UserRepository>(),
          pageState: const PageState()),
      child: BlocConsumer<RegConfirmConditionsBloc, RegConfirmConditionsState>(listener: (context, state) {
        if (state is RegConfirmConditionsAllowedToPushState) {
          Navigator.pushNamedAndRemoveUntil(context, '/buyer_workplace_page', (Route<dynamic> route) => false);
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.grey[900],
          ),
          backgroundColor: Colors.grey[900],
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    //RichText(text: ),
                    //const SizedBox(height: 20),
                    const Text(
                      'Текст нужно придумать, в котором мы будем описывать оферту (комиссию за использование приложения)...',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                            splashRadius: 0,
                            activeColor: Colors.black,
                            //checkColor: Colors.white,
                            //focusColor: Colors.white,
                            //hoverColor: Colors.white,
                            //shape: OutlinedBorder(),
                            side: MaterialStateBorderSide.resolveWith(
                              (states) => const BorderSide(
                                width: 1.0,
                                color: Colors.white,
                              ),
                            ),
                            value: isAgree,
                            onChanged: (value) {
                              setState(() {
                                isAgree = value!;
                              });
                            }),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isAgree = !isAgree;
                            });
                          },
                          child: const Text(
                            'Я согласен с условиями использования',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 75,
                  child: ElevatedButton(
                    onPressed: isAgree
                        ? () {
                            //Navigator.pushNamed(context, '/auth_page');
                            context.read<RegConfirmConditionsBloc>().add(RegConfirmConditionSendRegEvent());
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[700],
                      //isAgree ? Colors.orange[700] : Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    child: const Text(
                      'Завершить регистрацию',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );

    /*
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[900],
      ),
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                //RichText(text: ),
                //const SizedBox(height: 20),
                const Text(
                  'Текст нужно придумать, в котором мы будем описывать оферту (комиссию за использование приложения)...',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                        splashRadius: 0,
                        activeColor: Colors.black,
                        //checkColor: Colors.white,
                        //focusColor: Colors.white,
                        //hoverColor: Colors.white,
                        //shape: OutlinedBorder(),
                        side: MaterialStateBorderSide.resolveWith(
                          (states) => const BorderSide(
                            width: 1.0,
                            color: Colors.white,
                          ),
                        ),
                        value: isAgree,
                        onChanged: (value) {
                          setState(() {
                            isAgree = value!;
                          });
                        }),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isAgree = !isAgree;
                        });
                      },
                      child: const Text(
                        'Я согласен с условиями использования',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 75,
              child: ElevatedButton(
                onPressed: isAgree
                    ? () {
                        //Navigator.pushNamed(context, '/auth_page');
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[700],
                  //isAgree ? Colors.orange[700] : Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                child: const Text(
                  'Завершить регистрацию',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    */
  }
}
