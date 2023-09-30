import 'package:buy_metal_app/data/models/application_models/application_get_responses_by_application_id_response.dart';
import 'package:flutter/material.dart';

class SupplierContactsPage extends StatefulWidget {
  const SupplierContactsPage({super.key, required this.args});
  final Object? args;

  @override
  State<SupplierContactsPage> createState() => _SupplierContactsPageState();
}

class _SupplierContactsPageState extends State<SupplierContactsPage> {
  /* 
  UserModel userModel = const UserModel();
  @override
  void initState() {
    userModel =
        widget.args != null ? widget.args as UserModel : const UserModel();
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Информация о поставщике'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    'Поставщик',
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
                  args.supplier.companyName,
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
                  args.supplier.companyAddress,
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
                  args.supplier.tin.toString(),
                  //userModel.inn.toString(),
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  args.supplier.fullName.toString(),
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
                  args.supplier.phone,
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
                  args.supplier.email,
                  //userModel.email,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
