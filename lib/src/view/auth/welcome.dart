import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_farm/src/core/router.dart';

class WelcomeWidget extends StatefulWidget {
  const WelcomeWidget({super.key});

  @override
  State<WelcomeWidget> createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {
  // Lưu trữ AssetImage để giữ cache
  late final AssetImage _imageTask;
  late final AssetImage _imageManage;
  late final AssetImage _imageNoti;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    // Khởi tạo AssetImage
    _imageTask = const AssetImage('assets/images/task.png');
    _imageManage = const AssetImage('assets/images/manage.png');
    _imageNoti = const AssetImage('assets/images/noti.png');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Precache ảnh khi widget được build lần đầu
    precacheImage(_imageTask, context);
    precacheImage(_imageManage, context);
    precacheImage(_imageNoti, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Image.asset(
              'assets/images/LOGOOFFICIAL.png',
              height: 160,
              width: 160,
            ),
            const Spacer(),
            // New text and buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Xin chào,',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'Vui lòng đăng nhập để sử dụng ứng dụng',
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        // Handle login with employee account
                        context.push(RouteName.login);
                      },
                      child: const Text('Đăng nhập với tài khoản nhân viên'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        context.push(RouteName.newbie);
                      },
                      child: const Text('Đăng nhập dành cho nhân viên mới'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
