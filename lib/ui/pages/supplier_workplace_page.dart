import 'package:flutter/material.dart';

class SupplierWorkplacePage extends StatefulWidget {
  const SupplierWorkplacePage({super.key});

  @override
  State<SupplierWorkplacePage> createState() => _SupplierWorkplacePageState();
}

const List<String> buyers = <String>[
  'ООО "Инжиниринг"',
  '*Заказчик 2',
  '*Заказчик 3',
  '*Заказчик 4',
];

class _SupplierWorkplacePageState extends State<SupplierWorkplacePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Center(
          child: Text('AnMetal'),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: const Text(
              'Список организаций разместивших заявки:',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: buyers.length,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    //padding: const EdgeInsets.all(8.0),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      //color: Colors.orange,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          border: Border.all(width: 3),
                          borderRadius: BorderRadius.circular(5)),

                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/selected_buyer_list_of_orders_page');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                buyers[index],
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              )),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
