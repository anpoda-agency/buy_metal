import 'package:buy_metal_app/domain/repository/auth_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:buy_metal_app/domain/router/route_constants.dart';
import 'package:buy_metal_app/domain/router/route_impl.dart';
import 'package:buy_metal_app/features/core_widgets/label_widget.dart';
import 'package:buy_metal_app/features/registration/reg_phone_page/bloc/reg_phone_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class RegPhonePage extends StatefulWidget {
  const RegPhonePage({super.key});

  @override
  State<RegPhonePage> createState() => _RegPhonePageState();
}

class _RegPhonePageState extends State<RegPhonePage> {
  late String position;

  int _selectedType = 2;
  bool supplier = true;
  bool buyer = false;

  //final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  //final TextEditingController _companyNameController = TextEditingController();
  //final TextEditingController _ownerNameController = TextEditingController();
  //final TextEditingController _postNameController = TextEditingController();
  //final TextEditingController _adressController = TextEditingController();
  //final TextEditingController _innController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  //final CollectionReference _users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (constext) => RegPhoneBloc(
        //authRepository: context.read<GetIt>().get<AuthRepository>(),
        //userRepository: context.read<GetIt>().get<UserRepository>(),
        pageState: const PageState(),
      ),
      child: BlocConsumer<RegPhoneBloc, RegPhoneState>(listener: (context, state) {
        /* if (state is RegAllowedToPush) {
          //print('Reg succes for, ${state.pageState.response.user.fullName}');
          // ДОБАВИТЬ В АРГУМЕНТЫ ПЕРЕДАЧУ МОДЕЛИ РЕКВЕСТА НА РЕГИСТРАЦИЮ
          //Navigator.of(context).pushNamed('/reg_confirm_conditions_page');

          /* if (_selectedType == 0) {
            //Navigator.pushNamedAndRemoveUntil(
            //    context, '/selected_buyer_list_of_orders_page', (Route<dynamic> route) => false);
          } else {
            //Navigator.pushNamed(context, '/reg_confirm_conditions_page', arguments: state.pageState.request);
            //context.read<RouteImpl>().go(DealsRoutes.deals.name);
            context
                .read<RouteImpl>()
                .push('auth/${RootRoutes.regConfirmConditionsPage.name}', args: state.pageState.request);
          } */
        } */
        /* if (state is RegError) {
          //print(state.pageState.errMsg);
        } */
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 50,
            elevation: 0,
            backgroundColor: Colors.grey[900],
            actions: [
              IconButton(
                  onPressed: () {
                    context.read<RouteImpl>().push('auth/${RootRoutes.regSmsCodePage.name}',
                        //args: state.pageState.request.source,
                        args: '+79271285566');

                    //Navigator.pushNamed(context, '/reg_sms_code_page', arguments: state.pageState.request.source);
                  },
                  icon: const Icon(Icons.backup)),
            ],
          ),
          backgroundColor: Colors.grey[900],
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Center(
                      child: LabelWidget(title: 'Регистрация'),
                    ),
                    RegFieldWidget(
                      controller: _phoneController,
                      title: 'Введите номер телефона:',
                      inputType: TextInputType.phone,
                      onChanged: (value) {},
                      //onChanged: (value) => context.read<RegBloc>().add(RegInputPhoneNumber(value)),
                    ),
                    const SizedBox.shrink(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //const SizedBox(height: 10),
                        const SizedBox.shrink(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 75,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_selectedType == 0 || _selectedType == 1) {
                                if (_passwordController.text == '') {
                                  const ErrorDialog(
                                    dialogTittle: 'Отсутствует пароль',
                                    dialogText: 'Вы забыли придумать пароль. Пожалуйста, введите пароль',
                                  ).showMyDialog(context);
                                } else {
                                  if (_passwordController.text != _confirmPasswordController.text) {
                                    const ErrorDialog(
                                      dialogTittle: 'Пароли не совпадают',
                                      dialogText:
                                          'Убедитесь, что вы ввели идентичные пароли, попробуйте повторить пароль еще раз',
                                    ).showMyDialog(context);
                                  } else {
                                    //context.read<RegBloc>().add(RegSendReg());
                                  }
                                }
                              } else {
                                const ErrorDialog(
                                  dialogTittle: 'Не выбран тип аккаунта',
                                  dialogText: 'Сделайте выбор в поле \n"Вы являетесь"',
                                ).showMyDialog(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange[700],
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            ),
                            child: const Text(
                              'Зарегистрироваться',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ]),
            ),
          ),
        );
      }),
    );
  }
}

class RegFieldWidget extends StatefulWidget {
  const RegFieldWidget({
    super.key,
    this.controller,
    required this.title,
    required this.inputType,
    this.onChanged,
  });
  final TextEditingController? controller;
  final String title;
  final TextInputType inputType;
  final Function(String)? onChanged;

  @override
  State<RegFieldWidget> createState() => _RegFieldWidgetState();
}

class _RegFieldWidgetState extends State<RegFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            onChanged: widget.onChanged,
            controller: widget.controller,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(15))),
            keyboardType: widget.inputType,
          ),
        ],
      ),
    );
  }
}

class ErrorDialog {
  const ErrorDialog({required this.dialogTittle, required this.dialogText});

  final String dialogTittle;
  final String dialogText;

  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(dialogTittle),
          //const Text('Пароли не совпадают'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(dialogText),
                //Text('Убедитесь, что вы ввели идентичные пароли, попробуйте повторить пароль еще раз'),
                //Text('Проверьте, чтобы пароли совпадали'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
