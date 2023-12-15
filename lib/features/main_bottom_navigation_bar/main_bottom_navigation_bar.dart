import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/* class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
} */

class MainBottomNavigationBar extends StatelessWidget {
  final UserRepository userRepository;
  const MainBottomNavigationBar({
    required this.userRepository,
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('MainBottomNavigationBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          navigationShell,
          //context.read<GetIt>().get<HomeRepository>().isShowNavBar
          //    ?
          Positioned(
            left: 0,
            right: 0,
            bottom: 40,
            child: Container(
              height: 90,
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  const Color(0xff4779BC),
                  const Color(0xff1B65C8).withOpacity(0.6),
                ]),
                color: Colors.lightBlueAccent[100],
                borderRadius: BorderRadius.circular(15),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                showUnselectedLabels: true,
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.list,
                        color: userRepository.user?.user.position == 'CUSTOMER' ? Colors.white : Colors.black,
                      ),
                      //label: 'Deals\nBuyerFlow'),
                      label: 'Сделки (З)'),
                  BottomNavigationBarItem(
                      // SupplierFlow
                      icon: Icon(
                        Icons.list_alt,
                        color: userRepository.user?.user.position == 'SUPPLIER' ? Colors.white : Colors.black,
                      ),
                      //label: 'Deals\nSupplierFlow'),
                      label: 'Сделки (П)'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.map,
                        color: userRepository.user?.user.position == 'CUSTOMER' ? Colors.white : Colors.black,
                      ),
                      //label: 'Orders'),
                      label: 'Заявки (З)'),
                  BottomNavigationBarItem(
                      // SupplierFlow
                      icon: Icon(
                        Icons.list_alt,
                        color: userRepository.user?.user.position == 'SUPPLIER' ? Colors.white : Colors.black,
                      ),
                      //label: 'Proposals'),
                      label: 'Ответы (П)'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person,
                        color: userRepository.user?.user.position == 'CUSTOMER' ? Colors.white : Colors.black,
                      ),
                      //label: 'CreateOrder'),
                      label: 'Создать (З)'),
                  BottomNavigationBarItem(
                      // SupplierFlow
                      icon: Icon(
                        Icons.list_alt,
                        color: userRepository.user?.user.position == 'SUPPLIER' ? Colors.white : Colors.black,
                      ),
                      //label: 'FindCustomer'),
                      label: 'Клиенты (П)'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person,
                        color: userRepository.user?.user.position == 'CUSTOMER' ? Colors.white : Colors.black,
                      ),
                      //label: 'Profile'),
                      label: 'Профиль (З)'),
                  BottomNavigationBarItem(
                      // SupplierFlow
                      icon: Icon(
                        Icons.list_alt,
                        color: userRepository.user?.user.position == 'SUPPLIER' ? Colors.white : Colors.black,
                      ),
                      //label: 'ProfileSupplier'),
                      label: 'Профиль (П)'),
                  /*
                        if (context.read<GetIt>().get<UserRepository>().isBusiness)
                          const BottomNavigationBarItem(
                              icon: Icon(
                                Icons.work,
                                color: Colors.black,
                              ),
                              label: 'Business'),
                        */
                ],
                currentIndex: navigationShell.currentIndex,
                onTap: (int index) => _onTap(context, index),
              ),
            ),
          )
          //: const SizedBox.shrink(),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.transparent,
      //   showUnselectedLabels: true,
      //   type: BottomNavigationBarType.fixed,
      //   elevation: 0,
      //   items: <BottomNavigationBarItem>[
      //     const BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.list,
      //           color: Colors.black,
      //         ),
      //         label: 'Meets'),
      //     const BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.map,
      //           color: Colors.black,
      //         ),
      //         label: 'Map'),
      //     const BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.person,
      //           color: Colors.black,
      //         ),
      //         label: 'Profile'),
      //     if (context.read<GetIt>().get<UserRepository>().isBusiness)
      //       const BottomNavigationBarItem(
      //           icon: Icon(
      //             Icons.work,
      //             color: Colors.black,
      //           ),
      //           label: 'Business'),
      //   ],
      //   currentIndex: navigationShell.currentIndex,
      //   onTap: (int index) => _onTap(context, index),
      // ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
