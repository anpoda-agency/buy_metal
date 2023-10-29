import 'package:buy_metal_app/domain/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({
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
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 60,
              decoration: const BoxDecoration(
                color: Colors.white,
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
                        color: Colors.black,
                      ),
                      label: 'Сделки З'),
                  // if (context.read<GetIt>().get<UserRepository>().user!.user.position == 'SUPPLIER')
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.list_alt,
                        color: Colors.black,
                      ),
                      label: 'Сделки П'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.map,
                        color: Colors.black,
                      ),
                      label: 'Заявки'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      label: 'Создать'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      label: 'Профиль'),
                ],
                currentIndex: navigationShell.currentIndex,
                onTap: (int index) => _onTap(context, index),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
