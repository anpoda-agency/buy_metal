import 'package:buy_metal_app/main.dart';
import 'package:buy_metal_app/repo/profile_repository.dart';
import 'package:buy_metal_app/ui/core_widgets/label_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        elevation: 0,
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
                      authTextField(false, _emailTextController),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Пароль',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      authTextField(true, _passwordTextController),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 75,
                          child: authButton(
                            context,
                            () => FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: _emailTextController.text,
                                    password: _passwordTextController.text)
                                .then((value) async {
                              var res = await context
                                  .read<GetIt>()
                                  .get<ProfileRepository>()
                                  .saveUser(id: value.user!.uid)
                                  .whenComplete(() {
                                getIt.get<ProfileRepository>().user.buyer
                                    ? Navigator.pushNamedAndRemoveUntil(context,
                                        '/buyer_workplace_page', (Route<dynamic> route) => false)
                                    : Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        '/selected_buyer_list_of_orders_page',
                                        (Route<dynamic> route) => false);
                              });
                            }),
                          )),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

TextField authTextField(
  bool isPasswordType,
  TextEditingController controller,
) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
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
    keyboardType: isPasswordType ? TextInputType.visiblePassword : TextInputType.emailAddress,
  );
}

ElevatedButton authButton(BuildContext context, Function() onTap) {
  return ElevatedButton(
    onPressed: onTap,
    style: ElevatedButton.styleFrom(
      primary: Colors.orange[700],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),
    child: const Text(
      'Войти',
      style: TextStyle(fontSize: 20),
    ),
  );
}
