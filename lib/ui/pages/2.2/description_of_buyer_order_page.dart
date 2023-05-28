import 'package:buy_metal_app/main.dart';
import 'package:buy_metal_app/models/order_model.dart';
import 'package:buy_metal_app/models/user_model.dart';
import 'package:buy_metal_app/repo/profile_repository.dart';
import 'package:buy_metal_app/ui/pages/2.3/selection_of_create_proposal_page.dart';
import 'package:flutter/material.dart';

class DescriptionOfBuyerOrderPage extends StatefulWidget {
  const DescriptionOfBuyerOrderPage({super.key, required this.args});
  final Object? args;

  @override
  State<DescriptionOfBuyerOrderPage> createState() => _DescriptionOfBuyerOrderPageState();
}

class _DescriptionOfBuyerOrderPageState extends State<DescriptionOfBuyerOrderPage> {
  late OrderModel orderModel;
  UserModel userInfo = const UserModel();

  @override
  void initState() {
    orderModel = widget.args != null ? widget.args as OrderModel : const OrderModel();
    getIt
        .get<ProfileRepository>()
        .getUserInfo(buyerId: orderModel.buyerId)
        .then((value) => setState(() {
              userInfo = value;
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
  }
}
