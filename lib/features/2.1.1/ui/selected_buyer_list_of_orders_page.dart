import 'package:buy_metal_app/domain/repository/application_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:buy_metal_app/domain/router/route_constants.dart';
import 'package:buy_metal_app/domain/router/route_impl.dart';
import 'package:buy_metal_app/features/2.1.1/bloc/selected_buyer_list_of_orders_bloc.dart';
import 'package:buy_metal_app/features/core_widgets/error_dialog_widget.dart';
import 'package:buy_metal_app/features/core_widgets/rolled_form_ru_name_converter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SelectedBuyerListOfOrdersPage extends StatefulWidget {
  const SelectedBuyerListOfOrdersPage({super.key});

  @override
  State<SelectedBuyerListOfOrdersPage> createState() => _SelectedBuyerListOfOrdersPageState();
}

class _SelectedBuyerListOfOrdersPageState extends State<SelectedBuyerListOfOrdersPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectedBuyerListOfOrdersBloc(
        applicationRepository: context.read<GetIt>().get<ApplicationRepository>(),
        userRepository: context.read<GetIt>().get<UserRepository>(),
        pageState: const PageState(),
      ),
      child: BlocConsumer<SelectedBuyerListOfOrdersBloc, SelectedBuyerListOfOrdersState>(
        listener: (context, state) {
          if (state is SelectedBuyerListOfOrdersError) {
            ErrorDialog(
              dialogTittle: 'Ошибка',
              dialogText: state.pageState.errMsg,
            ).showMyDialog(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.black87,
              title: const Text('Заявки заказчиков'),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context, '/profile_page',
                        //arguments: state.pageState.request.source
                      );
                    },
                    icon: const Icon(
                      Icons.account_box,
                    )),
                /* IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.pushReplacementNamed(context, '/home_page');
                });
              },
              icon: const Icon(Icons.logout_outlined)), */
              ],
/*
                actions: [
                  IconButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut().then((value) {
                          Navigator.pushReplacementNamed(context, '/home_page');
                        });
                      },
                      icon: const Icon(Icons.logout_outlined)),
                ],
*/
            ),
            /*
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  getIt.get<ProfileRepository>().getAllOrders().then((value) => setState(() {
                        listOrders = value;
                      }));
                },
                backgroundColor: Colors.orange[700],
                child: const Icon(Icons.replay_outlined),
              ),
              */
            body: state.pageState.onAwait
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state.pageState.response.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: RefreshIndicator(
                          onRefresh: () async {
                            context.read<SelectedBuyerListOfOrdersBloc>().add(SelectedBuyerListOfOrdersInit());
                          },
                          child: ListView.builder(
                              itemCount: state.pageState.response.length,
                              //listOrders.length,
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
                                        /*
                                Navigator.of(context).pushNamed(
                                  '/description_of_buyer_order_page',
                                  arguments: state.pageState.response.elementAt(index),
                                );
                                */
                                        context.read<RouteImpl>().push(
                                              FindCustomerRoutes.descriptionOfBuyerOrder.name,
                                              args: state.pageState.response.elementAt(index),
                                            );
                                        /*  
                                  MaterialPageRoute(
                                      builder: (context) => DescriptionOfBuyerOrderPage(
                                            args:
                                                //state.pageState.response,
                                                state.pageState.response.elementAt(index),
                                          )),
                                );
                                */
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  rolledFormRuNameConverter(state.pageState.response[index].rolledForm),
                                                  style: const TextStyle(fontSize: 20, color: Colors.white),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  state.pageState.response[index].rolledType,
                                                  style: const TextStyle(fontSize: 20, color: Colors.white),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  state.pageState.response[index].rolledSize,
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
                                                  state.pageState.response[index].creationDate,
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

                                /*  
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
                              style: const TextStyle(
                                  fontSize: 25, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                 */
                              }),
                        ),
                      )
                    : Stack(
                        children: [
                          RefreshIndicator(
                            onRefresh: () async {
                              context.read<SelectedBuyerListOfOrdersBloc>().add(SelectedBuyerListOfOrdersInit());
                            },
                            child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (BuildContext context, index) {
                                  return const SizedBox.shrink();
                                }),
                          ),
                          const Center(
                            child: Text(
                              'Список заявок заказчиков пуст',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
          );
        },
      ),
    );
  }
}  


    /*
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

                /*  
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
                            style: const TextStyle(
                                fontSize: 25, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
 */
              }),
        ));
        */
 
// Navigator.of(context).push(
//                           MaterialPageRoute(
//                               builder: (context) => DescriptionOfBuyerOrderPage(
//                                     args: listOrders.elementAt(index),
//                                   )),
//                         );