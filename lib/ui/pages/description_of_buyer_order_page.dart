import 'package:flutter/material.dart';

class DescriptionOfBuyerOrderPage extends StatefulWidget {
  const DescriptionOfBuyerOrderPage({super.key});

  @override
  State<DescriptionOfBuyerOrderPage> createState() =>
      _DescriptionOfBuyerOrderPageState();
}

class _DescriptionOfBuyerOrderPageState
    extends State<DescriptionOfBuyerOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Center(
          child: Text('Описание предложения'),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                'ООО "МЕТАЛЛ" г. Москва',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(height: 10),
              const Text(
                'СООТВЕТСТВИЕ или АНАЛОГ',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Сортамент:',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Text(
                    'Лист 2x1250x2500',
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Требования к параметрам проката:',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Text(
                    'БТ-ПО ГОСТ 19904-90',
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Требования к марке металла:',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Text(
                    '08пс-II-Г ГОСТ 16523-97',
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                  SizedBox(height: 10),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, '/selection_of_create_proposal_page');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      //side: BorderSide(width:8, color: Colors.yellow),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    child: const Text(
                      'Сформировать предложение',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
