import 'package:buy_metal_app/main.dart';
import 'package:buy_metal_app/models/order_model.dart';
import 'package:buy_metal_app/repo/profile_repository.dart';
import 'package:flutter/material.dart';

class BuyerOrdersListPage extends StatefulWidget {
  const BuyerOrdersListPage({super.key});

  @override
  State<BuyerOrdersListPage> createState() => _BuyerOrdersListPageState();
}

class _BuyerOrdersListPageState extends State<BuyerOrdersListPage> {
  late List<OrderModel> listOrdersModels;

  @override
  void initState() {
    listOrdersModels = getIt.get<ProfileRepository>().user.listOrdersModels;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.filter_list,
              size: 30,
            ),
          ),
        ],
        backgroundColor: Colors.black87,
        title: const Text(
          'Мои заявки',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
            itemCount: listOrdersModels.length,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                //padding: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      border: Border.all(width: 3),
                      borderRadius: BorderRadius.circular(5)),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/suppliers_list_page',
                          arguments: listOrdersModels[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          listOrdersModels[index].dataCreate,
                          style: const TextStyle(fontSize: 25, color: Colors.white),
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
