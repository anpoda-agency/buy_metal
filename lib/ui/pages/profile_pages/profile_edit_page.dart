import 'package:buy_metal_app/data/models/firebase_models/user_model.dart';
import 'package:buy_metal_app/ui/core_widgets/label_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
  late UserModel userModel;

  int _selectedType = 0;
  bool supplier = true;
  bool buyer = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _ownerNameController = TextEditingController();
  final TextEditingController _postNameController = TextEditingController();
  final TextEditingController _adressController = TextEditingController();
  final TextEditingController _innController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    //getIt.get<ProfileRepository>().user;
    userModel = //getIt.get<ProfileRepository>().user;
        widget.args != null ? widget.args as UserModel : const UserModel();
    super.initState();
    print(userModel.toFirestore());
    _emailController.text = userModel.email;
    _companyNameController.text = userModel.companyName;
    _ownerNameController.text = userModel.userFIO;
    _postNameController.text = userModel.post;
    _adressController.text = userModel.companyAdress;
    _innController.text = userModel.inn;
    _phoneController.text = userModel.phone;
  }

  @override
  Widget build(BuildContext context) {
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
                        controller: _ownerNameController,
                        title: 'ФИО Пользователя',
                        inputType: TextInputType.text,
                      ),
                      RegFieldWidget(
                        controller: _postNameController,
                        title: 'Должность в компании',
                        inputType: TextInputType.text,
                      ),
                      RegFieldWidget(
                        controller: _companyNameController,
                        title: 'Наименование организации',
                        inputType: TextInputType.text,
                      ),
                      RegFieldWidget(
                          controller: _adressController,
                          title: 'Фактический адрес организации',
                          inputType: TextInputType.text),
                      RegFieldWidget(
                          controller: _innController,
                          title: 'ИНН',
                          inputType: TextInputType.number),
                      RegFieldWidget(
                          controller: _phoneController,
                          title: 'Телефон',
                          inputType: TextInputType.phone),
                      RegFieldWidget(
                          controller: _emailController,
                          title: 'Эл. почта',
                          inputType: TextInputType.emailAddress),
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
                            /* FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text) */
                            /*  .then((value) async {
                              if (_selectedType == 1) {
                                supplier = false;
                                buyer = true;
                              } */
                            User? user = FirebaseAuth.instance.currentUser;
                            String userId = user?.uid ?? '';
                            List<String> listOrders = [];
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
                            primary: Colors.orange[700],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
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
  }
}

class RegFieldWidget extends StatefulWidget {
  const RegFieldWidget(
      {super.key,
      required this.controller,
      required this.title,
      required this.inputType});
  final TextEditingController controller;
  final String title;
  final TextInputType inputType;

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
            controller: widget.controller,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.white)),
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
