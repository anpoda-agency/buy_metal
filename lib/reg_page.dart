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
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'AnMetal',
            style: TextStyle(fontSize: 50, color: Colors.white),
          ),
          const SizedBox(
            height: 150,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Email',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: TextFormField(
                //decoration: new InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Password',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: TextFormField(
                //decoration: new InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.visiblePassword,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Confirm Password',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: TextFormField(
                //decoration: new InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.visiblePassword,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 80,
              //decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(15)),
              child: ElevatedButton(
                onPressed: ()
                    // async
                    {
                  /*
                 try {
                  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailAddress,
                    password: password,
                  );
                 } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                  */
                  Navigator.pushNamed(context, '/supplier_workplace_page');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  //side: BorderSide(width:8, color: Colors.yellow),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                child: const Text(
                  'Создать аккаунт',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
