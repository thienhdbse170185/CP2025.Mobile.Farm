import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_farm/src/view/export.dart';
import 'package:smart_farm/src/view/layout.dart';
import 'package:smart_farm/src/view/task/task.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

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
  static const String report = '/report';
  static const String createTicket = '/create_ticket';
  static const String notification = '/notification';
  static const String setting = '/setting';
  static const String notificationSetting = '/notification_setting';

  static const publicRoutes = [
    welcome,
    support,
    newbie,
    login,
    home,
    task,
    ticket,
    warehouse,
    profile,
    taskDetail,
    cage,
    report,
    createTicket,
    notification,
    setting,
    notificationSetting
  ];
}

final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RouteName.home,
    redirect: (context, state) {
      if (RouteName.publicRoutes.contains(state.fullPath)) {
        return null;
      }
      return RouteName.home;
    },
    routes: [
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
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
            // StatefulShellBranch(routes: [
            //   GoRoute(
            //     path: RouteName.ticket,
            //     builder: (context, state) => const TicketWidget(),
            //   )
            // ]),
            // StatefulShellBranch(routes: [
            //   GoRoute(
            //     path: RouteName.warehouse,
            //     builder: (context, state) => const WarehouseWidget(),
            //   )
            // ]),
            StatefulShellBranch(routes: [
              GoRoute(
                  path: RouteName.profile,
                  builder: (context, state) => const ProfileWidget())
            ])
          ]),

      ///welcome-route
      GoRoute(
          path: RouteName.welcome,
          builder: (context, state) => const WelcomeWidget()),

      ///support-route
      GoRoute(
        path: RouteName.support,
        builder: (context, state) => const SupportWidget(),
      ),

      GoRoute(
        path: RouteName.task,
        builder: (context, state) => const TaskWidget(),
      ),

      GoRoute(
        path: RouteName.ticket,
        builder: (context, state) => const TicketWidget(),
      ),

      ///login-route
      GoRoute(
          path: RouteName.login,
          builder: (context, state) => const LoginWidget()),

      ///newbie-login-route
      GoRoute(
          path: RouteName.newbie,
          builder: (context, state) => const NewbieLoginWidget()),

      ///task-detail-route
      GoRoute(
        path: RouteName.taskDetail,
        builder: (context, state) {
          final taskId = state.extra as String;
          return TaskDetailWidget(taskId: taskId);
        },
      ),

      ///cage-route
      GoRoute(
          path: RouteName.cage,
          builder: (context, state) {
            final cageId = state.extra as String;
            return CageWidget(cageId: cageId);
          }),

      ///health-report-route
      GoRoute(
          path: RouteName.report,
          builder: (context, state) => const HealthReportWidget()),

      ///create-ticket-route
      GoRoute(
          path: RouteName.createTicket,
          builder: (context, builder) => const CreateTicketWidget()),

      ///notification-route
      GoRoute(
          path: RouteName.notification,
          builder: (context, builder) => const NotificationWidget()),

      ///setting-route
      GoRoute(
        path: RouteName.setting,
        builder: (context, state) => const SettingWidget(),
      ),

      ///notification-setting-route
      GoRoute(
        path: RouteName.notificationSetting,
        builder: (context, state) => const NotificationSettingWidget(),
      ),
    ]);
