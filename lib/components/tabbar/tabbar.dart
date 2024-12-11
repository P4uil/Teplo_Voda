import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teplo_voda/components/tabbar/bloc/tabbar_bloc.dart';

/// Bloc для управления состоянием TabBar
class TabBarBloc extends Bloc<TabBarEvent, TabBarState> {
  TabBarBloc() : super(TabBarInitial()) {
    on<SwitchTabEvent>((event, emit) {
      emit(TabBarState(selectedIndex: event.index));
    });
  }
}

/// Главный виджет TabBar
class TabBarViewWidget extends StatelessWidget {
  const TabBarViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabBarBloc(),
      child: DefaultTabController(
        length: 3, // Количество вкладок
        child: Scaffold(
          appBar: AppBar(
            title: const Text('TeploVoda'),
            bottom: TabBar(
              onTap: (index) {
                // Отправляем событие переключения вкладки
                context.read<TabBarBloc>().add(SwitchTabEvent(index));
              },
              tabs: const [
                Tab(icon: Icon(Icons.store), text: 'Магазин'),
                Tab(icon: Icon(Icons.favorite), text: 'Избранное'),
                Tab(icon: Icon(Icons.shopping_cart), text: 'Корзина'),
              ],
            ),
          ),
          body: BlocBuilder<TabBarBloc, TabBarState>(
            builder: (context, state) {
              return const TabBarView(
                physics: NeverScrollableScrollPhysics(), // Отключение свайпов
                children: [
                  ShopView(),
                  FavoritesView(),
                  CartView(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

/// Экран магазина
class ShopView extends StatelessWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Магазин'),
    );
  }
}

/// Экран избранного
class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Избранное'),
    );
  }
}

/// Экран корзины
class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Корзина'),
    );
  }
}
