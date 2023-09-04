import 'package:buy_metal_app/data/models/firebase_models/order_model.dart';
import 'package:buy_metal_app/data/models/firebase_models/user_model.dart';
import 'package:buy_metal_app/features/2.4/ui/create_compliance_proposal_page.dart';
import 'package:buy_metal_app/features/2.5/ui/create_similar_proposal_page.dart';
import 'package:flutter/material.dart';

class SelectionOfCreateProposalPage extends StatefulWidget {
  const SelectionOfCreateProposalPage({super.key, required this.args});
  final Object? args;

  @override
  State<SelectionOfCreateProposalPage> createState() => _SelectionOfCreateProposalPageState();
}

class _SelectionOfCreateProposalPageState extends State<SelectionOfCreateProposalPage> {
  late UserModel userModel;
  late OrderModel orderModel;
  @override
  void initState() {
    Map<String, dynamic> map = widget.args != null ? widget.args as Map<String, dynamic> : {};
    orderModel = map['order_model'];
    userModel = map['user_model'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Ответ на заявку'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Выберите вариант\nответа заказчику:',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, '/create_compliance_proposal_page');
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => CreateComplianceProposalPage(
                                      args: {'order_model': orderModel, 'user_model': userModel},
                                    )),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        ),
                        child: const Text(
                          'Сформировать предложение полностью соответствующее заявке',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, '/create_similar_proposal_page');
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => CreateSimilarProposalPage(
                                      args: {'order_model': orderModel, 'user_model': userModel},
                                    )),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        ),
                        child: const Text(
                          'Предложить близкий к запросу аналог',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
