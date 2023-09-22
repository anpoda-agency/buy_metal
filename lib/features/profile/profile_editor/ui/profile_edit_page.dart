import 'package:buy_metal_app/data/models/auth_models/auth_upload_login_response.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:buy_metal_app/features/profile/profile_editor/bloc/profile_edit_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({
    required this.args,
    super.key,
  });
  final Object? args;

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  //int _selectedType = 0;
  bool supplier = true;
  bool buyer = false;

  //final CollectionReference _users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as AuthUploadLoginResponse;

    return BlocProvider(
      create: (context) => ProfileEditBloc(
        userRepository: context.read<GetIt>().get<UserRepository>(),
        //authRepository: authRepository,
        pageState: const PageState(),
      ),
      child: BlocConsumer<ProfileEditBloc, ProfileEditState>(
        listener: (context, state) {
          if (state is ProfileEditAllowedToPush) {
            Navigator.of(context).pop(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black87,
              title: const Text('Редактирование профиля'),
              centerTitle: true,
              /* actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context, '/profile_edit_page',
                  //arguments: state.pageState.request.source
                );
              },
              icon: const Icon(
                Icons.edit_note,
              )),
        ], */
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
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /* const Text(
                        'Вы являетесь:',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(15),
                            onTap: () {
                              setState(() {
                                _selectedType = 0;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 65,
                              width: MediaQuery.of(context).size.width * 0.5 -
                                  16 -
                                  5,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: _selectedType == 0
                                      ? Colors.orange[700]
                                      : Colors.grey),
                              child: Text(
                                'Поставщиком',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: _selectedType == 0
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(15),
                            onTap: () {
                              setState(() {
                                _selectedType = 1;
                              });
                            },
                            child: Container(
                              height: 65,
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * 0.5 -
                                  16 -
                                  5,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: _selectedType == 1
                                      ? Colors.orange[700]
                                      : Colors.grey),
                              child: Text(
                                'Заказчиком',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: _selectedType == 1
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ), */
                            const SizedBox(
                              height: 20,
                            ),
                            RegFieldWidget(
                                initialValue: args.user.fullName,
                                //controller: _ownerNameController,
                                title: 'ФИО Пользователя',
                                inputType: TextInputType.text,
                                onChanged: (value) =>
                                    context.read<ProfileEditBloc>().add(ProfileEditInputFullName(value))),
                            /* RegFieldWidget(
                        controller: _postNameController,
                        title: 'Должность в компании',
                        inputType: TextInputType.text,
                      ), */
                            RegFieldWidget(
                                initialValue: args.user.companyName,
                                //controller: _companyNameController,
                                title: 'Наименование организации',
                                inputType: TextInputType.text,
                                onChanged: (value) =>
                                    context.read<ProfileEditBloc>().add(ProfileEditInputCompanyName(value))),
                            RegFieldWidget(
                                initialValue: args.user.companyAddress,
                                //controller: _adressController,
                                title: 'Фактический адрес организации',
                                inputType: TextInputType.text,
                                onChanged: (value) =>
                                    context.read<ProfileEditBloc>().add(ProfileEditInputCompanyAddress(value))),
                            RegFieldWidget(
                                initialValue: args.user.tin,
                                //controller: _innController,
                                title: 'ИНН',
                                inputType: TextInputType.number,
                                onChanged: (value) => context.read<ProfileEditBloc>().add(ProfileEditInputTIN(value))),
                            RegFieldWidget(
                                initialValue: args.user.phone,
                                //controller: _phoneController,
                                title: 'Телефон',
                                inputType: TextInputType.phone,
                                onChanged: (value) =>
                                    context.read<ProfileEditBloc>().add(ProfileEditInputPhoneNumber(value))),
                            RegFieldWidget(
                                initialValue: args.user.email,
                                //controller: _emailController,
                                title: 'Эл. почта',
                                inputType: TextInputType.emailAddress,
                                onChanged: (value) =>
                                    context.read<ProfileEditBloc>().add(ProfileEditInputEmail(value))),
                            /*  RegFieldWidget(
                          controller: _passwordController,
                          title: 'Придумайте пароль',
                          inputType: TextInputType.text),
                      RegFieldWidget(
                          controller: _confirmPasswordController,
                          title: 'Повторите пароль',
                          inputType: TextInputType.text), */
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 75,
                              child: ElevatedButton(
                                onPressed: () async {
                                  context.read<ProfileEditBloc>().add(ProfileEditSendChangesEvent());
                                  /* FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text) */
                                  /*  .then((value) async {
                              if (_selectedType == 1) {
                                supplier = false;
                                buyer = true;
                              } */

                                  /*
                                  User? user = FirebaseAuth.instance.currentUser;
                                  String userId = user?.uid ?? '';
                                  //List<String> listOrders = [];
                                  _users.doc(userId).update({
                                    //"id": user?.uid,
                                    "user_fio": _ownerNameController.text,
                                    "post": _postNameController.text,
                                    'company_name': _companyNameController.text,
                                    'company_adress': _adressController.text,
                                    'inn': _innController.text,
                                    'phone': _phoneController.text,
                                    'email': _emailController.text,
                                    //'password': _passwordController.text,
                                    //'supplier': supplier,
                                    //'buyer': buyer,
                                    //'list_orders': listOrders
                                  }).whenComplete(() => Navigator.pop(context));
*/
                                  /* if (_selectedType == 0
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
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    '/selected_buyer_list_of_orders_page',
                                    (Route<dynamic> route) => false);
                              } else {
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    '/buyer_workplace_page',
                                    (Route<dynamic> route) => false);
                              } */
                                  //}
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange[700],
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                ),
                                child: const Text(
                                  'Сохранить изменения',
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
        },
      ),
    );
    /*
    
    */
  }
}

class RegFieldWidget extends StatefulWidget {
  const RegFieldWidget({
    super.key,
    //required this.controller,
    required this.title,
    required this.inputType,
    this.initialValue,
    required this.onChanged,
  });
  //final TextEditingController? controller;
  final String title;
  final TextInputType inputType;
  final String? initialValue;
  final Function(String) onChanged;

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
          TextFormField(
            onChanged: widget.onChanged,
            initialValue: widget.initialValue,
            //controller: widget.controller,
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
