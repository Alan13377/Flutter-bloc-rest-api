import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_bloc/pages/home_page.dart';
import 'package:rest_bloc/repos/repositories.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: RepositoryProvider(
            create: (context) => UserRepository(), child: const HomePage()));
  }
}
