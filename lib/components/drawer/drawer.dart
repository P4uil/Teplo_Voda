import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teplo_voda/components/drawer/bloc/drawer_bloc.dart';
import 'package:teplo_voda/pages%20%20/authentification/auth_view.dart';
import 'package:teplo_voda/pages%20%20/authentification/bloc/auth_bloc.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Верхняя часть Drawer
          Column(
            children: [
              Container(
                color: Colors.blue, // Задаём фон для всего заголовка
                child: const DrawerHeader(
                  margin: EdgeInsets.zero, // Убираем отступы
                  padding: EdgeInsets.zero, // Убираем внутренние отступы
                  child: Center(
                    child: Text(
                      'Меню',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Главная'),
                onTap: () {
                  context
                      .read<DrawerBloc>()
                      .add(const NavigateToScreen('home'));
                  Navigator.pop(context); // Закрыть Drawer
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Настройки'),
                onTap: () {
                  context
                      .read<DrawerBloc>()
                      .add(const NavigateToScreen('settings'));
                  Navigator.pop(context);
                },
              ),
              const Divider(),
            ],
          ),
          // Нижняя часть Drawer
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Выход'),
              onTap: () {
                context.read<AuthBloc>().add(LogOutRequested());
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AuthView()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
