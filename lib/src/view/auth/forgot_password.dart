import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/viewmodel/index.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Handle forgot password logic here
      context.read<UserBloc>().add(UserEvent.sendOTP(
          username: _usernameController.text,
          isResend: false,
          email: _emailController.text));
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        state.maybeWhen(
          sendOTPInProgress: () {},
          sendOTPSuccess: (email) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Mã OTP đã được gửi đến email của bạn!')),
            );
            context.push(RouteName.otpVerification, extra: {
              'email': _emailController.text,
              'username': _usernameController.text,
              'otpType':
                  0, // 0 - forgot password, 1 - change password newbie, 2 - change password
            });
          },
          sendOTPFailure: (message) => ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Gửi mã OTP thất bại!'))),
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Quên mật khẩu'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nhập Email của bạn để nhận mã OTP',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 32.0),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    helperText:
                        'Nhập email để gửi mã xác thực đến hòm thư của bạn.',
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập email của bạn';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Email không hợp lệ';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập username của bạn';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 32.0),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _submit,
                    child: Text('Gửi'),
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
