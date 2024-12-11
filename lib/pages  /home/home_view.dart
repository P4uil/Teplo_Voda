import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teplo_voda/components/drawer/bloc/drawer_bloc.dart';
import 'package:teplo_voda/components/drawer/drawer.dart';
import 'package:teplo_voda/components/tabbar/bloc/tabbar_bloc.dart' as bloc;
import 'package:teplo_voda/pages%20%20/settings/settings_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DrawerBloc()),
        BlocProvider(create: (context) => bloc.TabBarBloc()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("TeploVoda"),
        ),
        drawer: const AppDrawer(), // Оставляем Drawer
        body: BlocListener<DrawerBloc, DrawerState>(
          listener: (context, state) {
            if (state is DrawerNavigationState) {
              _navigateToScreen(context, state.screen);
            }
          },
          child: BlocBuilder<bloc.TabBarBloc, bloc.TabBarState>(
            builder: (context, state) {
              return IndexedStack(
                index: state.selectedIndex,
                children: [
                  _buildTabContent(0), // Магазин
                  _buildTabContent(1), // Избранное
                  _buildTabContent(2), // Корзина
                ],
              );
            },
          ),
        ),
        bottomNavigationBar: BlocBuilder<bloc.TabBarBloc, bloc.TabBarState>(
          builder: (context, state) {
            return BottomNavigationBar(
              currentIndex: state.selectedIndex,
              onTap: (index) {
                context.read<bloc.TabBarBloc>().add(bloc.SwitchTabEvent(index));
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.store),
                  label: 'Магазин',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Избранное',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Корзина',
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _navigateToScreen(BuildContext context, String screen) {
    if (screen == 'settings') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettingsView()),
      );
    }
  }

  Widget _buildTabContent(int index) {
    switch (index) {
      case 0:
        return const Center(child: Text('Магазин')); // Содержимое Магазина
      case 1:
        return const Center(child: Text('Избранное')); // Содержимое Избранного
      case 2:
        return const Center(child: Text('Корзина')); // Содержимое Корзины
      default:
        return const Center(child: Text('Магазин'));
    }
  }
}
