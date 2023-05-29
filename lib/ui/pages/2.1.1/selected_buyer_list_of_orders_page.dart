import 'package:buy_metal_app/main.dart';
import 'package:buy_metal_app/models/order_model.dart';
import 'package:buy_metal_app/repo/profile_repository.dart';
import 'package:buy_metal_app/ui/pages/2.2/description_of_buyer_order_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SelectedBuyerListOfOrdersPage extends StatefulWidget {
  const SelectedBuyerListOfOrdersPage({super.key});

  @override
  State<SelectedBuyerListOfOrdersPage> createState() => _SelectedBuyerListOfOrdersPageState();
}

class _SelectedBuyerListOfOrdersPageState extends State<SelectedBuyerListOfOrdersPage> {
  List<OrderModel> listOrders = [];

  @override
  void initState() {
    getIt.get<ProfileRepository>().getAllOrders().then((value) => setState(() {
          listOrders = value;
        }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Text('Заявки заказчиков'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.pushReplacementNamed(context, '/home_page');
                  });
                },
                icon: const Icon(Icons.logout_outlined)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            getIt.get<ProfileRepository>().getAllOrders().then((value) => setState(() {
                  listOrders = value;
                }));
          },
          backgroundColor: Colors.orange[700],
          child: const Icon(Icons.replay_outlined),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView.builder(
              itemCount: listOrders.length,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.black54,
                          Colors.grey.shade400,
                        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: Colors.grey[500],
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => DescriptionOfBuyerOrderPage(
                                    args: listOrders.elementAt(index),
                                  )),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  listOrders[index].formRolled,
                                  style: const TextStyle(fontSize: 20, color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  listOrders[index].type,
                                  style: const TextStyle(fontSize: 20, color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  listOrders[index].sizeRolled,
                                  style: const TextStyle(fontSize: 20, color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  listOrders[index].dataCreate,
                                  style: const TextStyle(fontSize: 20, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
                return Padding(
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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => DescriptionOfBuyerOrderPage(
                                    args: listOrders.elementAt(index),
                                  )),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            listOrders[index].dataCreate,
                            style: const TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ));
  }
}

// Navigator.of(context).push(
//                           MaterialPageRoute(
//                               builder: (context) => DescriptionOfBuyerOrderPage(
//                                     args: listOrders.elementAt(index),
//                                   )),
//                         );