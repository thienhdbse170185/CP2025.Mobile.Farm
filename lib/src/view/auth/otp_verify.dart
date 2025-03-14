import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/viewmodel/index.dart';

class OtpVerifyScreen extends StatefulWidget {
  final String email;
  final String username;
  // 0 - forgot password, 1 - change password newbie, 2 - change password
  final int otpType;
  final String? oldPassword;
  final String? newPassword;
  const OtpVerifyScreen({
    super.key,
    required this.email,
    required this.username,
    required this.otpType,
    this.oldPassword,
    this.newPassword,
  });

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final _formKey = GlobalKey<FormState>();
  Timer? _timer;
  int _remainingTime = 600; // 10 minutes in seconds
  final String _otp = '';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  void _resetTimer() {
    setState(() {
      _remainingTime = 600;
    });
    _startTimer();
    // Add your OTP resend logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('OTP đã được gửi lại')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        state.maybeWhen(
          sendOTPInProgress: () {
            log('[OTP] OTP đang được gửi lại...');
          },
          sendOTPSuccess: (email) {
            log('[OTP] Đã gửi lại OTP thành công!');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Mã OTP đã được gửi đến email của bạn!')),
            );
            _resetTimer();
          },
          sendOTPFailure: (message) {
            log('[OTP] Gửi lại OTP thất bại: $message');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Gửi mã OTP thất bại: $message')),
            );
          },
          verifyOTPInProgress: () {
            log('[OTP] Đang xác thực OTP...');
            setState(() {
              _isLoading = true;
            });
          },
          verifyOTPSuccess: () {
            log('[OTP] Xác thực OTP thành công!');
            setState(() {
              _isLoading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Xác thực OTP thành công!'),
                backgroundColor: Colors.green,
              ),
            );
            if (widget.otpType == 1) {
              context.go(RouteName.changePasswordNewbie);
            } else if (widget.otpType == 2) {
              context.read<UserBloc>().add(UserEvent.updatePassword(
                    oldPassword: widget.oldPassword!,
                    newPassword: widget.newPassword!,
                  ));
            } else if (widget.otpType == 3) {
              context.go(RouteName.home);
            } else if (widget.otpType == 0) {
              context.go(RouteName.changePassword);
            }
          },
          verifyOTPFailure: (message) {
            log('[OTP] Xác thực OTP thất bại: $message');
            setState(() {
              _isLoading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Xác thực OTP thất bại: $message')),
            );
          },
          updatePasswordInProgress: () {
            log('[OTP] Đang cập nhật mật khẩu...');
            setState(() {
              _isLoading = true;
            });
          },
          updatePasswordSuccess: () {
            log('[OTP] Cập nhật mật khẩu thành công!');
            setState(() {
              _isLoading = false;
            });
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Cập nhật mật khẩu thành công!'),
                backgroundColor: Colors.green,
              ),
            );
            context.go(RouteName.home);
          },
          updatePasswordFailure: (message) {
            log('[OTP] Cập nhật mật khẩu thất bại: $message');
            setState(() {
              _isLoading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Cập nhật mật khẩu thất bại: $message')),
            );
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Xác thực OTP'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Nhập mã OTP \nđược gửi qua Email',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(height: 1.5),
                ),
                const SizedBox(height: 24),
                const Text('* Nhập mã OTP để xác thực tài khoản của bạn'),
                const SizedBox(height: 16),
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: Theme.of(context).primaryColor,
                  focusedBorderColor: Theme.of(context).primaryColor,
                  showFieldAsBox: true,
                  onCodeChanged: (code) {
                    // Handle OTP code changes
                  },
                  onSubmit: (code) {
                    // Handle OTP submission
                    context.read<UserBloc>().add(
                        UserEvent.verifyOTP(email: widget.email, otp: code));
                  },
                ),
                const SizedBox(height: 32),
                Text.rich(
                  TextSpan(
                    text: 'Chúng tôi đã gửi mã xác thực đến email của bạn ',
                    children: [
                      TextSpan(
                        text: _obfuscateEmail(widget.email),
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: '. Hãy kiểm tra hòm thư đến của bạn.',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                FilledButton(
                    onPressed: _isLoading
                        ? null
                        : () {
                            context.read<UserBloc>().add(UserEvent.verifyOTP(
                                email: widget.email, otp: _otp));
                          },
                    child: _isLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                            ),
                          )
                        : const Text('Xác thực')),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Không nhận được mã?'),
                    TextButton(
                      onPressed: _remainingTime == 0
                          ? () {
                              context.read<UserBloc>().add(UserEvent.sendOTP(
                                  username: widget.username, isResend: true));
                            }
                          : null,
                      child: Text(
                        _remainingTime == 0
                            ? 'Gửi lại'
                            : 'Gửi lại trong ${(_remainingTime ~/ 60).toString().padLeft(2, '0')}:${(_remainingTime % 60).toString().padLeft(2, '0')}',
                        style: TextStyle(
                          color: _remainingTime == 0
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

_obfuscateEmail(String email) {
  final parts = email.split('@');
  final obfuscated = parts[0].replaceRange(2, parts[0].length - 2, '***');
  return '$obfuscated@${parts[1]}';
}
