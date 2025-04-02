import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/core/common/widgets/loading_dialog.dart';
import 'package:smart_farm/src/core/common/widgets/warning_confirm_dialog.dart';
import 'package:smart_farm/src/view/widgets/custom_app_bar.dart';
import 'package:smart_farm/src/view/widgets/text_field_required.dart';
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

  final List<File> _images = [];

  String? _initialName;
  String? _initialPhone;
  String? _initialEmail;
  bool _hasChanges = false;

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(const UserEvent.getUserProfile());

    _nameController.addListener(_updateHasChanges);
    _phoneController.addListener(_updateHasChanges);
    _emailController.addListener(_updateHasChanges);
  }

  @override
  void dispose() {
    _nameController.removeListener(_updateHasChanges);
    _phoneController.removeListener(_updateHasChanges);
    _emailController.removeListener(_updateHasChanges);

    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
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
        _emailController.text != _initialEmail;
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

// Function to pick an image from the camera
  Future<void> _pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }

  // Function to pick an image from the gallery
  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }

  void _showBottomSheetAvatar() {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Chọn ảnh đại diện',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              Wrap(
                children: <Widget>[
                  ListTile(
                    leading: LinearIcons.cameraIcon,
                    title: const Text('Chụp ảnh'),
                    onTap: () {
                      Navigator.pop(context);
                      _pickImageFromCamera();
                    },
                  ),
                  ListTile(
                    leading: LinearIcons.folderAddIcon,
                    title: const Text('Chọn tập tin'),
                    onTap: () {
                      Navigator.pop(context);
                      _pickImageFromGallery();
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          state.maybeWhen(
            getUserProfileInProgress: () {
              LoadingDialog.show(context, 'Đang lấy thông tin người dùng');
            },
            getUserProfileSuccess: (String name, String email, _) {
              LoadingDialog.hide(context);
              _nameController.text = name;
              _emailController.text = email;
              _initialName = name;
              _initialEmail = email;
              _initialPhone = _phoneController.text;
            },
            getUserProfileFailure: (message) {
              LoadingDialog.hide(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              );
            },
            orElse: () {},
          );
        },
        child: Scaffold(
          appBar: CustomAppBar(
            title: const Text('Cập nhật thông tin'),
            leading: IconButton(
              onPressed: () async {
                if (await _onWillPop()) {
                  if (context.mounted) Navigator.pop(context);
                }
              },
              icon: LinearIcons.arrowBackIcon,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
            child: Column(
              children: [
                Stack(
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
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _showBottomSheetAvatar,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                          child: LinearIcons.cameraIconWhite,
                        ),
                      ),
                    ),
                  ],
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
              ],
            ),
          ),
          bottomSheet: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: FilledButton(
              onPressed: () {
                // Thực hiện logic lưu thông tin
                // Sau khi lưu thành công:
                setState(() {
                  _hasChanges = false;
                });
              },
              child: const Text('Lưu'),
            ),
          ),
        ),
      ),
    );
  }
}
