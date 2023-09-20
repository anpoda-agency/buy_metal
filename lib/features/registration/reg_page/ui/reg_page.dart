import 'package:buy_metal_app/domain/repository/auth_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:buy_metal_app/features/core_widgets/label_widget.dart';
import 'package:buy_metal_app/features/registration/reg_page/bloc/reg_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  late String position;

  int _selectedType = 2;
  bool supplier = true;
  bool buyer = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _ownerNameController = TextEditingController();
  //final TextEditingController _postNameController = TextEditingController();
  final TextEditingController _adressController = TextEditingController();
  final TextEditingController _innController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  //final CollectionReference _users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (constext) => RegBloc(
        authRepository: context.read<GetIt>().get<AuthRepository>(),
        userRepository: context.read<GetIt>().get<UserRepository>(),
        pageState: const PageState(),
      ),
      child: BlocConsumer<RegBloc, RegState>(listener: (context, state) {
        if (state is RegAllowedToPush) {
          print('Reg succes for, ${state.pageState.response.user.fullName}');
          // ДОБАВИТЬ В АРГУМЕНТЫ ПЕРЕДАЧУ МОДЕЛИ РЕКВЕСТА НА РЕГИСТРАЦИЮ
          //Navigator.of(context).pushNamed('/reg_confirm_conditions_page');
          /*
          if (_selectedType == 0) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/selected_buyer_list_of_orders_page', (Route<dynamic> route) => false);
          } else {
            Navigator.pushNamedAndRemoveUntil(context, '/buyer_workplace_page', (Route<dynamic> route) => false);
          }
          */
        }
        if (state is RegError) {
          print(state.pageState.errMsg);
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 50,
            elevation: 0,
            backgroundColor: Colors.grey[900],
          ),
          backgroundColor: Colors.grey[900],
          body: SingleChildScrollView(
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Center(
                        child: LabelWidget(title: 'Регистрация'),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Вы являетесь:',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // Начало выбор роли
                          Row(
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(15),
                                onTap: () {
                                  position = 'SUPPLIER';
                                  //(position) => context.read<RegBloc>().add(RegInputPosition('SUPPLIER'));
                                  context.read<RegBloc>().add(RegInputPosition(position));
                                  setState(() {
                                    _selectedType = 0;
                                    //position = 'SUPPLIER';
                                    //(position) => context.read<RegBloc>().add(RegInputPosition('SUPPLIER'));
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 65,
                                  width: MediaQuery.of(context).size.width * 0.5 - 16 - 5,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: _selectedType == 0 ? Colors.orange[700] : Colors.grey),
                                  child: Text(
                                    'Поставщиком',
                                    style: TextStyle(
                                        fontSize: 22, color: _selectedType == 0 ? Colors.white : Colors.black),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(15),
                                onTap: () {
                                  position = 'CUSTOMER';
                                  //(position) => context.read<RegBloc>().add(RegInputPosition('CUSTOMER'));
                                  context.read<RegBloc>().add(RegInputPosition(position));
                                  setState(() {
                                    _selectedType = 1;
                                    //position = 'CUSTOMER';
                                    //(position) => context.read<RegBloc>().add(RegInputPosition('CUSTOMER'));
                                  });
                                },
                                child: Container(
                                  height: 65,
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width * 0.5 - 16 - 5,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: _selectedType == 1 ? Colors.orange[700] : Colors.grey),
                                  child: Text(
                                    'Заказчиком',
                                    style: TextStyle(
                                        fontSize: 22, color: _selectedType == 1 ? Colors.white : Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Конец выбора роли
                          const SizedBox(
                            height: 20,
                          ),
                          /* RegFieldWidget(
                            //controller: _ownerNameController,
                            title: 'POSITION (CUSTOMER or SUPPLIER)',
                            inputType: TextInputType.text,
                            onChanged: (value) => context.read<RegBloc>().add(RegInputPosition(value)),
                          ), */
                          RegFieldWidget(
                            controller: _ownerNameController,
                            title: 'ФИО Пользователя',
                            inputType: TextInputType.text,
                            onChanged: (value) => context.read<RegBloc>().add(RegInputFullName(value)),
                          ),
                          /* RegFieldWidget(
                            controller: _postNameController,
                            title: 'Должность в компании',
                            inputType: TextInputType.text,
                            onChanged: (value) => context.read<RegBloc>().add(RegInputFullName(value)),
                          ), */
                          RegFieldWidget(
                            controller: _companyNameController,
                            title: 'Наименование организации',
                            inputType: TextInputType.text,
                            onChanged: (value) => context.read<RegBloc>().add(RegInputCompanyName(value)),
                          ),
                          RegFieldWidget(
                            controller: _adressController,
                            title: 'Фактический адрес организации',
                            inputType: TextInputType.text,
                            onChanged: (value) => context.read<RegBloc>().add(RegInputCompanyAddress(value)),
                          ),

                          RegFieldWidget(
                            controller: _innController,
                            title: 'ИНН',
                            inputType: TextInputType.number,
                            onChanged: (value) => context.read<RegBloc>().add(RegInputTIN(value)),
                          ),
                          RegFieldWidget(
                            controller: _phoneController,
                            title: 'Телефон',
                            inputType: TextInputType.phone,
                            onChanged: (value) => context.read<RegBloc>().add(RegInputPhoneNumber(value)),
                          ),
                          RegFieldWidget(
                            controller: _emailController,
                            title: 'Эл. почта',
                            inputType: TextInputType.emailAddress,
                            onChanged: (value) => context.read<RegBloc>().add(RegInputEmail(value)),
                          ),
                          RegFieldWidget(
                            controller: _passwordController,
                            title: 'Придумайте пароль',
                            inputType: TextInputType.text,
                            onChanged: (value) => context.read<RegBloc>().add(RegInputPassword(value)),
                          ),
                          RegFieldWidget(
                            controller: _confirmPasswordController,
                            title: 'Повторите пароль',
                            inputType: TextInputType.text,
                            //onChanged: (value) => context.read<RegBloc>().add(RegInputFullName(value)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
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
                                      // ПОТОМ РАСКОМЕНТИТЬ ТЕСТИМ ЧЕКБОКС ОТ ПОПОВА
                                      //context.read<RegBloc>().add(RegSendReg());
                                      Navigator.of(context).pushNamed('/reg_confirm_conditions_page');

                                      /* if (_selectedType == 0) {
                                        Navigator.pushNamedAndRemoveUntil(context,
                                            '/selected_buyer_list_of_orders_page', (Route<dynamic> route) => false);
                                      } else {
                                        Navigator.pushNamedAndRemoveUntil(
                                            context, '/buyer_workplace_page', (Route<dynamic> route) => false);
                                      } */
                                    }
                                  }
                                } else {
                                  const ErrorDialog(
                                    dialogTittle: 'Не выбран тип аккаунта',
                                    dialogText: 'Сделайте выбор в поле \n"Вы являетесь"',
                                  ).showMyDialog(context);
                                }
                              },
                              /* 
                              async {
                                FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: _emailController.text, password: _passwordController.text)
                                    .then((value) async {
                                  if (_selectedType == 1) {
                                    setState(() {
                                      supplier = false;
                                      buyer = true;
                                    });
                                  } else {
                                    setState(() {
                                      supplier = true;
                                      buyer = false;
                                    });
                                  }
                                  User? user = FirebaseAuth.instance.currentUser;
                                  String userId = user?.uid ?? '';
                                  List<String> listOrders = [];
                                  _users.doc(userId).set({
                                    "id": user?.uid,
                                    "user_fio": _ownerNameController.text,
                                    //"post": _postNameController.text,
                                    'company_name': _companyNameController.text,
                                    'company_adress': _adressController.text,
                                    'inn': _innController.text,
                                    'phone': _phoneController.text,
                                    'email': _emailController.text,
                                    'password': _passwordController.text,
                                    'supplier': supplier,
                                    'buyer': buyer,
                                    'list_orders': listOrders
                                  });

                                  if (_selectedType == 0
                                      // _emailController.text.isNotEmpty &&
                                      //   _passwordController.text ==
                                      //       _confirmPasswordController.text &&
                                      //   _adressController.text.isNotEmpty &&
                                      //   _companyNameController.text.isNotEmpty &&
                                      //   _innController.text.isNotEmpty &&
                                      //   _ogrnController.text.isNotEmpty &&
                                      //   _ownerNameController.text.isNotEmpty &&
                                      //   _phoneController.text.isNotEmpty
                                      ) {
                                    Navigator.pushNamedAndRemoveUntil(context, '/selected_buyer_list_of_orders_page',
                                        (Route<dynamic> route) => false);
                                  } else {
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, '/buyer_workplace_page', (Route<dynamic> route) => false);
                                  }
                                });
                              },
                               */
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

// ElevatedButton regButton(BuildContext context, Function onTap) {
//   return ElevatedButton(
//     onPressed: () {
//       onTap();
//     },
//     style: ElevatedButton.styleFrom(
//       primary: Colors.orange[700],
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//     ),
//     child: const Text(
//       'Зарегистрироваться',
//       style: TextStyle(fontSize: 20),
//     ),
//   );
// }

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
