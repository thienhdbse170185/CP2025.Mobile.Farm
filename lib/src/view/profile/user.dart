import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';
import 'package:smart_farm/src/core/common/widgets/loading_dialog.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/view/widgets/custom_app_bar.dart';
import 'package:smart_farm/src/view/widgets/text_field_required.dart';
import 'package:smart_farm/src/viewmodel/user/user_bloc.dart';

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({super.key});

  @override
  State<UserProfileWidget> createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(const UserEvent.getUserProfile());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        state.maybeWhen(
          getUserProfileInProgress: () {
            LoadingDialog.show(context, 'Đang lấy thông tin...');
          },
          getUserProfileSuccess: (userName, email, _) {
            _nameController.text = userName;
            _emailController.text = email;
            _phoneController.text = 'Chưa cập nhật';
            LoadingDialog.hide(context);
          },
          getUserProfileFailure: (error) {
            LoadingDialog.hide(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(error)),
            );
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: const Text('Thông tin cá nhân'),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: LinearIcons.arrowBackIcon),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<UserBloc>().add(const UserEvent.getUserProfile());
          },
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
              physics: const AlwaysScrollableScrollPhysics(),
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
                      label: "Tên người dùng",
                      hintText: "Nhập tên người dùng",
                      controller: _nameController),
                  const SizedBox(height: 32),
                  TextFieldRequired(
                      label: "Email",
                      hintText: "Nhập email",
                      controller: _emailController,
                      isDisabled: true),
                  const SizedBox(height: 32),
                  TextFieldRequired(
                      label: "Số điện thoại",
                      hintText: "Nhập số điện thoại",
                      controller: _phoneController,
                      isDisabled: true),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: FilledButton(
            onPressed: () {
              context.push(RouteName.editUserProfile);
            },
            child: const Text('Cập nhật thông tin'),
          ),
        ),
      ),
    );
  }
}
