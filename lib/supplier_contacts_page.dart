import 'package:flutter/material.dart';

class SupplierContactsPage extends StatefulWidget {
  const SupplierContactsPage({super.key});

  @override
  State<SupplierContactsPage> createState() => _SupplierContactsPageState();
}

class _SupplierContactsPageState extends State<SupplierContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey,
      appBar: AppBar(backgroundColor: Colors.black87,title: const Center(child: Text('Описание предложения'),),),
     body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text('РЕКВИЗИТЫ', style: TextStyle(fontSize: 40, color: Colors.black),),
              const SizedBox(height: 200),

              const Text('КОНТАКТЫ', style: TextStyle(fontSize: 40, color: Colors.black),),

              /*
              const Text('СООТВЕТСТВИЕ или АНАЛОГ', style: TextStyle(fontSize: 20, color: Colors.black),),
              const SizedBox(height: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Сортамент:', style: TextStyle(fontSize: 20, color: Colors.black),),
                  const Text('Лист 2x1250x2500', style: TextStyle(fontSize: 25, color: Colors.black),),
                  const SizedBox(height: 5),
                  const Text('Требования к параметрам проката:', style: TextStyle(fontSize: 20, color: Colors.black),),
                  const Text('БТ-ПО ГОСТ 19904-90', style: TextStyle(fontSize: 25, color: Colors.black),),
                  const SizedBox(height: 5),
                  const Text('Требования к марке металла:', style: TextStyle(fontSize: 20, color: Colors.black),),
                  const Text('08пс-II-Г ГОСТ 16523-97', style: TextStyle(fontSize: 25, color: Colors.black),),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text('Цена за кг:', style: TextStyle(fontSize: 20, color: Colors.black),),

                    ],
                  ),
                  const SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width, 
                  //height: 120, 
                  //decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(15)),
                       child: TextFormField(
                        //decoration: InputDecoration(border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(horizontal: 30),),
                    //initialValue: 'Выберите прокат',
                       ),
                    ),
                 ),
                 Row(
                    children: [
                      const Text('Наличие:', style: TextStyle(fontSize: 20, color: Colors.black),),

                    ],
                  ),
                  SizedBox(height: 30,),
                  const Text('Дата поступления на склад поставщика:', style: TextStyle(fontSize: 15, color: Colors.black),),
                  SizedBox(height: 5,),
                  const Text('19.02.2024', style: TextStyle(fontSize: 20, color: Colors.black),),
                  

                ],
              ),
   
              */
            ],
          ),
        ),
      ),
    );
  }
}