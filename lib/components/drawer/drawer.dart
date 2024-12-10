import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teplo_voda/components/drawer/bloc/drawer_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrawerBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("TeploVoda"),
        ),
        drawer: BlocBuilder<DrawerBloc, DrawerState>(
          builder: (context, state) {
            return Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(color: Colors.blue),
                    child: Text(
                      'Меню',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Главная'),
                    onTap: () {
                      context.read<DrawerBloc>().add(NavigateToScreen('home'));
                      Navigator.pop(context); // Закрыть Drawer
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Настройки'),
                    onTap: () {
                      context
                          .read<DrawerBloc>()
                          .add(NavigateToScreen('settings'));
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        ),
        body: BlocListener<DrawerBloc, DrawerState>(
          listener: (context, state) {
            if (state is DrawerNavigationState) {
              _navigateToScreen(context, state.screen);
            }
          },
          child: const Center(
            child: Text('Добро пожаловать в TeploVoda!'),
          ),
        ),
      ),
    );
  }

  void _navigateToScreen(BuildContext context, String screen) {
    if (screen == 'home') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
    } else if (screen == 'settings') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettingsView()),
      );
    }
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Настройки')),
      body: const Center(
        child: Text('Страница настроек'),
      ),
    );
  }
}
