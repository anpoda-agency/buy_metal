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
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Описание предложения'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    'ООО "ЗАКАЗЧИК" г. Москва',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                const Center(
                  child: Text(
                    'от 20.05.2023',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Номенклатура:',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Лист ОЦ 2х1250х2500', //форма проката + классификация/тип профиля + размер
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                const Text(
                  'Б-ПН-НО ГОСТ 14904-90', //параметры проката + гост на прокат
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                const Text(
                  '08КП МТ-2 ГОСТ14918-80', //марка материала + параметры материала + ГОСТ на материал
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Text(
                      'Потребность в заявке:',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '5.4 т',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
                // const SizedBox(
                //   height: 20,
                // ),
                // const Text(
                //   'Дата поступления на склад поставщика:',
                //   style: TextStyle(fontSize: 16, color: Colors.grey),
                // ),
                // const SizedBox(
                //   height: 5,
                // ),
                // const Text(
                //   '19.02.2024',
                //   style: TextStyle(fontSize: 20, color: Colors.black),
                // ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, '/selection_of_create_proposal_page');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  child: const Text(
                    'Сформировать предложение',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
