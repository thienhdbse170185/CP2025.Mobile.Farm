import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_farm/src/core/common/widgets/loading_dialog.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/view/widgets/text_field_required.dart';
import 'package:smart_farm/src/viewmodel/auth/auth_bloc.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
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
          content: Text('Tên tài khoản hoặc mật khẩu không được để trống'));
      return;
    }
    context
        .read<AuthBloc>()
        .add(AuthEvent.login(username: username, password: password));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () {
            log('[LOGIN] Đang xử lý login...');
            LoadingDialog.show(context, 'Đang xử lý...');
          },
          success: () {
            LoadingDialog.hide(context);
            log('[LOGIN] Đăng nhập thành công!');
            context.go(RouteName.home);
          },
          failure: (message) {
            LoadingDialog.hide(context);
            SnackBar(content: Text(message));
            log('[LOGIN] Đăng nhập thất bại: $message');
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 120),
            child: Column(
              children: [
                Image.asset('assets/images/welcome.jpg'),
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
                  controller: _usernameController,
                ),
                const SizedBox(height: 16),
                TextFieldRequired(
                  label: 'Mật khẩu',
                  hintText: 'Nhập mậu khẩu',
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
