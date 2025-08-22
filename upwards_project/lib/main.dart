import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upwards_project/auth/auth_screen.dart';
import 'package:upwards_project/auth/bloc/auth_bloc.dart';
import 'package:upwards_project/auth/bloc/auth_repository.dart';
import 'package:upwards_project/auth/bloc/auth_storage.dart';
import 'package:upwards_project/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final token = await AuthStorage.getAccessToken();

  runApp(MyApp(startWithMain: token != null));
}

class MyApp extends StatelessWidget {
  final bool startWithMain;

  const MyApp({super.key, required this.startWithMain});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(context.read<AuthRepository>()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Локальная авторизация',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: startWithMain
              ? const MainScreen(
                  accessToken: '',
                  refreshToken: '',
                  group: '',
                  fullName: '',
                )
              : const AuthScreen(),
        ),
      ),
    );
  }
}
