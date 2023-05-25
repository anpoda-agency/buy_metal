import 'package:flutter/material.dart';

class CreateComplianceProposalPage extends StatefulWidget {
  const CreateComplianceProposalPage({super.key});

  @override
  State<CreateComplianceProposalPage> createState() =>
      _CreateComplianceProposalPageState();
}

class _CreateComplianceProposalPageState
    extends State<CreateComplianceProposalPage> {
  final TextEditingController priceController = TextEditingController();
  double price = 0;
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Text('Описание предложения'),
          centerTitle: true,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                // Navigator.pushNamed(
                //     context, '/selection_of_create_proposal_page');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              child: const Text(
                'Сформировать предложение',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  const Text(
                    'Номенклатура:',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Лист ОЦ 2х1250х2500', //форма проката + классификация/тип профиля + размер
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  const Text(
                    'Б-ПН-НО ГОСТ 14904-90', //параметры проката + гост на прокат
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  const Text(
                    '08КП МТ-2 ГОСТ14918-80', //марка материала + параметры материала + ГОСТ на материал
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Text(
                        'Потребность в заявке:',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '5.4 т',
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
                          controller: priceController,
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
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
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
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: priceController,
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
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
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
                ]),
              ],
            ),
          ),
        ));
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
  List<String> listNames = ['Да', 'Нет'];

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