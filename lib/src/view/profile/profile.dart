import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart'; // Import the common icons
import 'package:smart_farm/src/core/common/widgets/loading_dialog.dart';
import 'package:smart_farm/src/core/router.dart';
import 'package:smart_farm/src/viewmodel/auth/auth_bloc.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  void initState() {
    super.initState();
  }

  void _showLogoutConfirmationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LinearIcons.warningAboutIcon,
              const SizedBox(height: 10),
              const Text(
                'Đăng xuất',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Bạn có chắc chắn muốn đăng xuất khỏi tài \nkhoản này?',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Hủy bỏ'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: FilledButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(const AuthEvent.logout());
                      },
                      child: const Text('Đăng xuất'),
                    ),
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
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () {
            // Show loading dialog
            LoadingDialog.show(context, 'Đang đăng xuất...');
            log('[AUTH] Đang đăng xuất...');
          },
          logoutSuccess: () {
            log('[AUTH] Đăng xuất thành công');
            context.go(RouteName.welcome);
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        body: Stack(
          clipBehavior: Clip.none, // Ensures elements can overflow the Stack
          children: [
            Image.asset(
              'assets/images/background_profile.jpg',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.225,
              width: double.infinity,
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.17,
              left: 16,
              right: 16,
              child: Card(
                color: Colors.white,
                shape: StadiumBorder(),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ListTile(
                    leading: Image.asset(
                      'assets/images/avatar.png',
                      width: 64,
                      height: 64,
                    ),
                    title: Text(
                      'Bảo Thiên',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    trailing: LinearIcons.chevronRightIcon,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.29),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card.outlined(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Quản lý cá nhân',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                          ),
                          const SizedBox(height: 16),
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              // Navigate to help
                              // context.push(RouteName.help);
                            },
                            child: Row(
                              children: [
                                LinearIcons.helpIcon,
                                const SizedBox(width: 16),
                                Text(
                                  'Trợ giúp',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const Spacer(),
                                LinearIcons.chevronRightThinIcon
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              // Navigate to about
                              // context.push(RouteName.about);
                            },
                            child: Row(
                              children: [
                                LinearIcons.aboutIcon,
                                const SizedBox(width: 16),
                                Text(
                                  'Giới thiệu',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const Spacer(),
                                LinearIcons.chevronRightThinIcon
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Card.outlined(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              context.push(RouteName.setting);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      LinearIcons.settingIconGreen,
                                      const SizedBox(width: 16),
                                      Text(
                                        'Cài đặt',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                    ],
                                  ),
                                ),
                                LinearIcons.chevronRightIcon
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      _showLogoutConfirmationBottomSheet(context);
                    },
                    child: SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          const SizedBox(width: 8),
                          LinearIcons.exportIcon,
                          const SizedBox(width: 8),
                          Text(
                            'Đăng xuất',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Colors.red),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
