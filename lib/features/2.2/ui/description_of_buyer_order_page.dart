import 'package:buy_metal_app/data/models/application_models/application_upload_search_response.dart';
import 'package:buy_metal_app/features/2.2/bloc/description_of_buyer_order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DescriptionOfBuyerOrderPage extends StatefulWidget {
  const DescriptionOfBuyerOrderPage({super.key, required this.args});
  final Object? args;

  @override
  State<DescriptionOfBuyerOrderPage> createState() => _DescriptionOfBuyerOrderPageState();
}

class _DescriptionOfBuyerOrderPageState extends State<DescriptionOfBuyerOrderPage> {
  //final args = ModalRoute.of(context)!.settings.arguments as ApplicationUploadCreateApplicationResponse;
  //final args = widget.args as ApplicationUploadCreateApplicationResponse;
  /*
  late OrderModel orderModel;
  UserModel userInfo = const UserModel();

  @override
  void initState() {
    orderModel = widget.args != null ? widget.args as OrderModel : const OrderModel();
    getIt.get<ProfileRepository>().getUserInfo(userId: orderModel.buyerId).then((value) => setState(() {
          userInfo = value;
        }));
    super.initState();
  }
  */

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ApplicationUploadSearchResponse;
    //final args = widget.args as ApplicationUploadSearchResponse;

    return BlocProvider(
      create: (context) => DescriptionOfBuyerOrderBloc(
        pageState: const PageState(),
        //applicationResponseRepository: context.read<GetIt>().get<ApplicationResponseRepository>(),
        applicationInfo: args,
        //applicationRepository: context.read<GetIt>().get<ApplicationRepository>(),
      ),
      child: BlocConsumer<DescriptionOfBuyerOrderBloc, DescriptionOfBuyerOrderState>(
        listener: (context, state) {},
        builder: (context, state) {
          //var model = state.pageState.applicationInfo.customer.companyName;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black87,
              title: const Text('Описание предложения'),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Center(
                        child: Text(
                          '${state.pageState.applicationInfo.customer.companyName} ${state.pageState.applicationInfo.customer.companyAddress}',
                          style: const TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                      Center(
                        child: Text(
                          'от ${state.pageState.applicationInfo.creationDate}',
                          style: const TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Номенклатура:',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${state.pageState.applicationInfo.rolledForm} ${state.pageState.applicationInfo.rolledType} ${state.pageState.applicationInfo.rolledSize}', //форма проката + классификация/тип профиля + размер
                        style: const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      Text(
                        '${state.pageState.applicationInfo.rolledParams} ${state.pageState.applicationInfo.rolledGost}', //параметры проката + гост на прокат
                        style: const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      Text(
                        '${state.pageState.applicationInfo.materialBrand} ${state.pageState.applicationInfo.materialParams} ${state.pageState.applicationInfo.materialGost}', //марка материала + параметры материала + ГОСТ на материал
                        style: const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Потребность в заявке:',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${state.pageState.applicationInfo.amount} т',
                            style: const TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            '/selection_of_create_proposal_page',
                            arguments: state.pageState.applicationInfo,
                          );
                          // Navigator.pushNamed(context, '/selection_of_create_proposal_page');
                          /* Navigator.of(context).push(
                            

                            MaterialPageRoute(
                                builder: (context) => SelectionOfCreateProposalPage(
                                      args: state.pageState.applicationInfo,
                                      //args: {'order_model': orderModel, 'user_model': userInfo},
                                    )),
                          ); */
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        ),
                        child: const Text(
                          'Сформировать предложение',
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
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Описание предложения'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    '${userInfo.companyName} ${userInfo.companyAdress}',
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                Center(
                  child: Text(
                    'от ${orderModel.dataCreate}',
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Номенклатура:',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${orderModel.formRolled} ${orderModel.type} ${orderModel.sizeRolled}', //форма проката + классификация/тип профиля + размер
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                Text(
                  '${orderModel.paramsRolled} ${orderModel.gostRolled}', //параметры проката + гост на прокат
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                Text(
                  '${orderModel.brandMaterial} ${orderModel.paramsMaterial} ${orderModel.gostMaterial}', //марка материала + параметры материала + ГОСТ на материал
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      'Потребность в заявке:',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${orderModel.requirement} т',
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, '/selection_of_create_proposal_page');
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => SelectionOfCreateProposalPage(
                                args: {'order_model': orderModel, 'user_model': userInfo},
                              )),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  child: const Text(
                    'Сформировать предложение',
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
