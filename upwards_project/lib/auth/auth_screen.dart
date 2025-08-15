import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upwards_project/auth/bloc/auth_bloc.dart';
import 'package:upwards_project/auth/bloc/auth_event.dart';
import 'package:upwards_project/auth/bloc/auth_repository.dart';
import 'package:upwards_project/auth/bloc/auth_state.dart';
import '../../core/app_colors.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  Widget _textFieldWithShadow({
    required TextEditingController controller,
    required String hint,
    bool obscureText = false,
    bool isError = false,
    Widget? suffixIcon,
  }) {
    return Container(
      width: 400,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: isError
                ? Colors.red.withOpacity(0.3)
                : Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(
          color: isError ? Colors.red : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 16,
          ),
          border: InputBorder.none,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(AuthRepository()),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Вход выполнен!')),
                  );
                  // TODO: переход на другой экран
                }
                if (state is AuthFailure) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.error)));
                }
              },
              builder: (context, state) {
                bool isError = state is AuthFailure;
                bool isLoading = state is AuthLoading;

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Text(
                        'Авторизация',
                        style: TextStyle(
                          color: AppColors.mainTextColor,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _textFieldWithShadow(
                          controller: _emailController,
                          hint: 'Email*',
                          isError: isError,
                        ),
                        if (isError)
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 12.0,
                              top: 4.0,
                              bottom: 8.0,
                            ),
                            child: Text(
                              'Не найдена активная учетная запись',
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    _textFieldWithShadow(
                      controller: _passwordController,
                      hint: 'Пароль',
                      obscureText: _obscureText,
                      isError: isError,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.secondaryTextColor,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 24),

                    SizedBox(
                      width: 400,
                      height: 45,
                      child: isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.borderColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              onPressed: () {
                                context.read<AuthBloc>().add(
                                  AuthLoginRequested(
                                    _emailController.text,
                                    _passwordController.text,
                                  ),
                                );
                              },
                              child: const Text(
                                'Войти',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
