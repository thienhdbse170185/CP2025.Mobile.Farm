import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_farm/src/core/common/widgets/loading_dialog.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/view/widgets/text_field_required.dart';
import 'package:smart_farm/src/viewmodel/index.dart';

class NewbieLoginWidget extends StatefulWidget {
  const NewbieLoginWidget({super.key});

  @override
  State<NewbieLoginWidget> createState() => _NewbieLoginWidgetState();
}

class _NewbieLoginWidgetState extends State<NewbieLoginWidget> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final bool _isPasswordVisible = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void submit() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    if (username.isEmpty || password.isEmpty) {
      log('[LOGIN] Tên tài khoản hoặc mật khẩu không được để trống');
      const SnackBar(
        content: Text(
          'Tên tài khoản hoặc mật khẩu không được để trống',
        ),
      );
      return;
    }
    context
        .read<AuthBloc>()
        .add(AuthEvent.login(username: username, password: password));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.maybeWhen(
              loading: () {
                log('[LOGIN] Đang xử lý login...');
                LoadingDialog.show(context, 'Đang xử lý...');
              },
              success: () {
                log('[LOGIN] Đăng nhập thành công!');
                log('[Send_OTP]: Chuẩn bị tiến hành gửi OTP...');
                context
                    .read<UserBloc>()
                    .add(const UserEvent.sendOTP(isResend: false));
              },
              failure: (message) {
                LoadingDialog.hide(context);
                SnackBar(content: Text(message));
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
                log('[Send_OTP]: Đang gửi OTP...');
              },
              sendOTPSuccess: (email) {
                LoadingDialog.hide(context);
                log('[Send_OTP]: Gửi OTP thành công');
                context.push(RouteName.otpVerification, extra: {
                  'email': email,
                  'otpType': 1,
                });
                SnackBar(
                  content: const Text('OTP xác thực thành công!'),
                );
              },
              sendOTPFailure: (message) {
                LoadingDialog.hide(context);
                log('[Send_OTP]: Gửi OTP thất bại: $message');
                SnackBar(content: Text(message));
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Chào mừng bạn'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 120),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/welcome.jpg',
                  height: 200,
                ),
                const Text("Đăng nhập",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 8),
                const Text(
                  'Vui lòng điền thông tin\n bạn đã nhận được qua email',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 24),
                TextFieldRequired(
                  label: 'Tên tài khoản',
                  hintText: 'Nhập tên tài khoản',
                  isDisabled: false,
                  controller: _usernameController,
                ),
                const SizedBox(height: 16),
                TextFieldRequired(
                  label: 'Mật khẩu',
                  hintText: 'Nhập mậu khẩu',
                  isDisabled: false,
                  isObscureText: !_isPasswordVisible,
                  controller: _passwordController,
                  isPassword: true,
                ),
              ],
            ),
          ),
        ),
        bottomSheet: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: FilledButton(
            onPressed: () {
              submit();
            },
            child: const Text('Đăng nhập'),
          ),
        ),
      ),
    );
  }
}
