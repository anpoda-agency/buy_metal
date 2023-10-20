import 'package:buy_metal_app/domain/repository/deal_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:buy_metal_app/domain/router/route_constants.dart';
import 'package:buy_metal_app/domain/router/route_impl.dart';
import 'package:buy_metal_app/features/3.4.1/bloc/supplier_deals_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SupplierDealsPage extends StatefulWidget {
  const SupplierDealsPage({super.key});

  @override
  State<SupplierDealsPage> createState() => _SupplierDealsPageState();
}

class _SupplierDealsPageState extends State<SupplierDealsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SupplierDealsBloc(
        //applicationRepository: context.read<GetIt>().get<ApplicationRepository>(),
        userRepository: context.read<GetIt>().get<UserRepository>(),
        dealRepository: context.read<GetIt>().get<DealRepository>(),
        pageState: const PageState(),
      ),
      child: BlocConsumer<SupplierDealsBloc, SupplierDealsState>(listener: (context, state) {
        /*  Navigator.of(context).pushNamed(
            '/suppliers_list_page',
            arguments: state.pageState.proposalById,
            //arguments: state.pageState.response.elementAt(index),
            //? */
        //context.read<RouteImpl>().push(OrdersRoutes.suppliersProposalsList.name, args: state.pageState.proposalById);
        //);
      }, builder: (context, state) {
        var listDeals = state.pageState.response;

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.black87,
            title: const Text(
              'Мои сделки',
            ),
            centerTitle: true,
          ),
          body: state.pageState.onAwait
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : listDeals.isNotEmpty
                  //!(state.pageState.applicationResponse == const ApplicationGetCustomerApplicationsResponse())
                  //listOrdersModels.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ListView.builder(
                          itemCount: //
                              listDeals.length,
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
                                    context.read<RouteImpl>().push(DealsSupplierRoutes.supplierDealStatusInfo.name,
                                        args: listDeals[index].id);
                                    /*  Navigator.of(context).pushNamed(
                                          '/suppliers_list_page',
                                          arguments: listApplcations[index].id,
                                          //arguments: state.pageState.response.elementAt(index),
                                          //?
                                        ); */
                                    //context
                                    //    .read<BuyerOrdersListBloc>()
                                    //    .add(BuyerOrdersListChooseProposalEvent(listApplcations[index].id));
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
                                            Text(
                                              //listApplcations[index].rolledForm,
                                              listDeals[index].application.rolledForm,
                                              style: const TextStyle(fontSize: 20, color: Colors.white),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              listDeals[index].application.rolledType,
                                              style: const TextStyle(fontSize: 20, color: Colors.white),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              listDeals[index].application.rolledSize,
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
                                              listDeals[index].application.rolledParams,
                                              style: const TextStyle(fontSize: 20, color: Colors.white),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              listDeals[index].application.rolledGost,
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
                                              listDeals[index].application.materialBrand,
                                              style: const TextStyle(fontSize: 20, color: Colors.white),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              listDeals[index].application.materialParams,
                                              style: const TextStyle(fontSize: 20, color: Colors.white),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              listDeals[index].application.materialGost,
                                              style: const TextStyle(fontSize: 20, color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              listDeals[index].status,
                                              style: const TextStyle(fontSize: 18, color: Colors.white),
                                            ),
                                            Text(
                                              listDeals[index].agreementDate,
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
                  : const Center(
                      child: Text(
                        'Список сделок пуст',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                    ),

          /* Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox.shrink(),
                          const Text(
                            'Список сделок пуст',
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
                                  //context.read<BuyerOrdersListBloc>().add(BuyerOrdersListCreateOrderEvent());
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
                    ), */
        );
      }),
    );
  }
}
