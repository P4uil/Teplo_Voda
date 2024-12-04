import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Главная страница')),
      body: const Center(child: Text('Добро пожаловать в магазин!')),
    );
  }
}
