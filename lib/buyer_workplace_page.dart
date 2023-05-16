import 'package:flutter/material.dart';

class BuyerWorkplacePage extends StatelessWidget {
  const BuyerWorkplacePage({super.key});

   @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Center(
          child: Text('AnMetal'),
        ),
      ),
      backgroundColor: Colors.white70,
      //appBar: AppBar(title: const Center(child: Text('AnMetal'),),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //const Text('AnMetal', style: TextStyle(fontSize: 50, color: Colors.white),),
            //SizedBox(height: 150,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width, 
                height: 120, 
                //decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(15)),
                child: ElevatedButton(onPressed: () {Navigator.pushNamed(context, '/buyer_orders_list_page'); },
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                            //side: BorderSide(width:8, color: Colors.yellow),
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
                  ),
                child: const Text('Ваши заявки', style: TextStyle(fontSize: 20),),),),
            ),
            SizedBox(height: 150,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width, 
                height: 120,
                child: ElevatedButton(onPressed: () {Navigator.pushNamed(context, '/create_order_page'); }, 
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                            //side: BorderSide(width:8, color: Colors.yellow),
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
                  ),
                child: const Text('Разместить Заявку', style: TextStyle(fontSize: 20),),),),
                
            ),
            //SizedBox(height: 150,),
          ],
        ),
      ), //SizedBox(width: 10, height: 10,),
    );
  }
}