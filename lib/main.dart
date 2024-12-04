import 'package:flutter/material.dart';
import 'package:teplo_voda/App.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Инициализация фреймворка Flutter
  await Firebase.initializeApp(); // Инициализация Firebase
  runApp(const App());
}
