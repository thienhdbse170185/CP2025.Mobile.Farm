import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:smart_farm/src/core/constants/auth_data_constant.dart';
import 'package:smart_farm/src/view/export.dart';
import 'package:smart_farm/src/view/layout.dart';
import 'package:smart_farm/src/view/symptom/symptom.dart';
import 'package:smart_farm/src/view/task/task.dart';
import 'package:smart_farm/src/view/task/task_history.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

class RouteName {
  static const String welcome = '/welcome';
  static const String support = '/support';
  static const String login = '/login';
  static const String newbie = '/newbie';
  static const String home = '/';
  static const String task = '/task';
  static const String ticket = '/ticket';
  static const String warehouse = '/warehouse';
  static const String profile = '/profile';
  static const String taskDetail = '/task_detail';
  static const String cage = '/cage';
  static const String createSymptom = '/create-symptom';
  static const String createTicket = '/create_ticket';
  static const String notification = '/notification';
  static const String setting = '/setting';
  static const String notificationSetting = '/notification_setting';
  static const String taskHistory = '/task-history';
  static const String symptom = '/symptom';

  static const publicRoutes = [
    welcome,
    support,
    newbie,
    login,
  ];
}

CustomTransitionPage _buildPageWithSlideTransition(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}

final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: RouteName.home,
    redirect: (context, state) async {
      final box = await Hive.openBox(AuthDataConstant.authBoxName);
      final accessToken = box.get(AuthDataConstant.accessTokenKey);
      final isAuthenticated = accessToken != null && accessToken.isNotEmpty;

      if (!isAuthenticated &&
          !RouteName.publicRoutes.contains(state.fullPath)) {
        return RouteName.welcome;
      }
      return null;
    },
    routes: [
      StatefulShellRoute.indexedStack(
          builder: (
            context,
            state,
            navigationShell,
          ) {
            return LayoutScaffold(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(routes: [
              GoRoute(
                path: RouteName.home,
                builder: (context, state) => const HomeWidget(),
              )
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: RouteName.task,
                builder: (context, state) => const TaskWidget(),
              )
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                  path: RouteName.notification,
                  builder: (context, state) {
                    return const NotificationWidget();
                  })
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                  path: RouteName.profile,
                  builder: (context, state) => const ProfileWidget())
            ])
          ]),

      ///welcome-route
      GoRoute(
          path: RouteName.welcome,
          pageBuilder: (context, state) =>
              _buildPageWithSlideTransition(const WelcomeWidget())),

      ///support-route
      GoRoute(
        path: RouteName.support,
        pageBuilder: (context, state) =>
            _buildPageWithSlideTransition(const SupportWidget()),
      ),

      GoRoute(
        path: RouteName.task,
        pageBuilder: (context, state) =>
            _buildPageWithSlideTransition(const TaskWidget()),
      ),

      GoRoute(
        path: RouteName.ticket,
        pageBuilder: (context, state) =>
            _buildPageWithSlideTransition(const TicketWidget()),
      ),

      ///login-route
      GoRoute(
        path: RouteName.login,
        pageBuilder: (context, state) =>
            _buildPageWithSlideTransition(const LoginWidget()),
      ),

      GoRoute(
        path: RouteName.setting,
        pageBuilder: (context, state) =>
            _buildPageWithSlideTransition(const SettingWidget()),
      ),

      ///newbie-login-route
      GoRoute(
          path: RouteName.newbie,
          pageBuilder: (context, state) =>
              _buildPageWithSlideTransition(const NewbieLoginWidget())),

      ///task-detail-route
      GoRoute(
        path: RouteName.taskDetail,
        pageBuilder: (context, state) {
          final taskId = state.extra as String;
          return _buildPageWithSlideTransition(
              TaskDetailWidget(taskId: taskId));
        },
      ),

      ///cage-route
      GoRoute(
          path: RouteName.cage,
          pageBuilder: (context, state) {
            final cageId =
                (state.extra as Map<String, dynamic>?)?['cageId'] as String;
            final cardColor =
                (state.extra as Map<String, dynamic>?)?['color'] as Color;
            return _buildPageWithSlideTransition(CageWidget(
              cageId: cageId,
              color: cardColor,
            ));
          }),

      ///health-report-route
      GoRoute(
          path: RouteName.createSymptom,
          pageBuilder: (context, state) {
            final cageName =
                (state.extra as Map<String, dynamic>?)?['cageName'] as String;
            return _buildPageWithSlideTransition(
                CreateSymptomWidget(cageName: cageName));
          }),

      ///create-ticket-route
      GoRoute(
          path: RouteName.createTicket,
          pageBuilder: (context, builder) =>
              _buildPageWithSlideTransition(const CreateTicketWidget())),

      ///notification-route
      GoRoute(
          path: RouteName.notification,
          pageBuilder: (context, state) =>
              _buildPageWithSlideTransition(const NotificationWidget())),

      ///notification-setting-route
      GoRoute(
        path: RouteName.notificationSetting,
        pageBuilder: (context, state) =>
            _buildPageWithSlideTransition(const NotificationSettingWidget()),
      ),

      ///history-task-route
      GoRoute(
        path: RouteName.taskHistory,
        pageBuilder: (context, state) =>
            _buildPageWithSlideTransition(const TaskHistoryWidget()),
      ),

      ///list-symptom-route
      GoRoute(
          path: RouteName.symptom,
          pageBuilder: (context, state) {
            return _buildPageWithSlideTransition(const SymptomWidget());
          }),
    ]);
