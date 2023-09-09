import 'package:buy_metal_app/features/1.2/bloc/buyer_orders_list_bloc.dart';
import 'package:buy_metal_app/main.dart';
import 'package:buy_metal_app/data/models/firebase_models/order_model.dart';
import 'package:buy_metal_app/repo/profile_repository.dart';
import 'package:buy_metal_app/features/1.3/ui/suppliers_proposals_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuyerOrdersListPage extends StatefulWidget {
  const BuyerOrdersListPage({super.key});

  @override
  State<BuyerOrdersListPage> createState() => _BuyerOrdersListPageState();
}

class _BuyerOrdersListPageState extends State<BuyerOrdersListPage> {
  late List<OrderModel> listOrdersModels;

  @override
  void initState() {
    listOrdersModels = getIt.get<ProfileRepository>().user.listOrdersModels ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BuyerOrdersListBloc(pageState: const PageState()),
      child: BlocConsumer<BuyerOrdersListBloc, BuyerOrdersListState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.black87,
                title: const Text(
                  'Мои заявки',
                ),
                centerTitle: true,
              ),
              body: listOrdersModels.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ListView.builder(
                          itemCount: listOrdersModels.length,
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
                                        offset: const Offset(0, 3), // changes position of shadow
                                      ),
                                    ],
                                    color: Colors.grey[500],
                                    border: Border.all(width: 1, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) => SuppliersProposalsListPage(
                                                args: listOrdersModels[index].id,
                                              )),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              listOrdersModels[index].formRolled,
                                              style: const TextStyle(fontSize: 20, color: Colors.white),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              listOrdersModels[index].type,
                                              style: const TextStyle(fontSize: 20, color: Colors.white),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              listOrdersModels[index].sizeRolled,
                                              style: const TextStyle(fontSize: 20, color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              listOrdersModels[index].paramsRolled,
                                              style: const TextStyle(fontSize: 20, color: Colors.white),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              listOrdersModels[index].gostRolled,
                                              style: const TextStyle(fontSize: 20, color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              listOrdersModels[index].brandMaterial,
                                              style: const TextStyle(fontSize: 20, color: Colors.white),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              listOrdersModels[index].paramsMaterial,
                                              style: const TextStyle(fontSize: 20, color: Colors.white),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              listOrdersModels[index].gostMaterial,
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
                                              listOrdersModels[index].dataCreate,
                                              style: const TextStyle(fontSize: 18, color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox.shrink(),
                          const Text(
                            'Список заявок пуст',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 65,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/create_order_page');
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange[700],
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                ),
                                child: const Text(
                                  'Создать заявку',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            );
          }),
    );
  }
}
