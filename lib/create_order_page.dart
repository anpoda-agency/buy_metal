import 'package:flutter/material.dart';

class CreateOrderPage extends StatefulWidget {
  const CreateOrderPage({super.key});

  @override
  State<CreateOrderPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey,
      appBar: AppBar(backgroundColor: Colors.black87,title: const Center(child: Text('Создание заявки'),),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Text('Выберите прокат', style: TextStyle(fontSize: 30, color: Colors.black),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                width: MediaQuery.of(context).size.width, 
                //height: 120, 
                //decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(15)),
                child: TextFormField(
                  //maxLines: 1,
                  //expands: true,
                  decoration: InputDecoration(border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(horizontal: 30),),
                  //initialValue: 'Выберите прокат',
                ),
                ),
            ),
            //const Text('AnMetal', style: TextStyle(fontSize: 50, color: Colors.white),),
            //SizedBox(height: 150,),
            
            const SizedBox(height: 50),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: const Text('Указать требования к параметрам проката (в производной форме):', style: TextStyle(fontSize: 20, color: Colors.black),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                width: MediaQuery.of(context).size.width, 
                //height: 120, 
                //decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(15)),
                child: TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(horizontal: 30),),
                  //initialValue: 'Выберите прокат',
                ),
                ),
            ),
            
             const SizedBox(height: 20),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: const Text('Указать требования к марке материала (в производной форме):', style: TextStyle(fontSize: 20, color: Colors.black),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                width: MediaQuery.of(context).size.width, 
                //height: 120, 
                //decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(15)),
                child: TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(horizontal: 30),),
                  //initialValue: 'Выберите прокат',
                ),
                ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width, 
                height: 120, 
                //decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(15)),
                child: ElevatedButton(onPressed: () {
                  //Navigator.pushNamed(context, '/buyer_orders_list_page'); 
                  },
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                            //side: BorderSide(width:8, color: Colors.yellow),
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
                  ),
                child: const Text('Отправить на проработку', style: TextStyle(fontSize: 20),),),),
            ),
            //SizedBox(height: 150,),
       
            //SizedBox(height: 150,),
          ],
        ),
      ),
    );
  }
}