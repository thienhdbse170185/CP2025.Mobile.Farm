import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Image.asset('assets/images/flutter_logo.png'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton(
              onPressed: () {
                context.push(RouteName.support);
              },
              child: const Text('Trợ giúp'),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          // CarouselSlider for Illustrations
          Expanded(
            child: CarouselSlider(
              items: [
                _buildPage(
                  image: _imageTask,
                  title: 'Quản lý công việc hiệu quả',
                  description:
                      'Giúp bạn quản lý các công việc được giao một cách dễ dàng và tiện lợi.',
                ),
                _buildPage(
                  image: _imageManage,
                  title: 'Quản lý chuồng trại',
                  description:
                      'Theo dõi và quản lý các chuồng trại mà bạn được assign để làm việc.',
                ),
                _buildPage(
                  image: _imageNoti,
                  title: 'Thông báo công việc tức thời',
                  description:
                      'Nhanh chóng nhận thông báo về các công việc mới được giao hoặc các thông tin quan trọng.',
                ),
              ],
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.7,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                aspectRatio: 16 / 9,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Button to explore app
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                context.go(RouteName.home);
              },
              child: const Text('Khám phá ngay'),
            ),
          ),
          const SizedBox(height: 16)
        ],
      ),
    );
  }

  Widget _buildPage({
    required AssetImage image,
    required String title,
    required String description,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: image,
          height: 200,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
