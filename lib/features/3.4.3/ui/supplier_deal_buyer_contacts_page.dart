import 'package:buy_metal_app/domain/repository/deal_repository.dart';
import 'package:buy_metal_app/domain/router/route_constants.dart';
import 'package:buy_metal_app/domain/router/route_impl.dart';
import 'package:buy_metal_app/features/3.4.3/bloc/supplier_deal_buyer_contacts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SupplierDealBuyerContactsPage extends StatefulWidget {
  const SupplierDealBuyerContactsPage({
    super.key,
    //required this.args
  });
  //final Object? args;

  @override
  State<SupplierDealBuyerContactsPage> createState() => _SupplierDealBuyerContactsPageState();
}

class _SupplierDealBuyerContactsPageState extends State<SupplierDealBuyerContactsPage> {
  /* 
  UserModel userModel = const UserModel();
  @override
  void initState() {
    userModel =
        widget.args != null ? widget.args as UserModel : const UserModel();
    super.initState();
  }
 */

  //late final ApplicationGetResponsesByApplicationIdResponse args;

  @override
  void initState() {
    //args = widget.args as ApplicationGetResponsesByApplicationIdResponse;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var args = ModalRoute.of(context)!.settings.arguments as ApplicationGetResponsesByApplicationIdResponse;
    return BlocProvider(
      create: (context) => SupplierDealBuyerContactsBloc(
        dealRepository: context.read<GetIt>().get<DealRepository>(),
        pageState: const PageState(),
      ),
      child: BlocConsumer<SupplierDealBuyerContactsBloc, SupplierDealBuyerContactsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black87,
              title: const Text('Информация о поставщике'),
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
                      const Center(
                        child: Text(
                          'Заказчик',
                          style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Наименование организации',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SelectableText(
                        state.pageState.dealByIdInfo.application.customer.companyName,
                        //userModel.companyName,
                        style: const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Адрес',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SelectableText(
                        state.pageState.dealByIdInfo.application.customer.companyAddress,
                        //userModel.companyAdress,
                        style: const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'ИНН',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SelectableText(
                        state.pageState.dealByIdInfo.application.customer.tin.toString(),
                        //userModel.inn.toString(),
                        style: const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      const SizedBox(height: 20),
                      const Center(
                        child: Text(
                          'Контакты',
                          style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'ФИО',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SelectableText(
                        state.pageState.dealByIdInfo.application.customer.fullName.toString(),
                        //userModel.userFIO,
                        style: const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      /*
                const Text(
                  'Должность',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                
                const SizedBox(
                  height: 10,
                ),
                SelectableText(
                  //args.supplier.
                  userModel.post,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                
                const SizedBox(
                  height: 20,
                ),
                */
                      const Text(
                        'Номер телефона',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SelectableText(
                        state.pageState.dealByIdInfo.application.customer.phone,
                        //userModel.phone,
                        style: const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Электронная почта',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SelectableText(
                        state.pageState.dealByIdInfo.application.customer.email,
                        //userModel.email,
                        style: const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
    /*  */
  }
}
