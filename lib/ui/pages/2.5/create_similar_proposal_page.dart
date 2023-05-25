import 'package:buy_metal_app/ui/pages/1.7/create_order_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreateSimilarProposalPage extends StatefulWidget {
  const CreateSimilarProposalPage({super.key});

  @override
  State<CreateSimilarProposalPage> createState() =>
      _CreateSimilarProposalPageState();
}

class _CreateSimilarProposalPageState extends State<CreateSimilarProposalPage> {
  //final TextEditingController testController = TextEditingController();
  int selectedValue = 0;
  final TextEditingController _priceController = TextEditingController();
  double price = 0;

  final String _formRolled = 'Лист';
  final String _requirement = '5.4 т';
  bool _inStock = false;
  bool _notStock = false;

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
  final TextEditingController _dateTextController = TextEditingController();

  final CollectionReference _similarProposal =
      FirebaseFirestore.instance.collection('similar_proposals');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Описание предложения'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/test_list_proposals_page');
                //'/selected_buyer_list_of_orders_page');
              },
              icon: const Icon(Icons.start)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'ООО "ЗАКАЗЧИК" г. Москва',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              const Center(
                child: Text(
                  'от 20.05.2023',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    'Форма проката:',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    _formRolled,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                '* поля обязательные для заполнения',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
              const SizedBox(height: 10),
              ParamsFieldWidget(
                title: 'Классификация/тип профиля *',
                controller: _typeTextController,
                inputType: TextInputType.text,
              ),
              ParamsFieldWidget(
                title: 'Размер проката, мм *', //обязательное поле
                controller: _sizeRolledTextController,
                inputType: TextInputType.text,
              ),
              ParamsFieldWidget(
                title: 'Параметры проката *',
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
                    _requirement,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Цена за тонну (с НДС)',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextField(
                      controller: _priceController,
                      onChanged: (val) {
                        if (val.isEmpty) {
                          setState(() {
                            price = 0;
                          });
                        } else {
                          setState(() {
                            price = 5.4 * int.parse(val);
                          });
                        }
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[300],
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(15))),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('RUB',
                      style: TextStyle(fontSize: 20, color: Colors.black))
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
                    price.toInt().toString(),
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text('RUB',
                      style: TextStyle(fontSize: 20, color: Colors.black))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    'В наличии:',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedValue = 1;
                          _dateTextController.clear();
                        });
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: selectedValue == 1
                                  ? Colors.orange
                                  : Colors.grey),
                          child: Text(
                            'Да',
                            style: TextStyle(
                                fontSize: 20,
                                color: selectedValue == 1
                                    ? Colors.white
                                    : Colors.black),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedValue = 2;
                        });
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: selectedValue == 2
                                  ? Colors.orange
                                  : Colors.grey),
                          child: Text(
                            'Нет',
                            style: TextStyle(
                                fontSize: 20,
                                color: selectedValue == 2
                                    ? Colors.white
                                    : Colors.black),
                          )),
                    ),
                  ),
                ],
              ),
              selectedValue == 2
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Дата поступления\nна склад поставщика:',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: _dateTextController,
                          // onChanged: (val) {
                          //   if (val.isEmpty) {
                          //     setState(() {
                          //       price = 0;
                          //     });
                          //   } else {
                          //     setState(() {
                          //       price = 5.4 * int.parse(val);
                          //     });
                          //   }
                          // },
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[300],
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      const BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(15))),
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.only(bottom: 30, top: 30),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 65,
                  child: ElevatedButton(
                    onPressed: () async {
                      //Navigator.pushNamed(context, '/buyer_orders_list_page');

                      if (selectedValue == 1) {
                        _inStock = true;
                        _notStock = false;
                      } else if (selectedValue == 2) {
                        _inStock = false;
                        _notStock = true;
                      }

                      await _similarProposal.add({
                        'form_rolled': _formRolled,
                        "type": _typeTextController.text,
                        "size_rolled": _sizeRolledTextController.text,
                        'params_rolled': _paramsRolledTextController.text,
                        'gost_rolled': _gostRolledTextController.text,
                        'brand_material': _brandMaterialTextController.text,
                        'params_material': _paramsMaterialTextController.text,
                        'gost_material': _gostMaterialTextController.text,
                        'requirement': _requirement,

                        'price': price,
                        //.toInt(),

                        'in_stock': _inStock,
                        'not_stock': _notStock,

                        'date': _dateTextController.text,
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
    );
  }
}

class NDSWidget extends StatefulWidget {
  const NDSWidget({
    super.key,
    required this.startBool,
  });
  final List<bool> startBool;
  @override
  State<NDSWidget> createState() => _NDSWidgetState();
}

class _NDSWidgetState extends State<NDSWidget> {
  List<bool> listBool = [];
  List<String> listNames = ['с НДС', 'без НДС'];

  @override
  void initState() {
    listBool.addAll(widget.startBool);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: listBool
          .map((e) => Padding(
                padding: const EdgeInsets.only(left: 10),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (listBool.indexOf(e) == 0) {
                        listBool = [true, false];
                      } else {
                        listBool = [false, true];
                      }
                    });
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: e ? Colors.orange : Colors.grey),
                      child: Text(
                        listNames[listBool.indexOf(e)],
                        style: TextStyle(
                            fontSize: 20,
                            color: e ? Colors.white : Colors.black),
                      )),
                ),
              ))
          .toList(),
    );
  }
}

class AvailableWidget extends StatefulWidget {
  const AvailableWidget({super.key, required this.startBool});
  final List<bool> startBool;

  @override
  State<AvailableWidget> createState() => _AvailableWidgetState();
}

class _AvailableWidgetState extends State<AvailableWidget> {
  List<bool> listBool = [];
  List<String> listNames = ['НЕТ', 'ДА'];

  @override
  void initState() {
    listBool.addAll(widget.startBool);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: listBool
          .map((e) => Padding(
                padding: const EdgeInsets.only(left: 10),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (listBool.indexOf(e) == 0) {
                        listBool = [true, false];
                      } else {
                        listBool = [false, true];
                      }
                    });
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: e ? Colors.orange : Colors.grey),
                      child: Text(
                        listNames[listBool.indexOf(e)],
                        style: TextStyle(
                            fontSize: 20,
                            color: e ? Colors.white : Colors.black),
                      )),
                ),
              ))
          .toList(),
    );
  }
}