import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/src/core/common/widgets/linear_icons.dart';

class SecurityWidget extends StatelessWidget {
  const SecurityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bảo mật'),
        leading: IconButton(
          icon: LinearIcons.arrowBackIcon,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Password Section
          _buildSecuritySection(
            context,
            title: 'Mật khẩu & Bảo mật',
            items: [
              _buildSecurityItem(
                context,
                icon: LinearIcons.lockIcon,
                title: 'Đổi mật khẩu',
                subtitle: 'Cập nhật mật khẩu mới',
                onTap: () => _showChangePasswordDialog(context),
              ),
              _buildSecurityItem(
                context,
                icon: LinearIcons.shieldIcon,
                title: 'Xác thực 2 lớp',
                subtitle: 'Bảo vệ tài khoản',
                trailing: Switch(
                  value: false,
                  onChanged: (value) => _show2FASettings(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Login History
          _buildSecuritySection(
            context,
            title: 'Lịch sử đăng nhập',
            items: [
              _buildLoginHistoryItem(
                context,
                date: DateTime.now(),
                device: 'iPhone 12',
                location: 'Ho Chi Minh City',
                isCurrentDevice: true,
              ),
              _buildLoginHistoryItem(
                context,
                date: DateTime.now().subtract(const Duration(days: 2)),
                device: 'Chrome - Windows',
                location: 'Ho Chi Minh City',
                isCurrentDevice: false,
              ),
              _buildLoginHistoryItem(
                context,
                date: DateTime.now().subtract(const Duration(days: 5)),
                device: 'Safari - MacBook',
                location: 'Ha Noi',
                isCurrentDevice: false,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSecuritySection(
    BuildContext context, {
    required String title,
    required List<Widget> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          child: Column(
            children: items,
          ),
        ),
      ],
    );
  }

  Widget _buildSecurityItem(
    BuildContext context, {
    required Widget icon,
    required String title,
    required String subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
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
            if (trailing != null) trailing else LinearIcons.chevronRightIcon,
          ],
        ),
      ),
    );
  }

  Widget _buildLoginHistoryItem(
    BuildContext context, {
    required DateTime date,
    required String device,
    required String location,
    required bool isCurrentDevice,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isCurrentDevice
                  ? Colors.green.withOpacity(0.1)
                  : Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              isCurrentDevice ? Icons.phone_android : Icons.devices,
              color: isCurrentDevice ? Colors.green : Colors.grey,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      device,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    if (isCurrentDevice) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Hiện tại',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                Text(
                  DateFormat('dd/MM/yyyy HH:mm').format(date),
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'details',
                child: Text('Chi tiết'),
              ),
              if (!isCurrentDevice)
                const PopupMenuItem(
                  value: 'remove',
                  child: Text(
                    'Đăng xuất thiết bị này',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
            ],
            onSelected: (value) {
              if (value == 'remove') {
                _showLogoutDeviceDialog(context);
              }
            },
          ),
        ],
      ),
    );
  }

  void _showChangePasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Đổi mật khẩu'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Mật khẩu hiện tại',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Mật khẩu mới',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Xác nhận mật khẩu mới',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          FilledButton(
            onPressed: () {
              // Handle password change
              Navigator.pop(context);
            },
            child: const Text('Cập nhật'),
          ),
        ],
      ),
    );
  }

  void _show2FASettings(BuildContext context) {
    // Show 2FA settings
  }

  void _showLogoutDeviceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Đăng xuất thiết bị'),
        content: const Text(
          'Bạn có chắc chắn muốn đăng xuất khỏi thiết bị này không?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          FilledButton(
            onPressed: () {
              // Handle device logout
              Navigator.pop(context);
            },
            child: const Text('Đăng xuất'),
          ),
        ],
      ),
    );
  }
}
