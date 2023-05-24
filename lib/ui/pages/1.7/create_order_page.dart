import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreateOrderPage extends StatefulWidget {
  const CreateOrderPage({super.key});

  @override
  State<CreateOrderPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  final List<String> typeList = [
    'Полоса',
    'Круг',
    'Квадрат',
    'Проволока',
    'Шестигранник',
    'Швеллер',
    'Двутавр',
    'Уголок',
    'Труба',
    'Лист',
    'Арматура'
  ];
  late String dropdownValue;
  //final TextEditingController testController = TextEditingController();
  // final TextEditingController _formRolledTextController =
  //     TextEditingController();
  final TextEditingController _typeTextController = TextEditingController();
  final TextEditingController _sizeRolledTextController =
      TextEditingController();
  final TextEditingController _paramsRolledTextController =
      TextEditingController();
  final TextEditingController _gostRolledTextController =
      TextEditingController();
  final TextEditingController _brandMaterialTextController =
      TextEditingController();
  final TextEditingController _paramsMaterialTextController =
      TextEditingController();
  final TextEditingController _gostMaterialTextController =
      TextEditingController();
  final TextEditingController _requirementTextController =
      TextEditingController();
  //final TextEditingController dataCreateTextController = TextEditingController();
  //final TextEditingController idTextController = TextEditingController();

  final CollectionReference _orders =
      FirebaseFirestore.instance.collection('orders');

  @override
  void initState() {
    dropdownValue = typeList.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Создание заявки'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Выберите форму проката *', //обязательное поле
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: DropdownButton(
                        value: dropdownValue,
                        items: typeList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? val) {
                          setState(() {
                            dropdownValue = val ?? '';
                          });
                        }),
                  ),
                ),
                const Text(
                  '* на каждую форму проката должна формироваться новая заявка',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
                const SizedBox(
                  height: 20,
                ),
                ParamsFieldWidget(
                  title: 'Классификация/тип профиля',
                  controller: _typeTextController,
                  inputType: TextInputType.text,
                ),
                ParamsFieldWidget(
                  title: 'Размер проката, мм *', //обязательное поле
                  controller: _sizeRolledTextController,
                  inputType: TextInputType.text,
                ),
                ParamsFieldWidget(
                  title: 'Параметры проката',
                  controller: _paramsRolledTextController,
                  inputType: TextInputType.text,
                ),
                ParamsFieldWidget(
                  title: 'ГОСТ на прокат',
                  controller: _gostRolledTextController,
                  inputType: TextInputType.text,
                ),
                ParamsFieldWidget(
                  title: 'Марка материала *', //обязательное
                  controller: _brandMaterialTextController,
                  inputType: TextInputType.text,
                ),
                ParamsFieldWidget(
                  title: 'Параметры материала',
                  controller: _paramsMaterialTextController,
                  inputType: TextInputType.text,
                ),
                ParamsFieldWidget(
                  title: 'ГОСТ на материал',
                  controller: _gostMaterialTextController,
                  inputType: TextInputType.text,
                ),
                ParamsFieldWidget(
                  title: 'Потребность, т',
                  controller: _requirementTextController,
                  inputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 65,
                    child: ElevatedButton(
                      onPressed: () async {
                        //Navigator.pushNamed(context, '/buyer_orders_list_page');
                        await _orders.add({
                          'form_rolled': dropdownValue,
                          "type": _typeTextController.text,
                          "size_rolled": _sizeRolledTextController.text,
                          'params_rolled': _paramsRolledTextController.text,
                          'gost_rolled': _gostRolledTextController.text,
                          'brand_material': _brandMaterialTextController.text,
                          'params_material': _paramsMaterialTextController.text,
                          'gost_material': _gostMaterialTextController.text,
                          'requirement': _requirementTextController.text,
                          //'supplier': supplier,
                          //'buyer': buyer,
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      child: const Text(
                        'Разместить заявку',
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
  }
}

class ParamsFieldWidget extends StatefulWidget {
  const ParamsFieldWidget(
      {super.key,
      required this.controller,
      required this.title,
      required this.inputType});
  final TextEditingController controller;
  final String title;
  final TextInputType inputType;

  @override
  State<ParamsFieldWidget> createState() => _ParamsFieldWidgetState();
}

class _ParamsFieldWidgetState extends State<ParamsFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: widget.controller,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(15))),
            keyboardType: widget.inputType,
          ),
        ],
      ),
    );
  }
}
