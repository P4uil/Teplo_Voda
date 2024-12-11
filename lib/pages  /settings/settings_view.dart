import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teplo_voda/pages%20%20/authentification/auth_view.dart';
import 'package:teplo_voda/pages%20%20/authentification/bloc/auth_bloc.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            ElevatedButton(
              onPressed: () => _showDeleteAccountDialog(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'Удалить аккаунт',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Удаление аккаунта'),
          content: const Text(
              'Вы уверены, что хотите удалить свой аккаунт? Это действие нельзя будет отменить.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Закрыть диалог
              },
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () {
                // Вызов события удаления аккаунта
                context.read<AuthBloc>().add(DeleteAccountRequested());
                Navigator.pop(context); // Закрыть диалог
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AuthView()),
                );
              },
              child: const Text(
                'Удалить',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
