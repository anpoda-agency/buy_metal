import 'package:buy_metal_app/domain/repository/deal_repository.dart';
import 'package:buy_metal_app/features/2.4.4/bloc/buyer_deal_supplier_proposal_bloc.dart';
import 'package:buy_metal_app/features/core_widgets/rolled_form_ru_name_converter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class BuyerDealSupplierProposalPage extends StatefulWidget {
  const BuyerDealSupplierProposalPage({
    super.key,
    //required this.args
  });
  //final Object? args;

  @override
  State<BuyerDealSupplierProposalPage> createState() => _BuyerDealSupplierProposalPageState();
}

class _BuyerDealSupplierProposalPageState extends State<BuyerDealSupplierProposalPage> {
  /* 
  AnswerOrderModel answerModel = const AnswerOrderModel();
  UserModel userModel = const UserModel();

  @override
  void initState() {
    Map<String, dynamic> map = widget.args != null ? widget.args as Map<String, dynamic> : {};
    answerModel = map['answer_model'];
    userModel = map['user_model'];
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
      create: (context) => BuyerDealSupplierProposalBloc(
          //infoForDeal: args,
          dealRepository: context.read<GetIt>().get<DealRepository>(),
          //applicationRepository: context.read<GetIt>().get<ApplicationRepository>(),
          //userRepository: context.read<GetIt>().get<UserRepository>(),
          pageState: const PageState()),
      child: BlocConsumer<BuyerDealSupplierProposalBloc, BuyerDealSupplierProposalState>(listener: (context, state) {
        /* if (state is DescriptionOfSupplierProposalConfirmDealState) {
          //context.read<DescriptionOfSupplierProposalBloc>().add(DescriptionOfSupplierProposalConfirmDealEvent());

          // Вообще тут не главная страница вкладки сделок,
          // а конкретная сделка должна окткрыться.
          // Но я придумал как реализовать изначальный сценарий навигации,
          // так же как на карте сделать переход на контакты, но по закрытию контактов,
          // нужно делать го на экран заявок, так проще
          // надо доделать экран заявок и го сюда закинуть
          //context.read<RouteImpl>().go(DealsRoutes.deals.name);
          context.read<RouteImpl>().go(OrdersRoutes.supplierContacts.name, args: args);
        } */
      }, builder: (context, state) {
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
                        '${state.pageState.dealByIdInfo.response.supplier.companyName} ${state.pageState.dealByIdInfo.response.supplier.companyAddress}',
                        style: const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    Center(
                      child: Text(
                        'от ${state.pageState.dealByIdInfo.response.creationDate}',
                        style: const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Text(
                          'Соответствие заявке:',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          state.pageState.dealByIdInfo.response.similar ? 'Аналог' : 'Соответствует', //аналог
                          style: const TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Номенклатура:',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${rolledFormRuNameConverter(state.pageState.dealByIdInfo.response.rolledForm)} ${state.pageState.dealByIdInfo.response.rolledType} ${state.pageState.dealByIdInfo.response.rolledSize}', //форма проката + классификация/тип профиля + размер
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    Text(
                      '${state.pageState.dealByIdInfo.response.rolledParams} ${state.pageState.dealByIdInfo.response.rolledGost}', //параметры проката + гост на прокат
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    Text(
                      '${state.pageState.dealByIdInfo.response.materialBrand} ${state.pageState.dealByIdInfo.response.materialParams} ${state.pageState.dealByIdInfo.response.materialGost}', //марка материала + параметры материала + ГОСТ на материал
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text(
                          'Цена за тонну (с НДС):',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${state.pageState.dealByIdInfo.response.price} RUB',
                          style: const TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
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
                          '${state.pageState.dealByIdInfo.response.amount} т',
                          style: const TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Сумма (с НДС):',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${state.pageState.dealByIdInfo.response.fullPrice.floorToDouble()} RUB',
                          style: const TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Наличие:',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          state.pageState.dealByIdInfo.response.inStock ? 'Дa' : 'Нет',
                          style: const TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                    state.pageState.dealByIdInfo.response.deliverDate.isNotEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Дата поступления на склад поставщика:',
                                style: TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                state.pageState.dealByIdInfo.response.deliverDate,
                                style: const TextStyle(fontSize: 20, color: Colors.black),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
