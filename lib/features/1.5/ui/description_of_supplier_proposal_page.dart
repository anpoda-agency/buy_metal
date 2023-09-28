import 'package:buy_metal_app/data/models/application_models/application_get_responses_by_application_id_response.dart';
import 'package:buy_metal_app/features/1.5/bloc/description_of_supplier_proposal_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DescriptionOfSupplierProposalPage extends StatefulWidget {
  const DescriptionOfSupplierProposalPage({super.key, required this.args});
  final Object? args;

  @override
  State<DescriptionOfSupplierProposalPage> createState() => _DescriptionOfSupplierProposalPageState();
}

class _DescriptionOfSupplierProposalPageState extends State<DescriptionOfSupplierProposalPage> {
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
  late final ApplicationGetResponsesByApplicationIdResponse args;

  @override
  void initState() {
    args = widget.args as ApplicationGetResponsesByApplicationIdResponse;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var args = ModalRoute.of(context)!.settings.arguments as ApplicationGetResponsesByApplicationIdResponse;
    return BlocProvider(
      create: (context) => DescriptionOfSupplierProposalBloc(pageState: const PageState()),
      child: BlocConsumer<DescriptionOfSupplierProposalBloc, DescriptionOfSupplierProposalState>(
          listener: (context, state) {
        if (state is DescriptionOfSupplierProposalConfirmDealState) {
          const CreateDealDialog(
            //dialogTittle: 'Ошибка запроса',
            dialogText:
                'После просмотра контактов\nВы начинаете сделку\nс поставщиком и не сможете взаимодействовать\nс предложениями других поставщиков по данной заявке.',
          ).showMyDialog(context);
        }
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
                      '${args.rolledForm} ${args.rolledType} ${args.rolledSize}', //форма проката + классификация/тип профиля + размер
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        //Navigator.of(context).pushNamed('/supplier_contacts_page', arguments: args);
                        context
                            .read<DescriptionOfSupplierProposalBloc>()
                            .add(DescriptionOfSupplierProposalConfirmDealEvent());
                        /*
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => SupplierContactsPage(
                                args: args,
                              )),
                    );
                    */
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
                  '${args.rolledForm} ${args.rolledType} ${args.rolledSize}', //форма проката + классификация/тип профиля + размер
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
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/supplier_contacts_page', arguments: args);
                    //context.read<DescriptionOfBuyerOrderBloc>().add(DescriptionOfSupplierProposalConfirmDealEvent());
                    /*
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => SupplierContactsPage(
                                args: args,
                              )),
                    );
                    */
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
    */
  }
}

class CreateDealDialog {
  const CreateDealDialog({
    //required this.dialogTittle,
    required this.dialogText,
  });

  //final String dialogTittle;
  final String dialogText;

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
                    //Navigator.of(context).pushNamed('/supplier_contacts_page', arguments: args);
                    //context.read<DescriptionOfSupplierProposalBloc>().add(DescriptionOfSupplierProposalConfirmDealEvent());
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
