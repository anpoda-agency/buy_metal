import 'package:flutter/material.dart';

class SelectionOfCreateProposalPage extends StatelessWidget {
  const SelectionOfCreateProposalPage({super.key});

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
                          Navigator.pushNamed(
                              context, '/create_compliance_proposal_page');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
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
                          Navigator.pushNamed(
                              context, '/create_similar_proposal_page');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
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
