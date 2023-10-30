import 'package:buy_metal_app/domain/repository/deal_repository.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:buy_metal_app/domain/router/route_constants.dart';
import 'package:buy_metal_app/domain/router/route_impl.dart';
import 'package:buy_metal_app/features/3.4.2.1/bloc/supplier_deal_status_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SupplierDealStatusInfoPage extends StatefulWidget {
  const SupplierDealStatusInfoPage({super.key, required this.args});
  final Object? args;

  @override
  State<SupplierDealStatusInfoPage> createState() => _SupplierDealStatusInfoPageState();
}

class _SupplierDealStatusInfoPageState extends State<SupplierDealStatusInfoPage> {
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
    /* bool isConfirmDeal = false;
    bool isConfirmSupply = false;
    bool isConfirmPayment = false;
    bool isConfirmReceiptProduct = false; */

    return BlocProvider(
      create: (context) => SupplierDealStatusInfoBloc(
          orderId: args,
          dealRepository: context.read<GetIt>().get<DealRepository>(),
          //applicationRepository: context.read<GetIt>().get<ApplicationRepository>(),
          userRepository: context.read<GetIt>().get<UserRepository>(),
          pageState: const PageState()),
      child: BlocConsumer<SupplierDealStatusInfoBloc, SupplierDealStatusInfoState>(listener: (context, state) {
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
        if (state is SupplierDealStatusInfoOpenSupplierContactsInfoState) {}
        if (state is SupplierDealStatusInfoOpenSupplierProposalInfoState) {}
        if (state is SupplierDealStatusInfoCancelDealState) {
          context.read<RouteImpl>().pop();
          //context.read<RouteImpl>().go(DealsSupplierRoutes.dealsSupplier.name);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            margin: EdgeInsets.symmetric(vertical: 140, horizontal: 20),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.green, width: 2),
              //borderRadius: BorderRadius.circular(0),
            ),
            backgroundColor: Colors.green.withOpacity(0.6),
            content: Row(
              children: [
                Icon(
                  Icons.sentiment_very_dissatisfied,
                  color: Colors.amber[900],
                ),
                SizedBox(width: 20),
                Text(
                  'Сделка отменена',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            /*
                                          action: SnackBarAction(
                                              label: 'Закрыть',
                                              onPressed: ScaffoldMessenger.of(context).hideCurrentSnackBar),
                                              */
          ));
        }
        if (state is SupplierDealStatusInfoConfirmDealState) {
          /// ??? Как обновить историю сделки
          context.read<SupplierDealStatusInfoBloc>().add(SupplierDealStatusInfoInit());
          //isConfirmDeal = true;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            margin: EdgeInsets.symmetric(vertical: 140, horizontal: 20),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.green, width: 2),
              //borderRadius: BorderRadius.circular(0),
            ),
            backgroundColor: Colors.green.withOpacity(0.6),
            content: Row(
              children: [
                Icon(
                  Icons.check,
                  color: Color.fromARGB(255, 6, 123, 0),
                ),
                SizedBox(width: 20),
                Text(
                  'Сделка подтверждена',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ));
        }
        if (state is SupplierDealStatusInfoConfirmSupplyState) {
          context.read<SupplierDealStatusInfoBloc>().add(SupplierDealStatusInfoInit());
          //isConfirmSupply = true;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            margin: EdgeInsets.symmetric(vertical: 140, horizontal: 20),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.green, width: 2),
              //borderRadius: BorderRadius.circular(0),
            ),
            backgroundColor: Colors.green.withOpacity(0.6),
            content: Row(
              children: [
                Icon(
                  Icons.check,
                  color: Color.fromARGB(255, 6, 123, 0),
                ),
                SizedBox(width: 20),
                Text(
                  'Поставка подтверждена',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ));
        }
      }, builder: (context, state) {
        var orderInfoById = state.pageState.response;
        //bool isConfirmDeal = false;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black87,
            title: const Text('Процесс сделки'),
            centerTitle: true,
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<SupplierDealStatusInfoBloc>().add(SupplierDealStatusInfoInit());
              /* if (state.pageState.response.status == 'AGREED') isConfirmDeal = true;
              if (state.pageState.response.status == 'WAITING_PAYMENT') isConfirmSupply = true;
              if (state.pageState.response.status == 'DELIVERY') isConfirmPayment = true;
              if (state.pageState.response.status == 'COMPLETED') isConfirmReceiptProduct = true; */
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Center(
                          child: Text('СТАТУС: ${orderInfoById.status}',
                              style: const TextStyle(fontSize: 20, color: Colors.black)),
                        ),
                        const SizedBox(height: 5),
                        Center(
                          child: Text('Время создания сделки: ${orderInfoById.creationTime}',
                              style: const TextStyle(fontSize: 20, color: Colors.black)),
                        ),
                        const SizedBox(height: 20),
                        if (state.pageState.response.status == 'OPEN') ...[
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 2)),
                          ),
                          Container(),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(width: 2, color: Colors.black),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Для продолжения сделки\nвыберите действие',
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 15),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width,
                                        height: 50,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            /* context
                                                .read<RouteImpl>()
                                                .push(DealsSupplierRoutes.supplierDealBuyerContacts.name); */
                                            context
                                                .read<SupplierDealStatusInfoBloc>()
                                                .add(SupplierDealStatusInfoConfirmDealEvent());
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.orange,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                          ),
                                          child: const Text(
                                            'Заключить договор',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width,
                                        height: 50,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            /* context
                                                .read<RouteImpl>()
                                                .push(DealsSupplierRoutes.supplierDealBuyerContacts.name); */
                                            context
                                                .read<SupplierDealStatusInfoBloc>()
                                                .add(SupplierDealStatusInfoCancelDealEvent());
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.orange,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                          ),
                                          child: const Text(
                                            'Отменить сделку',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                        // пока хз че тут должно быть, надо подумать
                        if (state.pageState.response.status == 'AGREED') ...[
                          /*
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 2)),
                          ),
                          
                          Container(),
                          */
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(width: 2, color: Colors.black),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Для продолжения сделки\nвыберите действие',
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 15),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width,
                                        height: 50,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            /* context
                                                .read<RouteImpl>()
                                                .push(DealsSupplierRoutes.supplierDealBuyerContacts.name); */
                                            context
                                                .read<SupplierDealStatusInfoBloc>()
                                                .add(SupplierDealStatusInfoConfirmSupplyEvent());
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.orange,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                          ),
                                          child: const Text(
                                            'Подтвердить поставку',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width,
                                        height: 50,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            /* context
                                                .read<RouteImpl>()
                                                .push(DealsSupplierRoutes.supplierDealBuyerContacts.name); */
                                            context
                                                .read<SupplierDealStatusInfoBloc>()
                                                .add(SupplierDealStatusInfoCancelDealEvent());
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.orange,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                          ),
                                          child: const Text(
                                            'Отменить сделку',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<RouteImpl>().push(DealsSupplierRoutes.supplierDealBuyerContacts.name);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              ),
                              child: const Text(
                                'О заказчике',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        //const SizedBox(height: 0),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<RouteImpl>().push(DealsSupplierRoutes.supplierDealSupplierProposal.name);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              ),
                              child: const Text(
                                'Детали заказа',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text('История поставки', style: TextStyle(fontSize: 20)),
                        const SizedBox(height: 20),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.check,
                              color: Color.fromARGB(255, 6, 123, 0),
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'СТАТУС: Заказчик начал сделку',
                                  style: TextStyle(color: Colors.black),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  '${orderInfoById.creationTime}',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        state.pageState.isConfirmDeal
                            ? Row(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: Color.fromARGB(255, 6, 123, 0),
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'СТАТУС: Договор заключен',
                                        //'СТАТУС: Поставщик подтвердил начало сделки',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        '${orderInfoById.creationTime}',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : Row(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.donut_large,
                                    color: Colors.blue,
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'СТАТУС: Ожидание заключения\nдоговора от поставщика',
                                        //'СТАТУС: Ожидание подтверждения\nсделки от поставщика',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        '${orderInfoById.creationTime}',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                        const SizedBox(height: 20),

                        //const SizedBox(height: 20),
                        state.pageState.isConfirmSupply
                            ? Row(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: Color.fromARGB(255, 6, 123, 0),
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'СТАТУС: Товар отправлен',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        '${orderInfoById.creationTime}',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : Row(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.donut_large,
                                    color: Colors.blue,
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'СТАТУС: Ожидание подтверждения\nпоставки от поставщика',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        '${orderInfoById.creationTime}',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                        const SizedBox(height: 20),
                        state.pageState.isConfirmPayment
                            ? Row(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: Color.fromARGB(255, 6, 123, 0),
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'СТАТУС: Оплата произведена',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        '${orderInfoById.creationTime}',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : Row(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.donut_large,
                                    color: Colors.blue,
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'СТАТУС: Ожидание подтверждения\nоплаты от заказчика',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        '${orderInfoById.creationTime}',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                        const SizedBox(height: 20),
                        state.pageState.isConfirmReceiptProduct
                            ? Row(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: Color.fromARGB(255, 6, 123, 0),
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'СТАТУС: Товар получен',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        '${orderInfoById.creationTime}',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : Row(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.donut_large,
                                    color: Colors.blue,
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'СТАТУС: Ожидание получения\nтовара заказчиком',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        '${orderInfoById.creationTime}',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                        const SizedBox(height: 20),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<SupplierDealStatusInfoBloc>().add(SupplierDealStatusInfoInit());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          ),
                          child: const Text(
                            'Обновить историю',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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

/* Widget confirmDealWidget<>() {
  if () {
    return
  }
} */
