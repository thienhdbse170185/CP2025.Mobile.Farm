import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/view/widgets/text_field_required.dart';
import 'package:smart_farm/src/viewmodel/index.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _rememberMe = false;
  bool _isProcessing = false;
  bool _isWrongCredentials = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void submit() {
    if (_isWrongCredentials) {
      setState(() {
        _isWrongCredentials = false;
      });
    }
    final username = _usernameController.text;
    final password = _passwordController.text;
    if (username.isEmpty || password.isEmpty) {
      log('[LOGIN] Tên tài khoản hoặc mật khẩu không được để trống');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Tên tài khoản hoặc mật khẩu không được để trống')),
      );
      return;
    }
    context.read<AuthBloc>().add(AuthEvent.login(
          username: username,
          password: password,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.maybeWhen(
              loading: () {
                log('[LOGIN] Đang xử lý đăng nhập...');
                setState(() {
                  _isProcessing = true;
                });
              },
              success: () {
                log('[LOGIN] Đăng nhập thành công!');
                // context.go(RouteName.otpVerification);
                // context
                //     .read<UserBloc>()
                //     .add(const UserEvent.sendOTP(isResend: false));
                context.go(RouteName.home);
              },
              failure: (message) {
                setState(() {
                  _isProcessing = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message)),
                );
                setState(() {
                  if (message.contains('wrong-credentials')) {
                    _isWrongCredentials = true;
                  }
                });
                log('[LOGIN] Đăng nhập thất bại: //');
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            state.maybeWhen(
              sendOTPInProgress: () {
                log('[OTP] OTP đang được gửi...');
              },
              sendOTPSuccess: (email) {
                setState(() {
                  _isProcessing = false;
                });
                log('[OTP] Đã gửi OTP thành công!');
                context.go(RouteName.otpVerification, extra: {
                  'email': email,
                  'otpType': 3,
                });
              },
              sendOTPFailure: (message) {
                setState(() {
                  _isProcessing = false;
                });
                log('[OTP] Gửi OTP thất bại, lỗi: $message');
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Đăng nhập nhân viên"),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Image.asset(
                    'assets/images/welcome.jpg',
                    height: 180,
                  )),
                  const SizedBox(height: 16),
                  const Text("Chào mừng trở lại!",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text("Vui lòng đăng nhập để tiếp tục"),
                  const SizedBox(height: 24),
                  TextFieldRequired(
                    label: 'Tên tài khoản',
                    hintText: 'Nhập tên tài khoản',
                    controller: _usernameController,
                    isDisabled: false,
                    onTap: () {
                      setState(() {
                        _isWrongCredentials = false;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFieldRequired(
                    onTap: () {
                      setState(() {
                        _isWrongCredentials = false;
                      });
                    },
                    label: 'Mật khẩu',
                    hintText: 'Nhập mật khẩu',
                    isDisabled: false,
                    controller: _passwordController,
                    isObscureText: !_isPasswordVisible,
                    isPassword: true,
                    suffixIcon: IconButton(
                      icon: Icon(_isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 2),
                  if (_isWrongCredentials)
                    const Text(
                      "Tên tài khoản hoặc mật khẩu không chính xác",
                      style: TextStyle(color: Colors.red, fontSize: 13),
                    ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: _rememberMe,
                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value!;
                              });
                            },
                          ),
                          const Text("Ghi nhớ đăng nhập"),
                        ],
                      ),
                      TextButton(
                        onPressed: () => context.push(RouteName.forgotPassword),
                        child: const Text("Quên mật khẩu?",
                            style: TextStyle(color: Colors.blue)),
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: _isProcessing ? null : submit,
                      child: _isProcessing
                          ? const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.5,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text("Đang đăng nhập..."),
                              ],
                            )
                          : const Text("Đăng nhập"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
