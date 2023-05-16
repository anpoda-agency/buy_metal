import 'package:flutter/material.dart';

class SupplierProposalsListPage extends StatefulWidget {
  const SupplierProposalsListPage({super.key});

  @override
  State<SupplierProposalsListPage> createState() => _SupplierProposalsListPageState();
}

const List<String> products = <String>['Лист 2x1250x2500', 'Швеллер 16У', 'Швеллер 16П', 'Шестигранник 16',];

class _SupplierProposalsListPageState extends State<SupplierProposalsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(backgroundColor: Colors.black87,title: Center(child: const Text('Предложения поставщика'),),),
      body: Container(
        child: ListView.builder(itemCount: products.length,
        itemBuilder: (BuildContext context, index) {
          return Padding(
            //padding: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Container(
              width: MediaQuery.of(context).size.width, 
              height: 60,
              //color: Colors.orange,
              decoration: BoxDecoration(color: Colors.orange ,border: Border.all(width: 3), borderRadius: BorderRadius.circular(5)),

            child: InkWell(onTap: () {Navigator.pushNamed(context, '/description_of_supplier_proposal_page');}, 
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Align(alignment: Alignment.centerLeft,child: Text(products[index], style: TextStyle(fontSize: 25, color: Colors.white),)),
            ),),
            ),
          ); } ),
      ),     
    );
  }
}