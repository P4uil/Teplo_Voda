import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:teplo_voda/pages%20%20/authentification/auth_view.dart';
import 'package:teplo_voda/pages%20%20/authentification/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(FirebaseAuth.instance),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const AuthView(),
      ),
    );
  }
}
