import 'package:buy_metal_app/domain/router/buyer_router/route_constants.dart';
import 'package:buy_metal_app/domain/router/buyer_router/route_impl.dart';
import 'package:buy_metal_app/domain/router/supplier_router/supplier_route_constants.dart';
import 'package:buy_metal_app/domain/router/supplier_router/supplier_route_impl.dart';
import 'package:buy_metal_app/features/core_widgets/label_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox.shrink(),
            const LabelWidget(title: 'BuyMetal'),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 75,
                    child: ElevatedButton(
                      onPressed: () {
                        //Navigator.pushNamed(context, '/auth_page');
                        context
                            .read<RouteImpl>()
                            .push('auth/${RootRoutes.authPage.name}');
                        /* context
                            .read<SupplierRouteImpl>()
                            .push('auth/${SupplierRootRoutes.authPage.name}'); */
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      child: const Text(
                        'Войти',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 75,
                    child: ElevatedButton(
                      onPressed: () {
                        //Navigator.pushNamed(context, '/reg_page');
                        context
                            .read<RouteImpl>()
                            .push('auth/${RootRoutes.regPage.name}');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      child: const Text(
                        'Регистрация',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
