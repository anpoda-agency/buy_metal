import 'package:buy_metal_app/domain/repository/auth_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:buy_metal_app/domain/router/route_constants.dart';
import 'package:buy_metal_app/domain/router/route_impl.dart';
import 'package:buy_metal_app/features/auth/bloc/auth_bloc.dart';
import 'package:buy_metal_app/features/core_widgets/error_dialog_widget.dart';
import 'package:buy_metal_app/features/core_widgets/label_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({
    super.key,
  });

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (constext) => AuthBloc(
        authRepository: context.read<GetIt>().get<AuthRepository>(),
        userRepository: context.read<GetIt>().get<UserRepository>(),
        pageState: const PageState(),
      ),
      child: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
        if (state is AuthAllowedToPush) {
          //print('Login succes for, ${state.pageState.response.user.fullName}');
          if (state.pageState.response.user.position == 'SUPPLIER') {
            //Navigator.pushNamedAndRemoveUntil(
            //    context, '/selected_buyer_list_of_orders_page', (Route<dynamic> route) => false);
            context.read<RouteImpl>().go(DealsRoutes.deals.name);
          } else {
            //Navigator.pushNamedAndRemoveUntil(context, '/buyer_workplace_page', (Route<dynamic> route) => false);
            context.read<RouteImpl>().go(DealsRoutes.deals.name);
          }
        }
        if (state is AuthError) {
          //print(state.pageState.errMsg);
          ErrorDialog(
            dialogTittle: 'Неверный логин \nили пароль',
            dialogText: state.pageState.errMsg,
          ).showMyDialog(context);
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[900],
            elevation: 0,
            /*
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context, '/buyer_workplace_page',
                      //arguments: state.pageState.request.source
                    );
                  },
                  icon: const Icon(
                    Icons.launch,
                    color: Colors.red,
                  )),
            ],
            */
          ),
          backgroundColor: Colors.grey[900],
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.85,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox.shrink(),
                      const Center(
                        child: LabelWidget(title: 'Авторизация'),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Эл. почта',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          authTextField(
                            false,
                            _emailTextController,
                            (value) => context.read<AuthBloc>().add(AuthInputEmail(value)),
                            isErrorState: state.pageState.emailError,
                            errorText: state.pageState.errorEmailText,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Пароль',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          authTextField(
                            true,
                            _passwordTextController,
                            (value) => context.read<AuthBloc>().add(AuthInputPassword(value)),
                            isErrorState: state.pageState.passwordError,
                            errorText: state.pageState.errorPasswordText,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 75,
                              child: authButton(
                                context,
                                () => context.read<AuthBloc>().add(AuthSendLogin()),
                                /* 
                                    context,
                                    () => FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: _emailTextController.text,
                                            password:
                                                _passwordTextController.text)
                                        .then((value) async {
                                      var res = await context
                                          .read<GetIt>()
                                          .get<ProfileRepository>()
                                          .saveUser(id: value.user!.uid)
                                          .whenComplete(() {
                                        getIt
                                                .get<ProfileRepository>()
                                                .user
                                                .buyer
                                            ? Navigator.pushNamedAndRemoveUntil(
                                                context,
                                                '/buyer_workplace_page',
                                                (Route<dynamic> route) => false)
                                            : Navigator.pushNamedAndRemoveUntil(
                                                context,
                                                '/selected_buyer_list_of_orders_page',
                                                (Route<dynamic> route) =>
                                                    false);
                                      });
                                    }),
                                    */
                              )),
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

Widget authTextField(
  bool isPasswordType,
  TextEditingController controller,
  Function(String) onChanged, {
  String? errorText,
  bool isErrorState = false,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextField(
        onChanged: onChanged,
        controller: controller,
        obscureText: isPasswordType,
        enableSuggestions: !isPasswordType,
        autocorrect: !isPasswordType,
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
        keyboardType: isPasswordType ? TextInputType.visiblePassword : TextInputType.emailAddress,
      ),
      errorText != null && isErrorState
          ? Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration:
                    BoxDecoration(color: Colors.grey[900], borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Text(
                  errorText,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.red),
                ),
              ),
            )
          : const SizedBox(
              height: 20,
            ),
    ],
  );
}

ElevatedButton authButton(BuildContext context, Function() onTap) {
  return ElevatedButton(
    onPressed: onTap,
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.orange[700],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),
    child: const Text(
      'Войти',
      style: TextStyle(fontSize: 20),
    ),
  );
}
