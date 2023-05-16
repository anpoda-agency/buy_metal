import 'package:flutter/material.dart';

class SuppliersListPage extends StatefulWidget {
  const SuppliersListPage({super.key});

  @override
  State<SuppliersListPage> createState() => _SuppliersListPageState();
}

const List<String> suppliers = <String>[
  'ООО "МЕТАЛЛ"', '*Поставщик 2', '*Поставщик 3', '*Поставщик 4',
//'ООО "МЕТАЛЛ"', '*Поставщик 2', '*Поставщик 3', '*Поставщик 3','ООО "МЕТАЛЛ"', '*Поставщик 2', '*Поставщик 3', '*Поставщик 3','ООО "МЕТАЛЛ"', '*Поставщик 2', '*Поставщик 3', '*Поставщик 3',
];
const List<String> cities = <String>[
  'Москва',
  '*Город 2',
  '*Город 3',
  '*Город 4',
];

// 'ООО "МЕТАЛЛ"', '*Поставщик 2', '*Поставщик 3', '*Поставщик 3',

// ПЕРЕПИСАТЬ ПОД ПОСТАВЩИКОВ СПИСОК

class _SuppliersListPageState extends State<SuppliersListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Center(
          child: Text('Перечень Поставщиков'),
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: suppliers.length,
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
                          context, '/supplier_proposals_list_page');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 4,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              suppliers[index],
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "г. ${cities[index]}",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
