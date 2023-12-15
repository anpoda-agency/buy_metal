import 'package:buy_metal_app/domain/repository/auth_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:buy_metal_app/domain/router/route_constants.dart';
import 'package:buy_metal_app/domain/router/route_impl.dart';
import 'package:buy_metal_app/features/profile/profile_page/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    required this.args,
    super.key,
  });
  final Object? args;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //late String position;

  late String profileType = '';

  //int _selectedType = 0;
  bool supplier = true;
  bool buyer = false;
  /*
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _ownerNameController = TextEditingController();
  final TextEditingController _postNameController = TextEditingController();
  final TextEditingController _adressController = TextEditingController();
  final TextEditingController _innController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final CollectionReference _users = FirebaseFirestore.instance.collection('users');
  */

  @override
  void initState() {
    //getIt.get<ProfileRepository>().user;

    //widget.args != null ? widget.args as UserModel : const UserModel();

    super.initState();
    /*
    print(userModel.toFirestore());
    if (userModel.buyer) {
      profileType = 'Заказчик';
    }
    if (userModel.supplier) {
      profileType = 'Поставщик';
    }
    */
    // калл который нулл выбрасывает
    /* ProfileRepository? userInstance;
    userInstance!.getUserInfo(userId: userModel.id); */
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(
        userRepository: context.read<GetIt>().get<UserRepository>(),
        authRepository: context.read<GetIt>().get<AuthRepository>(),
        pageState: const PageState(),
      ),
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileUpdateUserInfoState) {
            //Navigator.of(context).pushNamed('/profile_edit_page', arguments: state.pageState.user).then((value) {
            //  context.read<ProfileBloc>().add(ProfileInit());
            //});
            context
                .read<RouteImpl>()
                .push(ProfileRoutes.profileEdit.name, args: state.pageState.user)
                .then((value) => context.read<ProfileBloc>().add(ProfileInit()));
          }
          if (state is ProfileLogOutState) {
            //Navigator.pushReplacementNamed(context, '/home_page');
            context.read<RouteImpl>().go(RootRoutes.startPage.name);
          }
          if (state is ProfileGoStatisticState) {
            if (context.read<GetIt>().get<UserRepository>().user?.user.position == 'CUSTOMER') {
              context.read<RouteImpl>().go(ProfileRoutes.profileStatistics.name, args: state.pageState.user);
            }
            if (context.read<GetIt>().get<UserRepository>().user?.user.position == 'SUPPLIER') {
              context
                  .read<RouteImpl>()
                  .go(ProfileSupplierRoutes.profileSupplierStatistics.name, args: state.pageState.user);
            }

            /* context
                .read<RouteImpl>()
                .push(ProfileRoutes.profileStatistics.name, args: state.pageState.user)
                .then((value) => context.read<ProfileBloc>().add(ProfileInit())); */
            //context.read<RouteImpl>().go(ProfileRoutes.profileStatistics.name, args: state.pageState.user);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black87,
              title: const Text('Ваш Профиль'),
              centerTitle: true,
              /*
              actions: [
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
              ],
              */
            ),
            //backgroundColor: Colors.grey[900],
            body: SingleChildScrollView(
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          //mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              /* onTap: () {
                                context.read<RouteImpl>().pop();
                              }, */
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                //margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Colors.orange[700],
                                    border: Border.all(width: 2, color: Colors.black),
                                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                                //width: MediaQuery.of(context).size.width,
                                child: const Text(
                                  'О компании',
                                  style: TextStyle(fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ),
                            //const SizedBox(width: 20),
                            InkWell(
                              onTap: () {
                                context.read<ProfileBloc>().add(ProfileGoStatisticEvent());
                              },
                              child: Container(
                                //color: Colors.orange,
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                //margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.orange[700],
                                  //border: Border.all(width: 2, color: Colors.black),
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                ),
                                //width: MediaQuery.of(context).size.width,
                                child: const Text(
                                  'Статистика',
                                  style: TextStyle(fontSize: 20, color: Colors.white),
                                ),
                              ),
                              // Старый вариант
                              /* Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                //margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 2, color: Colors.black),
                                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                                //width: MediaQuery.of(context).size.width,
                                child: const Text(
                                  'Статистика',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ), */
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _ProfileInfoDisplayField(
                              fieldName: 'Вы являетесь:',
                              userInfo: state.pageState.positionRu,
                              //userModel.userFIO.toString(),
                              //userInfo: 'Попов Данила',
                            ),
                            _ProfileInfoDisplayField(
                                fieldName: 'ФИО Пользователя:', userInfo: state.pageState.user.user.fullName
                                //userModel.userFIO.toString(),
                                //userInfo: 'Попов Данила',
                                ),
                            //_ProfileInfoDisplayField(fieldName: 'Должность в компании:', userInfo: userModel.post),
                            _ProfileInfoDisplayField(
                                fieldName: 'Наименование организации:',
                                userInfo: state.pageState.user.user.companyName),
                            _ProfileInfoDisplayField(
                                fieldName: 'Фактический адрес организации:',
                                userInfo: state.pageState.user.user.companyAddress),
                            _ProfileInfoDisplayField(
                              fieldName: 'ИНН:',
                              userInfo: state.pageState.user.user.tin,
                              //userModel.inn.toString()
                            ),
                            _ProfileInfoDisplayField(
                              fieldName: 'Телефон:', userInfo: state.pageState.user.user.phone,
                              //userModel.phone
                            ),
                            _ProfileInfoDisplayField(
                                fieldName: 'Эл. почта:', userInfo: state.pageState.user.user.email),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 75,
                              child: ElevatedButton(
                                onPressed: () {
                                  context.read<ProfileBloc>().add(ProfileUpdateEvent());

                                  //Navigator.of(context)
                                  //    .pushNamed('/profile_edit_page', arguments: state.pageState.user);

                                  /*
                                  Navigator.of(context)
                                      .push(
                                        MaterialPageRoute(
                                            builder: (context) => ProfileEditPage(
                                                  args: userModel,
                                                )),
                                      )
                                      .then((value) => context.read<ProfileBloc>().add(ProfileUpdate()));
                                    */
                                  /* .then((value) {
                              setState(() {});
                            }); */
                                },
                                //Navigator.push(context,MaterialPageRoute(builder: (context) => Page2())).then((value) { setState(() {});
                                /* () async {
                            FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text)
                                .then((value) async {
                              if (_selectedType == 1) {
                                supplier = false;
                                buyer = true;
                              }
                              User? user = FirebaseAuth.instance.currentUser;
                              String userId = user?.uid ?? '';
                              List<String> listOrders = [];
                              _users.doc(userId).set({
                                "id": user?.uid,
                                "user_fio": _ownerNameController.text,
                                "post": _postNameController.text,
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
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    '/selected_buyer_list_of_orders_page',
                                    (Route<dynamic> route) => false);
                              } else {
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    '/buyer_workplace_page',
                                    (Route<dynamic> route) => false);
                              }
                            });
                          }, */
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange[700],
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                ),
                                child: const Text(
                                  'Редактировать',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 75,
                              child: ElevatedButton(
                                onPressed: () {
                                  context.read<ProfileBloc>().add(ProfileLogOutEvent());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange[700],
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                ),
                                child: const Text(
                                  'Выйти из аккаунта',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
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

    /* return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Ваш Профиль'),
        centerTitle: true,
        actions: [
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
        ],
      ),
      //backgroundColor: Colors.grey[900],
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
                      _ProfileInfoDisplayField(
                        fieldName: 'Вы являетесь:',
                        userInfo: profileType,
                        //userModel.userFIO.toString(),
                        //userInfo: 'Попов Данила',
                      ),
                      _ProfileInfoDisplayField(
                        fieldName: 'ФИО Пользователя:',
                        userInfo: userModel.userFIO.toString(),
                        //userInfo: 'Попов Данила',
                      ),
                      //_ProfileInfoDisplayField(fieldName: 'Должность в компании:', userInfo: userModel.post),
                      _ProfileInfoDisplayField(fieldName: 'Наименование организации:', userInfo: userModel.companyName),
                      _ProfileInfoDisplayField(
                          fieldName: 'Фактический адрес организации:', userInfo: userModel.companyAdress),
                      _ProfileInfoDisplayField(
                        fieldName: 'ИНН:',
                        userInfo: userModel.inn.toString(),
                      ),
                      _ProfileInfoDisplayField(fieldName: 'Телефон:', userInfo: userModel.phone),
                      _ProfileInfoDisplayField(fieldName: 'Эл. почта:', userInfo: userModel.email),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 75,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => ProfileEditPage(
                                        args: userModel,
                                      )),
                            );
                            /* .then((value) {
                              setState(() {});
                            }); */
                          },
                          //Navigator.push(context,MaterialPageRoute(builder: (context) => Page2())).then((value) { setState(() {});
                          /* () async {
                            FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text)
                                .then((value) async {
                              if (_selectedType == 1) {
                                supplier = false;
                                buyer = true;
                              }
                              User? user = FirebaseAuth.instance.currentUser;
                              String userId = user?.uid ?? '';
                              List<String> listOrders = [];
                              _users.doc(userId).set({
                                "id": user?.uid,
                                "user_fio": _ownerNameController.text,
                                "post": _postNameController.text,
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
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    '/selected_buyer_list_of_orders_page',
                                    (Route<dynamic> route) => false);
                              } else {
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    '/buyer_workplace_page',
                                    (Route<dynamic> route) => false);
                              }
                            });
                          }, */
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange[700],
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          ),
                          child: const Text(
                            'Редактировать',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 75,
                        child: ElevatedButton(
                          onPressed: () {
                            FirebaseAuth.instance.signOut().then((value) {
                              Navigator.pushReplacementNamed(context, '/home_page');
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange[700],
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          ),
                          child: const Text(
                            'Выйти из аккаунта',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    ); */
  }
}

class RegFieldWidget extends StatefulWidget {
  const RegFieldWidget({super.key, required this.controller, required this.title, required this.inputType});
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

class _ProfileInfoDisplayField extends StatelessWidget {
  const _ProfileInfoDisplayField({
    required this.fieldName,
    required this.userInfo,
    super.key,
  });

  final String fieldName;
  final String userInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fieldName,
            style: const TextStyle(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            userInfo,
            style: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
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
