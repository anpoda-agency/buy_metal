import 'package:buy_metal_app/domain/repository/application_response_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:buy_metal_app/domain/router/route_constants.dart';
import 'package:buy_metal_app/domain/router/route_impl.dart';
import 'package:buy_metal_app/features/3.2.1/bloc/supplier_proposals_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SuppliersProposalsPage extends StatefulWidget {
  const SuppliersProposalsPage({
    super.key,
    //required this.args
  });
  //final Object? args;

  @override
  State<SuppliersProposalsPage> createState() => _SuppliersProposalsPageState();
}

class _SuppliersProposalsPageState extends State<SuppliersProposalsPage> {
/* 
  late final String args;

  @override
  void initState() {
    args = widget.args as String;

    super.initState();
  }
 */
  @override
  Widget build(BuildContext context) {
    //  var args = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider(
      create: (context) => SupplierProposalsBloc(
        pageState: const PageState(),
        userRepository: context.read<GetIt>().get<UserRepository>(),
        applicationResponseRepository: context.read<GetIt>().get<ApplicationResponseRepository>(),
      ),
      child: BlocConsumer<SupplierProposalsBloc, SupplierProposalsState>(
        //bloc: SuppliersProposalsListBloc,
        listener: (context, state) {
          if (state is SupplierProposalsChooseProposalState) {
            //Navigator.of(context).pushNamed('/description_of_supplier_proposal_page',
            //    arguments: state.pageState.response.elementAt(index));

            context
                .read<RouteImpl>()
                .push(ProposalsRoutes.supplierProposalDescription.name, args: state.pageState.proposalById);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.black87,
              title: const Text('Мои предложения'),
              centerTitle: true,
            ),
            body: state.pageState.onAwait
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state.pageState.response.isNotEmpty
                    //orderModel.listProposalsModels.isNotEmpty && !loading
                    ? Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ListView.builder(
                            itemCount: state.pageState.response.length,
                            //orderModel.listProposalsModels.length,
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
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      //Navigator.of(context).pushNamed('/description_of_supplier_proposal_page',
                                      //    arguments: state.pageState.response.elementAt(index));
                                      context
                                          .read<SupplierProposalsBloc>()
                                          .add(SupplierProposalsChooseProposalEvent(state.pageState.response[index]));
                                    },
                                    /*
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => DescriptionOfSupplierProposalPage(
                                              args: {
                                                'answer_model': orderModel.listProposalsModels[index],
                                                'user_model': listUsers[index]
                                              },
                                            )),
                                  );
                                  */

                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.pageState.response[index].supplier.companyName,
                                            style: const TextStyle(fontSize: 20, color: Colors.white),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            state.pageState.response[index].supplier.companyAddress,
                                            style: const TextStyle(fontSize: 20, color: Colors.white),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                state.pageState.response[index].similar ? 'Аналог' : 'Соответствие',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: state.pageState.response[index].similar
                                                        ? Colors.yellow
                                                        : Colors.greenAccent),
                                              ),
                                              Text(
                                                state.pageState.response[index].creationDate,
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
                              'Поставщики пока не ответили \nна данную заявку',
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
                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange[700],
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                  ),
                                  child: const Text(
                                    'Вернуться в Мои заявки',
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
        },
      ),
    );
  }
}
