import 'package:buy_metal_app/data/storage/enum.dart';
import 'package:buy_metal_app/domain/router/route_constants.dart';
import 'package:buy_metal_app/domain/router/route_impl.dart';
import 'package:buy_metal_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessProposalPage extends StatelessWidget {
  const SuccessProposalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox.shrink(),
              const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: Text(
                      'Ответ на заявку\nуспешно отправлен',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 65,
                  child: ElevatedButton(
                    onPressed: () {
                      globalStream.add(GlobalEvents.createProposal);
                      context.read<RouteImpl>().go(FindCustomerRoutes.findCustomer.name);

                      /* context.read<RouteImpl>()
                        ..pop()
                        ..pop()
                        ..pop(); */

                      /*  Navigator.of(context)
                        ..pop()
                        ..pop()
                        ..pop(); */
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[700],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    child: const Text(
                      'Вернуться к заявкам',
                      textAlign: TextAlign.center,
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
