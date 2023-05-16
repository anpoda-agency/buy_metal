
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      //appBar: AppBar(title: const Center(child: Text('AnMetal'),),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('AnMetal', style: TextStyle(fontSize: 50, color: Colors.white),),
            SizedBox(height: 150,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width, 
                height: 120, 
                //decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(15)),
                child: ElevatedButton(onPressed: () {Navigator.pushNamed(context, '/auth_page'); },
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                            //side: BorderSide(width:8, color: Colors.yellow),
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
                  ),
                child: const Text('Войти', style: TextStyle(fontSize: 20),),),),
            ),
            //SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width, 
                height: 120,
                child: ElevatedButton(onPressed: () {Navigator.pushNamed(context, '/reg_page'); }, 
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                            //side: BorderSide(width:8, color: Colors.yellow),
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
                  ),
                child: const Text('Регистрация', style: TextStyle(fontSize: 20),),),),
                
            ),
            SizedBox(height: 150,),
          ],
        ),
      ), //SizedBox(width: 10, height: 10,),
    );
  }
}


/*
class StartWidget extends StatelessWidget {
  //const AuthWidget ({Key? key}) :super(key: key);
  const StartWidget({super.key});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      //appBar: AppBar(title: const Center(child: Text('AnMetal'),),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('AnMetal', style: TextStyle(fontSize: 50, color: Colors.white),),
            SizedBox(height: 150,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width, 
                height: 120, 
                //decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(15)),
                child: ElevatedButton(onPressed: () {Navigator.pushNamed(context, '/auth_page'); },
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                            //side: BorderSide(width:8, color: Colors.yellow),
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
                  ),
                child: const Text('Войти', style: TextStyle(fontSize: 20),),),),
            ),
            //SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width, 
                height: 120,
                child: ElevatedButton(onPressed: () {Navigator.pushNamed(context, '/reg_page'); }, 
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                            //side: BorderSide(width:8, color: Colors.yellow),
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
                  ),
                child: const Text('Регистрация', style: TextStyle(fontSize: 20),),),),
                
            ),
            SizedBox(height: 150,),
          ],
        ),
      ), //SizedBox(width: 10, height: 10,),
    );
  }
}
*/
