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
  bool _isProcessing = false;
  bool _isWrongCredentials = false;

  String _messageWrongCredentials = '';

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
                context.go(RouteName.home);
              },
              failure: (message) {
                setState(() {
                  _isProcessing = false;
                  if (message.contains('wrong-credentials')) {
                    _isWrongCredentials = true;
                    _messageWrongCredentials =
                        'Thông tin đăng nhập không chính xác!';
                  } else if (message.contains('permission-denied')) {
                    _isWrongCredentials = true;
                    _messageWrongCredentials =
                        'Tài khoản không có quyền truy cập ứng dụng.';
                  }
                });
                log('[LOGIN] Đăng nhập thất bại! Lỗi: $message');
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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 32),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(
                                8.0), // Add padding to center the image better
                            child: Image.asset(
                              'assets/images/LOGOOFFICIAL.png',
                              height: 120, // Adjusted height
                              width: 120, // Adjusted width
                              fit: BoxFit.contain, // Ensure the image fits well
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Text(
                          "Đăng nhập",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Vui lòng đăng nhập để tiếp tục",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 36),
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
                        const SizedBox(height: 20),
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
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (_isWrongCredentials)
                          Padding(
                            padding: EdgeInsets.only(left: 4),
                            child: Text(
                              _messageWrongCredentials,
                              style: TextStyle(color: Colors.red, fontSize: 13),
                            ),
                          ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: _isProcessing ? null : submit,
                            child: _isProcessing
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2.5,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "Đang đăng nhập...",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  )
                                : const Text(
                                    "Đăng nhập",
                                    style: TextStyle(fontSize: 16),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    'assets/images/thumbnail.png',
                    width: double.infinity,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
