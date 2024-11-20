import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_farm/src/view/cage/cage.dart';
import 'package:smart_farm/src/view/home/home.dart';
import 'package:smart_farm/src/view/layout.dart';
import 'package:smart_farm/src/view/profile/profile.dart';
import 'package:smart_farm/src/view/report/report.dart';
import 'package:smart_farm/src/view/task/task.dart';
import 'package:smart_farm/src/view/task/task_detail.dart';
import 'package:smart_farm/src/view/ticket/create_ticket.dart';
import 'package:smart_farm/src/view/ticket/ticket.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

class RouteName {
  static const String home = '/';
  static const String task = '/task';
  static const String ticket = '/ticket';
  static const String profile = '/profile';
  static const String taskDetail = '/task_detail';
  static const String cage = '/cage';
  static const String report = '/report';
  static const String createTicket = '/create_ticket';

  static const publicRoutes = [
    home,
    task,
    ticket,
    profile,
    taskDetail,
    cage,
    report,
    createTicket
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
            StatefulShellBranch(routes: [
              GoRoute(
                path: RouteName.ticket,
                builder: (context, state) => const TicketWidget(),
              )
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: RouteName.profile,
                builder: (context, state) => const ProfileWidget(),
              )
            ])
          ]),
      GoRoute(
          path: RouteName.taskDetail,
          builder: (context, state) => const TaskDetailWidget()),
      GoRoute(
          path: RouteName.cage,
          builder: (context, state) => const CageWidget()),
      GoRoute(
          path: RouteName.report,
          builder: (context, state) => const HealthReportWidget()),
      GoRoute(
          path: RouteName.createTicket,
          builder: (context, builder) => const CreateTicketWidget())
    ]);
