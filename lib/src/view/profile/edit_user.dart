import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_farm/src/core/common/widgets/loading_dialog.dart';
import 'package:smart_farm/src/core/common/widgets/warning_confirm_dialog.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/model/request/user/update_user_info/update_user_info_request.dart';
import 'package:smart_farm/src/view/widgets/custom_app_bar.dart';
import 'package:smart_farm/src/view/widgets/processing_button_widget.dart';
import 'package:smart_farm/src/view/widgets/text_field_required.dart';
import 'package:smart_farm/src/viewmodel/index.dart';
import 'package:smart_farm/src/viewmodel/user/user_bloc.dart';

class EditUserProfileWidget extends StatefulWidget {
  const EditUserProfileWidget({super.key});

  @override
  State<EditUserProfileWidget> createState() => _EditUserProfileWidgetState();
}

class _EditUserProfileWidgetState extends State<EditUserProfileWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  String? _initialName;
  String? _initialPhone;
  String? _initialEmail;
  String? _initialAddress;
  bool _hasChanges = false;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(const UserEvent.getUserProfileByUserId());

    _nameController.addListener(_updateHasChanges);
    _phoneController.addListener(_updateHasChanges);
    _emailController.addListener(_updateHasChanges);
    _addressController.addListener(_updateHasChanges);
  }

  @override
  void dispose() {
    _nameController.removeListener(_updateHasChanges);
    _phoneController.removeListener(_updateHasChanges);
    _emailController.removeListener(_updateHasChanges);
    _addressController.removeListener(_updateHasChanges);

    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _updateHasChanges() {
    setState(() {
      _hasChanges = _checkHasChanges();
    });
  }

  bool _checkHasChanges() {
    return _nameController.text != _initialName ||
        _phoneController.text != _initialPhone ||
        _emailController.text != _initialEmail ||
        _addressController.text != _initialAddress;
  }

  _handleUpdateUserInfo() {
    showDialog(
        context: context,
        builder: (_) {
          return WarningConfirmationDialog(
            title: 'Cập nhật thông tin',
            content: const Text(
              'Bạn có chắc chắn muốn cập nhật thông tin này không?',
              textAlign: TextAlign.center,
            ),
            secondaryButtonText: 'Đóng',
            primaryButtonText: 'Xác nhận',
            onSecondaryButtonPressed: () {
              Navigator.of(context).pop(false);
            },
            onPrimaryButtonPressed: () {
              Navigator.of(context).pop(true);
              context.read<UserBloc>().add(
                    UserEvent.updateUserInfo(
                      request: UpdateUserInfoRequest(
                        fullName: _nameController.text,
                        phoneNumber: _phoneController.text,
                        email: _emailController.text,
                        address: _addressController.text,
                        imageUrl: '',
                      ),
                    ),
                  );
            },
          );
        });
  }

  Future<bool> _onWillPop() async {
    if (_hasChanges) {
      final result = await showDialog<bool>(
        context: context,
        builder: (context) => WarningConfirmationDialog(
          title: 'Thông tin chưa được lưu',
          content: const Text(
            'Những thay đổi của bạn chưa được lưu, \nbạn có chắc chắn hủy thay đổi ?',
            textAlign: TextAlign.center,
          ),
          secondaryButtonText: 'Đóng',
          primaryButtonText: 'Xác nhận',
          onSecondaryButtonPressed: () {
            Navigator.of(context).pop(false);
          },
          onPrimaryButtonPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      );
      return result ?? false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: MultiBlocListener(
        listeners: [
          BlocListener<UserBloc, UserState>(
            listener: (context, state) {
              state.maybeWhen(
                getUserProfileByUserIdInProgress: () {
                  LoadingDialog.show(context, 'Đang tải thông tin...');
                },
                getUserProfileByUserIdSuccess: (userInfo) {
                  _initialName = userInfo.fullName;
                  _initialPhone = userInfo.phoneNumber;
                  _initialEmail = userInfo.email;
                  _initialAddress = userInfo.address;

                  _nameController.text = userInfo.fullName;
                  _phoneController.text = userInfo.phoneNumber;
                  _emailController.text = userInfo.email;
                  _addressController.text = userInfo.address;

                  LoadingDialog.hide(context);
                },
                getUserProfileByUserIdFailure: (message) {
                  LoadingDialog.hide(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
                updateUserInfoInProgress: () {
                  setState(() {
                    _isProcessing = true;
                  });
                },
                updateUserInfoSuccess: () {
                  setState(() {
                    _isProcessing = false;
                    _hasChanges = false;
                  });
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) {
                      return WarningConfirmationDialog(
                        title: 'Cập nhật thành công',
                        content: const Text(
                          'Thông tin đã được cập nhật. Vui lòng đăng xuất và đăng nhập lại để đồng bộ dữ liệu hệ thống.',
                          textAlign: TextAlign.center,
                        ),
                        primaryButtonText: 'Đăng xuất',
                        onPrimaryButtonPressed: () {
                          context
                              .read<AuthBloc>()
                              .add(const AuthEvent.logout());
                        },
                      );
                    },
                  );
                },
                updateUserInfoFailure: (message) {
                  setState(() {
                    _isProcessing = false;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
                orElse: () {},
              );
            },
          ),
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeWhen(
                logoutSuccess: () {
                  context.pop();
                  context.go(RouteName.login);
                },
                orElse: () {},
              );
            },
          ),
        ],
        child: Scaffold(
          appBar: CustomAppBar(
            title: const Text('Cập nhật thông tin'),
            leading: IconButton(
              onPressed: () async {
                if (await _onWillPop()) {
                  if (context.mounted) Navigator.pop(context);
                }
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
          body: SingleChildScrollView(
            padding:
                const EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 90),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Image.asset(
                    'assets/images/avatar.png',
                    width: 120,
                    height: 120,
                  ),
                ),
                const SizedBox(height: 32),
                TextFieldRequired(
                  label: 'Tên người dùng',
                  hintText: 'Nhập tên người dùng',
                  isDisabled: false,
                  controller: _nameController,
                  keyBoardType: TextInputType.name,
                ),
                const SizedBox(height: 32),
                TextFieldRequired(
                  label: 'Email',
                  hintText: 'Nhập email',
                  controller: _emailController,
                  isDisabled: false,
                  keyBoardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 32),
                TextFieldRequired(
                  label: 'Số điện thoại',
                  isDisabled: false,
                  hintText: 'Nhập số điện thoại',
                  controller: _phoneController,
                  keyBoardType: TextInputType.phone,
                ),
                const SizedBox(height: 32),
                TextFieldRequired(
                  label: 'Địa chỉ',
                  hintText: 'Nhập địa chỉ',
                  isDisabled: false,
                  controller: _addressController,
                  keyBoardType: TextInputType.streetAddress,
                ),
              ],
            ),
          ),
          bottomSheet: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: FilledButton(
              onPressed: _isProcessing
                  ? null
                  : _hasChanges
                      ? _handleUpdateUserInfo
                      : null,
              child: _isProcessing
                  ? ProcessingButtonWidget(loadingMessage: 'Đang cập nhật...')
                  : const Text('Cập nhật thông tin'),
            ),
          ),
        ),
      ),
    );
  }
}
