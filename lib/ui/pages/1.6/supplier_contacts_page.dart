import 'package:flutter/material.dart';

class SupplierContactsPage extends StatefulWidget {
  const SupplierContactsPage({super.key});

  @override
  State<SupplierContactsPage> createState() => _SupplierContactsPageState();
}

class _SupplierContactsPageState extends State<SupplierContactsPage> {
  @override
  Widget build(BuildContext context) {
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
              children: const [
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Поставщик',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Наименование организации',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                SelectableText(
                  'ООО "Металл"', //форма проката + классификация/тип профиля + размер
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Адрес',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                SelectableText(
                  'САРАТОВСКАЯ ОБЛ.,Г ВОЛЬСК,УЛ ЦЕМЕНТНИКОВ, Д 286', //форма проката + классификация/тип профиля + размер
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'ИНН',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                SelectableText(
                  '7707083893 ', //форма проката + классификация/тип профиля + размер
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Контакты',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'ФИО',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                SelectableText(
                  'Иванов Иван Иванович', //форма проката + классификация/тип профиля + размер
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Должность',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                SelectableText(
                  'Менеджер', //форма проката + классификация/тип профиля + размер
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Номер телефона',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                SelectableText(
                  '+79277777777', //форма проката + классификация/тип профиля + размер
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Электронная почта',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                SelectableText(
                  'test@mail.ru ', //форма проката + классификация/тип профиля + размер
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 10),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       const SizedBox(height: 30),
      //       const Text(
      //         'РЕКВИЗИТЫ',
      //         style: TextStyle(fontSize: 40, color: Colors.black),
      //       ),
      //       const SizedBox(
      //         height: 10,
      //       ),
      //       Align(
      //         alignment: Alignment.bottomLeft,
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           children: const [
      //             Text(
      //               'Полное наименование организации:',
      //               style: TextStyle(fontSize: 20, color: Colors.black),
      //             ),
      //             SelectableText(
      //               'Общество с ограниченной ответственностью "МЕТАЛЛ"',
      //               style: TextStyle(fontSize: 15, color: Colors.black),
      //             ),
      //             SizedBox(height: 5),
      //             Text(
      //               'ЮРИДИЧЕСКИЙ АДРЕС:',
      //               style: TextStyle(fontSize: 20, color: Colors.black),
      //             ),
      //             SelectableText(
      //               '123456, г. Москва, ул. Подвойского, д. 14, стр. 7',
      //               style: TextStyle(fontSize: 15, color: Colors.black),
      //             ),
      //             SizedBox(height: 5),
      //             Text(
      //               'Почтовый адрес:',
      //               style: TextStyle(fontSize: 20, color: Colors.black),
      //             ),
      //             SelectableText(
      //               '123456, г. Москва, ул. Подвойского, д. 14, стр. 7',
      //               style: TextStyle(fontSize: 15, color: Colors.black),
      //             ),
      //             SizedBox(height: 10),
      //           ],
      //         ),
      //       ),
      //       const SelectableText(''),
      //       const SizedBox(height: 100),
      //       const Text(
      //         'КОНТАКТЫ',
      //         style: TextStyle(fontSize: 40, color: Colors.black),
      //       ),
      //       const SizedBox(
      //         height: 10,
      //       ),
      //       Align(
      //         alignment: Alignment.bottomLeft,
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           children: const [
      //             Text(
      //               'Электронная почта:',
      //               style: TextStyle(fontSize: 20, color: Colors.black),
      //             ),
      //             SelectableText(
      //               'info@metall.ru',
      //               style: TextStyle(fontSize: 15, color: Colors.black),
      //             ),
      //             SizedBox(height: 5),
      //             Text(
      //               'Телефон:',
      //               style: TextStyle(fontSize: 20, color: Colors.black),
      //             ),
      //             SelectableText(
      //               '+749512345678',
      //               style: TextStyle(fontSize: 15, color: Colors.black),
      //             ),
      //             SizedBox(height: 5),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
