import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'pages  /authentification/bloc/auth_bloc.dart';
import 'pages  /authentification/auth_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(FirebaseAuth.instance),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TeploVoda',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const AuthView(),
      ),
    );
  }
}
