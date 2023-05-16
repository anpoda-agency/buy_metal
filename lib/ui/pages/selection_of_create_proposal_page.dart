import 'package:flutter/material.dart';

class SelectionOfCreateProposalPage extends StatelessWidget {
  const SelectionOfCreateProposalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black87,title: const Center(child: Text('AnMetal'),),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //const Text('AnMetal', style: TextStyle(fontSize: 50, color: Colors.white),),
            //SizedBox(height: 150,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width, 
                height: 120, 
                //decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(15)),
                child: ElevatedButton(onPressed: () {Navigator.pushNamed(context, '/create_compliance_proposal_page'); },
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                            //side: BorderSide(width:8, color: Colors.yellow),
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
                  ),
                child: const Text('Сформировать предложение если Ваш прокат 100% соответствует запросу',textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),),),
            ),
            //SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width, 
                height: 120,
                child: ElevatedButton(onPressed: () {Navigator.pushNamed(context, '/create_similar_proposal_page'); }, 
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                            //side: BorderSide(width:8, color: Colors.yellow),
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
                  ),
                child: const Text('Предложить близкий к запросу аналог',textAlign: TextAlign.center, style: TextStyle(fontSize: 22),),),),
                
            ),
            SizedBox(height: 150,),
          ],
        ),
      ), //SizedBox(width: 10, height: 10,),
    );
  }
}