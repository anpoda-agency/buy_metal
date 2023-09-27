import 'package:buy_metal_app/domain/repository/application_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:buy_metal_app/features/1.3/bloc/suppliers_proposals_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SuppliersProposalsListPage extends StatefulWidget {
  const SuppliersProposalsListPage({super.key, required this.args});
  final Object? args;

  @override
  State<SuppliersProposalsListPage> createState() => _SuppliersProposalsListPageState();
}

class _SuppliersProposalsListPageState extends State<SuppliersProposalsListPage> {
/*
  OrderModel orderModel = const OrderModel();
  List<UserModel> listUsers = [];
  bool loading = true;

  @override
  void initState() {
    String id = widget.args != null ? widget.args as String : '';
    getIt.get<ProfileRepository>().getCurrentOrder(idOrder: id).then((value) => setState(() {
          orderModel = value ?? const OrderModel();
          getIt.get<ProfileRepository>().getUserForCurrentOrder(order: orderModel).then((value) => setState(() {
                listUsers = value;
                loading = false;
              }));
        }));
    super.initState();
  }
*/

  late final String args;

  /* @override
  void initState() {
    phoneAndPassword =
        (widget.args is Map<String, dynamic>) ? widget.args as Map<String, dynamic> : {'phone': '', 'password': ''};
    super.initState();
  } */

/*   @override
  void initState() {
    regRequest = (widget.args is Map<String, dynamic>)
        ? widget.args as AuthUploadRegisterNewUserRequest
        : {'phone': '', 'password': ''};
    super.initState(); */

  @override
  void initState() {
    args = widget.args as String;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  var args = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider(
      create: (context) => SuppliersProposalsListBloc(
        pageState: const PageState(),
        applicationRepository: context.read<GetIt>().get<ApplicationRepository>(),
        userRepository: context.read<GetIt>().get<UserRepository>(),
        applicationId: args,
      ),
      child: BlocConsumer<SuppliersProposalsListBloc, SuppliersProposalsListState>(
        //bloc: SuppliersProposalsListBloc,
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.black87,
              title: const Text('Перечень поставщиков'),
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
                                      Navigator.of(context).pushNamed('/description_of_supplier_proposal_page',
                                          arguments: state.pageState.response.elementAt(index));

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
                                    },
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

/*
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Перечень поставщиков'),
        centerTitle: true,
      ),
      body: orderModel.listProposalsModels.isNotEmpty && !loading
          ? Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                  itemCount: orderModel.listProposalsModels.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.black54,
                                Colors.grey.shade400,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.grey[500],
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DescriptionOfSupplierProposalPage(
                                        args: {
                                          'answer_model': orderModel
                                              .listProposalsModels[index],
                                          'user_model': listUsers[index]
                                        },
                                      )),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  listUsers[index].companyName,
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  listUsers[index].companyAdress,
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      orderModel.listProposalsModels[index]
                                              .similar
                                          ? 'Аналог'
                                          : 'Соответствие',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: orderModel
                                                  .listProposalsModels[index]
                                                  .similar
                                              ? Colors.yellow
                                              : Colors.greenAccent),
                                    ),
                                    Text(
                                      orderModel.listProposalsModels[index]
                                          .dataCreate,
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.white),
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
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
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
                          primary: Colors.orange[700],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
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
    */
  }
}
