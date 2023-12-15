import 'package:buy_metal_app/data/models/application_response_models/application_response_get_supplier_responses_response.dart';
import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:buy_metal_app/features/3.2.2/bloc/supplier_proposal_description_bloc.dart';
import 'package:buy_metal_app/features/core_widgets/rolled_form_ru_name_converter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SupplierProposalDescriptionPage extends StatefulWidget {
  const SupplierProposalDescriptionPage({super.key, required this.args});
  final Object? args;

  @override
  State<SupplierProposalDescriptionPage> createState() => _SupplierProposalDescriptionPageState();
}

class _SupplierProposalDescriptionPageState extends State<SupplierProposalDescriptionPage> {
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
  late final ApplicationResponseGetSupplierResponsesResponse args;

  @override
  void initState() {
    args = widget.args as ApplicationResponseGetSupplierResponsesResponse;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var args = ModalRoute.of(context)!.settings.arguments as ApplicationGetResponsesByApplicationIdResponse;
    //final args = widget.args as ApplicationResponseGetSupplierResponsesResponse;
    return BlocProvider(
      create: (context) => SupplierProposalDescriptionBloc(
          proposalInfo: args,
          //dealRepository: context.read<GetIt>().get<DealRepository>(),
          //applicationRepository: context.read<GetIt>().get<ApplicationRepository>(),
          userRepository: context.read<GetIt>().get<UserRepository>(),
          pageState: const PageState()),
      child:
          BlocConsumer<SupplierProposalDescriptionBloc, SupplierProposalDescriptionState>(listener: (context, state) {
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
                        '${args.supplier.companyName} ${args.supplier.companyAddress}',
                        style: const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    Center(
                      child: Text(
                        'от ${args.creationDate}',
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
                          args.similar ? 'Аналог' : 'Соответствует', //аналог
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
                      '${rolledFormRuNameConverter(args.rolledForm)} ${args.rolledType} ${args.rolledSize}', //форма проката + классификация/тип профиля + размер
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    Text(
                      '${args.rolledParams} ${args.rolledGost}', //параметры проката + гост на прокат
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    Text(
                      '${args.materialBrand} ${args.materialParams} ${args.materialGost}', //марка материала + параметры материала + ГОСТ на материал
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
                          '${args.price} RUB',
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
                          '${args.amount} т',
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
                          '${args.fullPrice.floorToDouble()} RUB',
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
                          args.inStock ? 'Дa' : 'Нет',
                          style: const TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                    args.deliverDate.isNotEmpty
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
                                args.deliverDate,
                                style: const TextStyle(fontSize: 20, color: Colors.black),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
                /*
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                     
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
                        openDeal() {
                          /*
                          context
                              .read<DescriptionOfSupplierProposalBloc>()
                              .add(DescriptionOfSupplierProposalConfirmDealEvent());
                          */
                        }

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
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        openDeal();
                                        //Navigator.of(context).pop();
                                        //openDeal;

                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          margin: EdgeInsets.symmetric(vertical: 140, horizontal: 20),
                                          behavior: SnackBarBehavior.floating,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(color: Colors.green, width: 2),
                                            //borderRadius: BorderRadius.circular(0),
                                          ),
                                          backgroundColor: Colors.green.withOpacity(0.6),
                                          content: const Row(
                                            children: [
                                              Icon(
                                                Icons.check,
                                                color: Color.fromARGB(255, 6, 123, 0),
                                              ),
                                              SizedBox(width: 20),
                                              Text(
                                                'Заявка перемещена в\nраздел "Мои сделки"',
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
                                      },

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
                */
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
