import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/viewmodel/index.dart';

class ChangePasswordScreen extends StatefulWidget {
  final String username;
  final String? phoneNumber;
  const ChangePasswordScreen({
    super.key,
    required this.username,
    required this.phoneNumber,
  });

  @override
  State<ChangePasswordScreen> createState() =>
      _ChangePasswordNewbieScreenState();
}

class _ChangePasswordNewbieScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _oldController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isObscureOld = true;
  bool _isObscureNew = true;
  bool _isObscureConfirm = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(const UserEvent.getUserProfile());
  }

  @override
  void dispose() {
    _oldController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      context.read<UserBloc>().add(UserEvent.getUserProfileByUserId());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        state.maybeWhen(
          getUserProfileByUserIdInProgress: () {
            setState(() {
              _isLoading = true;
            });
          },
          getUserProfileByUserIdSuccess: () {
            context.read<UserBloc>().add(UserEvent.sendOTPSms(
                  username: widget.username,
                  isResend: false,
                ));
          },
          getUserProfileByUserIdFailure: (message) {
            setState(() {
              _isLoading = false;
            });
          },
          sendOTPInProgress: () {
            setState(() {
              _isLoading = true;
            });
          },
          sendOTPSuccess: (email) {
            setState(() {
              _isLoading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Mã OTP đã được gửi đến $email')),
            );
            context.push(RouteName.otpVerification, extra: {
              'email': email,
              'username': widget.username,
              'otpType': 2,
              'oldPassword': _oldController.text,
              'newPassword': _newPasswordController.text,
            });
          },
          sendOTPFailure: (message) {
            setState(() {
              _isLoading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Gửi mã OTP thất bại - $message')),
            );
          },
          sendOTPSmsInProgress: () {
            setState(() {
              _isLoading = true;
            });
          },
          sendOTPSmsSuccess: (phoneNumber) {
            setState(() {
              _isLoading = false;
            });
            context.push(RouteName.otpVerification, extra: {
              'phoneNumber': phoneNumber,
              'username': widget.username,
              'otpType': 2,
              'oldPassword': _oldController.text,
              'newPassword': _newPasswordController.text,
            });
          },
          sendOTPSmsFailure: (message) {
            setState(() {
              _isLoading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Gửi mã OTP thất bại - $message')),
            );
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Đổi mật khẩu'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: _oldController,
                  obscureText: _isObscureOld,
                  decoration: InputDecoration(
                    labelText: 'Mật khẩu cũ',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscureOld ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscureOld = !_isObscureOld;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Hãy nhập mật khẩu cũ';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _newPasswordController,
                  obscureText: _isObscureNew,
                  decoration: InputDecoration(
                    labelText: 'Mật khẩu mới',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscureNew ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscureNew = !_isObscureNew;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Hãy nhập mật khẩu mới';
                    } else if (value.length < 8) {
                      return 'Mật khẩu phải có ít nhất 8 ký tự';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: _isObscureConfirm,
                  decoration: InputDecoration(
                    labelText: 'Xác nhận mật khẩu mới',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscureConfirm
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscureConfirm = !_isObscureConfirm;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Hãy xác nhận mật khẩu mới';
                    } else if (value != _newPasswordController.text) {
                      return 'Mật khẩu không khớp';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 32.0),
                FilledButton(
                  onPressed: _isLoading ? null : _onSubmit,
                  child: _isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 3),
                        )
                      : const Text('Xác nhận'),
                ),
                SizedBox(height: 4.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Quên mật khẩu cũ?'),
                    TextButton(
                      child: const Text('Lấy lại mật khẩu'),
                      onPressed: () {
                        context.push(RouteName.forgotPassword);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                    '* Trường hợp quên mật khẩu cũ, có thể lấy lại bằng cách xác thực OTP qua Email của bạn.')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
