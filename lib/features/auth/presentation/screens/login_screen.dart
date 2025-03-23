import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_admin/core/di/injection.dart';
import '../../data/models/login_user.dart';
import '../bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final FocusNode _passwordFocusNode = FocusNode();
bool _obscurePassword = false;
final _emailText = TextEditingController();
final _passwordText = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _emailText.dispose();
    _passwordText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => getIt<AuthBloc>(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthStateSuccess) {
            context.go('/admin');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Login successful!\nAuth Token: ${state.authToken}\nRefresh Token: ${state.refreshToken}",
                ),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is AuthStateError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Login failed."),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    const Text(
                      "Sign In",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
                    ),
                    const Text(
                      "Please enter your email address \nand create password",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 40),
                    TextField(
                      onSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_passwordFocusNode);
                      },
                      controller: _emailText,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Please enter your email',
                        prefixIcon: const Icon(Icons.mail_outline_rounded),
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),
                    TextField(
                      controller: _passwordText,
                      obscureText: _obscurePassword,
                      focusNode: _passwordFocusNode,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Please enter your password',
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.black12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.green),
                        ),
                      ),
                    ),
                    const Spacer(),

                    Builder(
                      builder: (context) {
                        return SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: Colors.green,
                            ),
                            onPressed: () {
                              final model = LoginUserModel(
                                email: _emailText.text,
                                password: _passwordText.text,
                              );
                              context.read<AuthBloc>().add(LoginUser(model));
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
