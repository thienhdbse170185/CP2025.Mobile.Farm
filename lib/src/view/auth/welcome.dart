import 'package:carousel_slider/carousel_slider.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Image.asset('assets/images/LOGOOFFICIAL.png'),
        ),
        leadingWidth: 70,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(
                  'Trợ giúp',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: Column(
          children: [
            // CarouselSlider for Illustrations
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.47,
              child: CarouselSlider(
                items: [
                  _buildPage(
                    image: _imageTask,
                    description: 'Quản lý công việc dễ dàng',
                  ),
                  _buildPage(
                    image: _imageManage,
                    description: 'Theo dõi và quản lý chuồng trại',
                  ),
                  _buildPage(
                    image: _imageNoti,
                    description: 'Nhận thông báo công việc tức thời',
                  ),
                ],
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.7,
                  autoPlay: true,
                  autoPlayInterval:
                      const Duration(seconds: 5), // Increased interval
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  aspectRatio: 16 / 9,
                  enableInfiniteScroll: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicators(),
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
                        // Handle login for new employees
                      },
                      child: const Text('Đăng nhập dành cho nhân viên mới'),
                    ),
                  ),
                ],
              ),
            ),
            // Footer with privacy terms
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Text(
                    'Bằng cách đăng nhập, bạn đã đồng ý với các',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Điều khoản về Quyền riêng tư.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicators() {
    return List<Widget>.generate(3, (index) {
      return Container(
        width: 8.0,
        height: 8.0,
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentIndex == index
              ? Theme.of(context).colorScheme.primary
              : Colors.grey,
        ),
      );
    });
  }

  Widget _buildPage({
    required AssetImage image,
    required String description,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: image,
          height: 320,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Text(
            description,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
