import 'package:buy_metal_app/domain/repository/deal_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:buy_metal_app/features/2.4.2.1/bloc/buyer_deal_status_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class BuyerDealStatusInfoPage extends StatefulWidget {
  const BuyerDealStatusInfoPage({super.key, required this.args});
  final Object? args;

  @override
  State<BuyerDealStatusInfoPage> createState() => _BuyerDealStatusInfoPageState();
}

class _BuyerDealStatusInfoPageState extends State<BuyerDealStatusInfoPage> {
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
  late final String args;

  @override
  void initState() {
    args = widget.args as String;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var args = ModalRoute.of(context)!.settings.arguments as ApplicationGetResponsesByApplicationIdResponse;
    return BlocProvider(
      create: (context) => BuyerDealStatusInfoBloc(
          orderId: args,
          dealRepository: context.read<GetIt>().get<DealRepository>(),
          //applicationRepository: context.read<GetIt>().get<ApplicationRepository>(),
          userRepository: context.read<GetIt>().get<UserRepository>(),
          pageState: const PageState()),
      child: BlocConsumer<BuyerDealStatusInfoBloc, BuyerDealStatusInfoState>(listener: (context, state) {
        // ниже if со страницы описания предложения
        /* 
        if (state is DescriptionOfSupplierProposalConfirmDealState) {
          //context.read<DescriptionOfSupplierProposalBloc>().add(DescriptionOfSupplierProposalConfirmDealEvent());

          // Вообще тут не главная страница вкладки сделок,
          // а конкретная сделка должна окткрыться.
          // Но я придумал как реализовать изначальный сценарий навигации,
          // так же как на карте сделать переход на контакты, но по закрытию контактов,
          // нужно делать го на экран заявок, так проще
          // надо доделать экран заявок и го сюда закинуть
          //context.read<RouteImpl>().go(DealsRoutes.deals.name);
          context.read<RouteImpl>().go(OrdersRoutes.supplierContacts.name, args: args);
        }
        */
      }, builder: (context, state) {
        var orderInfoById = state.pageState.response;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black87,
            title: const Text('Описание предложения в Сделках'),
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
                        '${orderInfoById.response.supplier.companyName} ${orderInfoById.response.supplier.companyAddress}',
                        style: const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    Center(
                      child: Text(
                        'от ${orderInfoById.response.creationDate}',
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
                          orderInfoById.response.similar ? 'Аналог' : 'Соответствует', //аналог
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
                      '${orderInfoById.response.rolledForm} ${orderInfoById.response.rolledType} ${orderInfoById.response.rolledSize}', //форма проката + классификация/тип профиля + размер
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    Text(
                      '${orderInfoById.response.rolledParams} ${orderInfoById.response.rolledGost}', //параметры проката + гост на прокат
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    Text(
                      '${orderInfoById.response.materialBrand} ${orderInfoById.response.materialParams} ${orderInfoById.response.materialGost}', //марка материала + параметры материала + ГОСТ на материал
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
                          '${orderInfoById.response.price} RUB',
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
                          '${orderInfoById.response.amount} т',
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
                          '${orderInfoById.response.fullPrice.floorToDouble()} RUB',
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
                          orderInfoById.response.inStock ? 'Дa' : 'Нет',
                          style: const TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                    orderInfoById.response.deliverDate.isNotEmpty
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
                                orderInfoById.response.deliverDate,
                                style: const TextStyle(fontSize: 20, color: Colors.black),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        //Navigator.of(context).pushNamed('/supplier_contacts_page', arguments: args);
                        /* 
                        CreateDealDialog(
                          //dialogTittle: 'Ошибка запроса',
                          dialogText:
                              'После просмотра контактов\nВы начинаете сделку\nс поставщиком и не сможете взаимодействовать\nс предложениями других поставщиков по данной заявке.',
                          //onPressed:
                          /* (context) => context
                              .read<DescriptionOfSupplierProposalBloc>()
                              .add(DescriptionOfSupplierProposalConfirmDealEvent()), */
                          context: context,
                        ).showMyDialog(context);
 */
                        /*
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => SupplierContactsPage(
                                args: args,
                              )),
                    );
                    */
                        // Код вставить в кнопку Вступить у поп апа сделки
                        //context
                        //    .read<DescriptionOfSupplierProposalBloc>()
                        //    .add(DescriptionOfSupplierProposalConfirmDealEvent());

                        // Поп ап на создание сделки
                        /* 
                        openDeal() {
                          context
                              .read<DescriptionOfSupplierProposalBloc>()
                              .add(DescriptionOfSupplierProposalConfirmDealEvent());
                        }
                         */

                        showDialog<void>(
                          context: context,
                          //barrierDismissible: false, // user must tap button!
                          barrierDismissible: true, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              //title: Text(dialogTittle),
                              //const Text('Пароли не совпадают'),
                              content: const SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text(
                                        'После просмотра контактов\nВы начинаете сделку\nс поставщиком и не сможете взаимодействовать\nс предложениями других поставщиков по данной заявке.'),
                                    //Text('Убедитесь, что вы ввели идентичные пароли, попробуйте повторить пароль еще раз'),
                                    //Text('Проверьте, чтобы пароли совпадали'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                /* 
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
             */
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      //openDeal,
                                      //onPressed;
                                      //Navigator.of(context).pushNamed('/supplier_contacts_page', arguments: args);
                                      //context.read<DescriptionOfSupplierProposalBloc>().add(DescriptionOfSupplierProposalConfirmDealEvent());
                                      /* (context) => context
                                            .read<DescriptionOfSupplierProposalBloc>()
                                            .add(DescriptionOfSupplierProposalConfirmDealEvent()); */

                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orange,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                      ),
                                      child: const Text(
                                        'Вступить',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        //Navigator.of(context).pushNamed('/supplier_contacts_page', arguments: args);
                                        //context.read<DescriptionOfSupplierProposalBloc>().add(DescriptionOfSupplierProposalConfirmDealEvent());
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orange,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                      ),
                                      child: const Text(
                                        'Закрыть',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                      child: const Text(
                        'Связаться',
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

class CreateDealDialog {
  const CreateDealDialog({
    //required this.dialogTittle,
    required this.dialogText,
    this.onPressed,
    this.context,
  });

  //final String dialogTittle;
  final String dialogText;
  final Function(BuildContext)? onPressed;
  final BuildContext? context;

  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      //barrierDismissible: false, // user must tap button!
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          //title: Text(dialogTittle),
          //const Text('Пароли не совпадают'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(dialogText),
                //Text('Убедитесь, что вы ввели идентичные пароли, попробуйте повторить пароль еще раз'),
                //Text('Проверьте, чтобы пароли совпадали'),
              ],
            ),
          ),
          actions: <Widget>[
            /* 
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
             */
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    //onPressed;
                    //Navigator.of(context).pushNamed('/supplier_contacts_page', arguments: args);
                    //context.read<DescriptionOfSupplierProposalBloc>().add(DescriptionOfSupplierProposalConfirmDealEvent());
                    /* 
                    (context) => context
                        .read<DescriptionOfSupplierProposalBloc>()
                        .add(DescriptionOfSupplierProposalConfirmDealEvent());
                         */
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  child: const Text(
                    'Вступить',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    //Navigator.of(context).pushNamed('/supplier_contacts_page', arguments: args);
                    //context.read<DescriptionOfSupplierProposalBloc>().add(DescriptionOfSupplierProposalConfirmDealEvent());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  child: const Text(
                    'Закрыть',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
