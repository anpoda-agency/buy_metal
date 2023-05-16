import 'package:flutter/material.dart';

class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 0,
        backgroundColor: Colors.grey[900],
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
                    child: Text(
                      'Регистрация',
                      style: TextStyle(fontSize: 42, color: Colors.white),
                    ),
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
                      TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[300],
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(15))),
                        keyboardType: TextInputType.emailAddress,
                      ),
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
                      TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[300],
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(15))),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Подтвердите пароль',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[300],
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(15))),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 75,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/buyer_workplace_page');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange[700],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          child: const Text(
                            'Зарегистрироваться',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),

      // Center(
      //   child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      //     const Text(
      //       'AnMetal',
      //       style: TextStyle(fontSize: 50, color: Colors.white),
      //     ),
      //     const SizedBox(
      //       height: 150,
      //     ),
      //     const Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      //       child: Align(
      //           alignment: Alignment.bottomLeft,
      //           child: Text(
      //             'Email',
      //             style: TextStyle(fontSize: 20, color: Colors.white),
      //           )),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 20),
      //       child: SizedBox(
      //         width: MediaQuery.of(context).size.width,
      //         height: 40,
      //         child: TextFormField(
      //           //decoration: new InputDecoration(labelText: "Email"),
      //           keyboardType: TextInputType.emailAddress,
      //           style: const TextStyle(color: Colors.white),
      //         ),
      //       ),
      //     ),
      //     const Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      //       child: Align(
      //           alignment: Alignment.bottomLeft,
      //           child: Text(
      //             'Password',
      //             style: TextStyle(fontSize: 20, color: Colors.white),
      //           )),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 20),
      //       child: SizedBox(
      //         width: MediaQuery.of(context).size.width,
      //         height: 40,
      //         child: TextFormField(
      //           //decoration: new InputDecoration(labelText: "Email"),
      //           keyboardType: TextInputType.visiblePassword,
      //           style: const TextStyle(color: Colors.white),
      //         ),
      //       ),
      //     ),
      //     const Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      //       child: Align(
      //           alignment: Alignment.bottomLeft,
      //           child: Text(
      //             'Confirm Password',
      //             style: TextStyle(fontSize: 20, color: Colors.white),
      //           )),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 20),
      //       child: SizedBox(
      //         width: MediaQuery.of(context).size.width,
      //         height: 40,
      //         child: TextFormField(
      //           //decoration: new InputDecoration(labelText: "Email"),
      //           keyboardType: TextInputType.visiblePassword,
      //           style: const TextStyle(color: Colors.white),
      //         ),
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 40,
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(20.0),
      //       child: SizedBox(
      //         width: MediaQuery.of(context).size.width,
      //         height: 80,
      //         //decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(15)),
      //         child: ElevatedButton(
      //           onPressed: ()
      //               // async
      //               {
      //             /*
      //            try {
      //             final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //               email: emailAddress,
      //               password: password,
      //             );
      //            } on FirebaseAuthException catch (e) {
      //               if (e.code == 'weak-password') {
      //                 print('The password provided is too weak.');
      //               } else if (e.code == 'email-already-in-use') {
      //                 print('The account already exists for that email.');
      //               }
      //             } catch (e) {
      //               print(e);
      //             }
      //             */
      //             Navigator.pushNamed(context, '/supplier_workplace_page');
      //           },
      //           style: ElevatedButton.styleFrom(
      //             primary: Colors.orange,
      //             //side: BorderSide(width:8, color: Colors.yellow),
      //             shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(15)),
      //           ),
      //           child: const Text(
      //             'Создать аккаунт',
      //             style: TextStyle(fontSize: 20),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ]),
      // ),
    );
  }
}
