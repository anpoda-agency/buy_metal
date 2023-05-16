import 'package:flutter/material.dart';

class CreateComplianceProposalPage extends StatefulWidget {
  const CreateComplianceProposalPage({super.key});

  @override
  State<CreateComplianceProposalPage> createState() =>
      _CreateComplianceProposalPageState();
}

class _CreateComplianceProposalPageState
    extends State<CreateComplianceProposalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Center(
          child: Text('Описание предложения'),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                'ООО "МЕТАЛЛ" г. Москва',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(height: 10),
              const Text(
                'СООТВЕТСТВИЕ',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Сортамент:',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  const Text(
                    'Лист 2x1250x2500',
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Требования к параметрам проката:',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  const Text(
                    'БТ-ПО ГОСТ 19904-90',
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Требования к марке металла:',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  const Text(
                    '08пс-II-Г ГОСТ 16523-97',
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Text(
                        'Цена за кг:',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      Expanded(
                        child: NDSWidget(startBool: [true, false]),
                        /*
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              'с НДС',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            const Text(
                              'без НДС',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ],
                        ),
                        */
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      //height: 120,
                      //decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(15)),
                      child: TextFormField(
                          //decoration: InputDecoration(border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(horizontal: 30),),
                          //initialValue: 'Выберите прокат',
                          ),
                    ),
                  ),
                  Row(
                    children: const [
                      Text(
                        'Наличие:',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      Expanded(
                        child: AvailableWidget(startBool: [true, false]),
                        /*
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              'НЕТ',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            SizedBox(
                              width: 65,
                            ),
                            const Text(
                              'ДА',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                          ],
                        ),
                        */
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Дата поступления на склад поставщика:',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    '19.02.2024',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      //Navigator.pushNamed(context, '/supplier_contacts_page');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      //side: BorderSide(width:8, color: Colors.yellow),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    child: const Text(
                      'ОТПРАВИТЬ',
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
