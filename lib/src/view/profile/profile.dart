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
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.outline,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }

  Widget _buildMenuItem({
    required Widget icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: icon,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                LinearIcons.chevronRightIcon,
              ],
            ),
          ),
        ),
        if (showDivider)
          Divider(
            height: 1,
            indent: 16,
            endIndent: 16,
            color: Colors.grey[200],
          ),
      ],
    );
  }

  Widget _buildQuickStat(
    BuildContext context,
    String label,
    String value,
    Widget icon,
  ) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: icon,
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
      ],
    );
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
        body: RefreshIndicator(
          onRefresh: () async {
            // Refresh profile data
          },
          child: SingleChildScrollView(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Background Image
                Container(
                  height: MediaQuery.of(context).size.height * 0.225,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage(
                          'assets/images/background_profile.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.3),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                ),

                // Profile Card
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.17,
                  left: 16,
                  right: 16,
                  child: InkWell(
                    onTap: () => context.push(RouteName.userProfile),
                    child: Card(
                      shape: const StadiumBorder(),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 32,
                                  backgroundImage: const AssetImage(
                                      'assets/images/avatar.png'),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Bảo Thiên',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    'Chủ trang trại',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    'ID: #123456',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            LinearIcons.chevronRightIcon,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Main Content
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.29,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      // Quick Stats
                      Card.outlined(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildQuickStat(
                                context,
                                'Tổng đàn',
                                '1,234',
                                LinearIcons.chickenIcon,
                              ),
                              _buildQuickStat(
                                context,
                                'Báo cáo',
                                '56',
                                LinearIcons.taskSquareIcon,
                              ),
                              _buildQuickStat(
                                context,
                                'Chuồng',
                                '12',
                                LinearIcons.farmHouseIcon,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Account Management
                      Card.outlined(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionHeader('Quản lý tài khoản'),
                            _buildMenuItem(
                              icon: LinearIcons.lockIcon,
                              title: 'Bảo mật',
                              subtitle: 'Mật khẩu, xác thực 2 lớp',
                              onTap: () => context.push(RouteName.security),
                            ),
                            _buildMenuItem(
                              icon: LinearIcons.bellIconGreen,
                              title: 'Thông báo',
                              subtitle: 'Cài đặt thông báo',
                              onTap: () =>
                                  context.push(RouteName.notificationSetting),
                            ),
                            _buildMenuItem(
                              icon: LinearIcons.shieldIcon,
                              title: 'Quyền riêng tư',
                              subtitle: 'Kiểm soát dữ liệu',
                              // onTap: () => context.push(RouteName.privacy),
                              showDivider: false,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Support
                      Card.outlined(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionHeader('Hỗ trợ'),
                            _buildMenuItem(
                              icon: LinearIcons.helpIcon,
                              title: 'Trợ giúp',
                              subtitle: 'FAQ, hướng dẫn sử dụng',
                              // onTap: () => context.push(RouteName.help),
                            ),
                            _buildMenuItem(
                              icon: LinearIcons.helpIcon,
                              title: 'Phản hồi',
                              subtitle: 'Góp ý, báo lỗi',
                              // onTap: () => context.push(RouteName.feedback),
                            ),
                            _buildMenuItem(
                              icon: LinearIcons.aboutIcon,
                              title: 'Giới thiệu',
                              subtitle: 'Thông tin ứng dụng',
                              // onTap: () => context.push(RouteName.about),
                              showDivider: false,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Logout Button
                      InkWell(
                        onTap: () =>
                            _showLogoutConfirmationBottomSheet(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LinearIcons.exportIcon,
                            const SizedBox(width: 8),
                            const Text(
                              'Đăng xuất',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
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
