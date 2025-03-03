import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_farm/src/core/common/widgets/loading_dialog.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/viewmodel/index.dart';

class ChangePasswordNewbieScreen extends StatefulWidget {
  const ChangePasswordNewbieScreen({super.key});

  @override
  State<ChangePasswordNewbieScreen> createState() =>
      _ChangePasswordNewbieScreenState();
}

class _ChangePasswordNewbieScreenState
    extends State<ChangePasswordNewbieScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isObscureOld = true;
  bool _isObscureNew = true;
  bool _isObscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        state.maybeWhen(
          updatePasswordInProgress: () {
            LoadingDialog.show(context, 'Đang xử lý...');
            log('[CHANGE_PASSWORD] Đang xử lý đổi mật khẩu...');
          },
          updatePasswordSuccess: () {
            LoadingDialog.hide(context);
            log('[CHANGE_PASSWORD] Đổi mật khẩu thành công!');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Đổi mật khẩu thành công')),
            );
            context.go(RouteName.home);
          },
          updatePasswordFailure: (message) {
            LoadingDialog.hide(context);
            log('[CHANGE_PASSWORD] Đổi mật khẩu thất bại! $message');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Đổi mật khẩu thất bại - $message')),
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
                  controller: _oldPasswordController,
                  obscureText: _isObscureOld,
                  decoration: InputDecoration(
                    labelText: 'Mật khẩu cũ',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscureOld ? Icons.visibility_off : Icons.visibility,
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
                    helperText:
                        'Mật khẩu > 8 ký tự, chữ hoa, chữ thường, số và ký tự đặc biệt',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscureNew ? Icons.visibility_off : Icons.visibility,
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
                    } else if (!RegExp(
                            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
                        .hasMatch(value)) {
                      return 'Mật khẩu ít nhất 8 ký tự, chữ hoa, chữ thường, số và ký tự đặc biệt';
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
                            ? Icons.visibility_off
                            : Icons.visibility,
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
                const Text(
                    '* Để đảm bảo quyền riêng tư cho bạn, hãy đổi mật khẩu để hoàn tất quá trình xác thực tài khoản.'),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process the password change
                      context.read<UserBloc>().add(UserEvent.updatePassword(
                          oldPassword: _oldPasswordController.text,
                          newPassword: _newPasswordController.text));
                    }
                  },
                  child: Text('Đổi mật khẩu'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
