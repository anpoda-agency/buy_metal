import 'package:buy_metal_app/domain/repository/application_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:buy_metal_app/domain/router/route_constants.dart';
import 'package:buy_metal_app/domain/router/route_impl.dart';
import 'package:buy_metal_app/features/1.2/bloc/buyer_orders_list_bloc.dart';
import 'package:buy_metal_app/features/core_widgets/error_dialog_widget.dart';
import 'package:buy_metal_app/features/core_widgets/rolled_form_ru_name_converter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class BuyerOrdersListPage extends StatefulWidget {
  const BuyerOrdersListPage({super.key});

  @override
  State<BuyerOrdersListPage> createState() => _BuyerOrdersListPageState();
}

class _BuyerOrdersListPageState extends State<BuyerOrdersListPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BuyerOrdersListBloc(
        applicationRepository: context.read<GetIt>().get<ApplicationRepository>(),
        userRepository: context.read<GetIt>().get<UserRepository>(),
        pageState: const PageState(),
      ),
      child: BlocConsumer<BuyerOrdersListBloc, BuyerOrdersListState>(listener: (context, state) {
        if (state is BuyerOrdersListChooseOrderState) {
          /*  Navigator.of(context).pushNamed(
            '/suppliers_list_page',
            arguments: state.pageState.proposalById,
            //arguments: state.pageState.response.elementAt(index),
            //? */
          context.read<RouteImpl>().push(OrdersRoutes.suppliersProposalsList.name, args: state.pageState.orderById);
          //);
        }
        if (state is BuyerOrdersListCreateOrderState) {
          context.read<RouteImpl>().push(CreateOrderRoutes.createOrder.name);
        }
        if (state is BuyerOrdersListErrorState) {
          ErrorDialog(
            dialogTittle: 'Ошибка',
            dialogText: state.pageState.errMsg,
          ).showMyDialog(context);
        }
      }, builder: (context, state) {
        var listApplcations = state.pageState.listApplcations;

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.black87,
            title: const Text(
              'Мои заявки',
            ),
            centerTitle: true,
          ),
          body: state.pageState.onAwait
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : listApplcations.isNotEmpty
                  //!(state.pageState.applicationResponse == const ApplicationGetCustomerApplicationsResponse())
                  //listOrdersModels.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: RefreshIndicator(
                        onRefresh: () async {
                          context.read<BuyerOrdersListBloc>().add(BuyerOrdersListInitEvent());
                        },
                        child: ListView.builder(
                            itemCount: //
                                listApplcations.length,
                            itemBuilder: (BuildContext context, index) {
                              /* if (listApplcations[index].rolledForm == '') {
                                listApplcations[index].rolledForm = '';
                              } */
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
                                      /*  Navigator.of(context).pushNamed(
                                            '/suppliers_list_page',
                                            arguments: listApplcations[index].id,
                                            //arguments: state.pageState.response.elementAt(index),
                                            //?
                                          ); */
                                      context.read<BuyerOrdersListBloc>().add(BuyerOrdersListChooseOrderEvent(
                                          listApplcations[index].id, listApplcations[index]));

                                      /*                                      
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) => SuppliersProposalsListPage(
                                                      args: listApplcations[index].id,
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
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              //if (listApplcations[index].rolledForm == '') ...[],
                                              Text(
                                                rolledFormRuNameConverter(listApplcations[index].rolledForm),
                                                style: const TextStyle(fontSize: 20, color: Colors.white),
                                              ),
                                              //rolledFormRuNameConverter
                                              //RolledFormRuNameConverterWidget(
                                              //    rolledFormEnum: listApplcations[index].rolledForm),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                listApplcations[index].rolledType,
                                                style: const TextStyle(fontSize: 20, color: Colors.white),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                listApplcations[index].rolledSize,
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
                                                listApplcations[index].rolledParams,
                                                style: const TextStyle(fontSize: 20, color: Colors.white),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                listApplcations[index].rolledGost,
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
                                                listApplcations[index].materialBrand,
                                                style: const TextStyle(fontSize: 20, color: Colors.white),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                listApplcations[index].materialParams,
                                                style: const TextStyle(fontSize: 20, color: Colors.white),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                listApplcations[index].materialGost,
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
                                                listApplcations[index].creationDate,
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
                      ),
                    )
                  : Stack(
                      children: [
                        RefreshIndicator(
                          onRefresh: () async {
                            context.read<BuyerOrdersListBloc>().add(BuyerOrdersListInitEvent());
                          },
                          child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (BuildContext context, index) {
                                return const SizedBox.shrink();
                              }),
                        ),
                        Padding(
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
                                      //Navigator.pushNamed(context, '/create_order_page');
                                      context.read<BuyerOrdersListBloc>().add(BuyerOrdersListCreateOrderEvent());
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orange[700],
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
                      ],
                    ),
        );
      }),
    );
  }
}
