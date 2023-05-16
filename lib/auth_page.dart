import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black87,),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('AnMetal', style: TextStyle(fontSize: 50, color: Colors.white),),
          SizedBox(height: 150,),
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text('Login', style: TextStyle(fontSize: 20, color: Colors.white),)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: MediaQuery.of(context).size.width, 
              height: 40,
              child: TextFormField(
                    //decoration: new InputDecoration(labelText: "Email"),
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.white),
                  ),
            ),
            ),
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text('Password', style: TextStyle(fontSize: 20, color: Colors.white),)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: MediaQuery.of(context).size.width, 
              height: 40,
              child: TextFormField(
                    //decoration: new InputDecoration(labelText: "Email"),
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(color: Colors.white),
                  ),
            ),
            ),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width, 
                height: 80, 
                //decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(15)),
                child: ElevatedButton(onPressed: () {
                  Navigator.pushNamed(context, 
                  '/buyer_workplace_page'
                  ); },
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                            //side: BorderSide(width:8, color: Colors.yellow),
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
                  ),
                child: const Text('Войти', style: TextStyle(fontSize: 20),),),),
            ),
        ]),
      ),
    );
  }
}