import 'package:flutter/material.dart';

class BuyerOrdersListPage extends StatefulWidget {
  const BuyerOrdersListPage({super.key});

  @override
  State<BuyerOrdersListPage> createState() => _BuyerOrdersListPageState();
}

const List<String> products = <String>[
  'Лист 2x1250x2500', 'Швеллер 16У', 'Швеллер 16П', 'Шестигранник 16',
//'Лист 2x1250x2500', 'Швеллер 16У', 'Швеллер 16П', 'Шестигранник 16','Лист 2x1250x2500', 'Швеллер 16У', 'Швеллер 16П', 'Шестигранник 16','Лист 2x1250x2500', 'Швеллер 16У', 'Швеллер 16П', 'Шестигранник 16',
];

class _BuyerOrdersListPageState extends State<BuyerOrdersListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.filter_list,
              size: 30,
            ),
          ),
        ],
        backgroundColor: Colors.black87,
        title: Center(
          child: const Text(
            'Ваши Заявки',
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: products.length,
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
                      Navigator.pushNamed(context, '/suppliers_list_page');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          products[index],
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
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