import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teplo_voda/components/drawer/bloc/drawer_bloc.dart';
import 'package:teplo_voda/components/drawer/drawer.dart';
import 'package:teplo_voda/pages%20%20/settings/settings_view.dart';

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
        drawer: const AppDrawer(),
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
