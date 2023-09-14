import 'package:buy_metal_app/data/models/application_models/application_get_responses_by_application_id_response.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as ApplicationGetResponsesByApplicationIdResponse;
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
                    primary: Colors.orange,
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
  }
}
