import 'package:data_layer/model/dto/task/task_have_cage_name/task_have_cage_name.dart';
import 'package:data_layer/model/response/medical_symptom/medical_symptom_response.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:smart_farm/src/core/constants/auth_data_constant.dart';
import 'package:smart_farm/src/model/params/create_food_log_cubit/create_food_log_cubit_params.dart';
import 'package:smart_farm/src/model/params/create_health_log_cubit/create_health_log_cubit_params.dart';
import 'package:smart_farm/src/model/params/create_vaccine_log_cubit_params/create_vaccine_log_cubit_params.dart';
import 'package:smart_farm/src/view/auth/change_password.dart';
import 'package:smart_farm/src/view/auth/change_password_newbie.dart';
import 'package:smart_farm/src/view/auth/forgot_password.dart';
import 'package:smart_farm/src/view/auth/otp_verify.dart';
import 'package:smart_farm/src/view/export.dart';
import 'package:smart_farm/src/view/layout.dart';
import 'package:smart_farm/src/view/notification/test.dart';
import 'package:smart_farm/src/view/profile/edit_user.dart';
import 'package:smart_farm/src/view/profile/security.dart';
import 'package:smart_farm/src/view/profile/user.dart';
import 'package:smart_farm/src/view/setting/time.dart';
import 'package:smart_farm/src/view/symptom/cage_option.dart';
import 'package:smart_farm/src/view/symptom/symptom.dart';
import 'package:smart_farm/src/view/symptom/symptom_detail.dart';
import 'package:smart_farm/src/view/symptom/symptom_search.dart';
import 'package:smart_farm/src/view/symptom/symptom_success.dart';
import 'package:smart_farm/src/view/task/task.dart';
import 'package:smart_farm/src/view/task/task_demo_widget.dart';
import 'package:smart_farm/src/view/task/task_history.dart';
import 'package:smart_farm/src/view/task/task_qr_code.dart';
import 'package:smart_farm/src/view/task/task_report.dart';

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
  static const String userProfile = '/user_profile';
  static const String taskDetail = '/task_detail';
  static const String cage = '/cage';
  static const String createSymptom = '/create-symptom';
  static const String createTicket = '/create_ticket';
  static const String notification = '/notification';
  static const String setting = '/setting';
  static const String notificationSetting = '/notification_setting';
  static const String taskHistory = '/task-history';
  static const String symptom = '/symptom';
  static const String editUserProfile = '/edit-user-profile';
  static const String symptomDetail = '/symptom-detail';
  static const String symptomSearch = '/symptom-search';
  static const String symptomSuccess = '/symptom-success';
  static const String security = '/security';
  static const String testNotification = '/test-notification';
  static const String taskQRCode = '/task-qr-code';
  static const String testWidget = '/test-widget';
  static const String forgotPassword = '/forgot-password';
  static const String otpVerification = '/otp-verification';
  static const String changePasswordNewbie = '/change-password-newbie';
  static const String changePassword = '/change-password';
  static const String timeSetting = '/time-setting';
  static const String taskReport = '/task-report';

  static const publicRoutes = [
    welcome,
    support,
    newbie,
    login,
    forgotPassword,
    otpVerification,
    changePasswordNewbie,
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
        return RouteName.login;
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
                    final params = state.extra as Map<String, dynamic>?;
                    final userId = params?['userId'] as String? ?? '';
                    return NotificationWidget(userId: userId);
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
        pageBuilder: (context, state) {
          return _buildPageWithSlideTransition(const TaskWidget());
        },
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
            return _buildPageWithSlideTransition(CageWidget(
              cageId: cageId,
            ));
          }),

      ///health-report-route
      GoRoute(
          path: RouteName.createSymptom,
          pageBuilder: (context, state) {
            final extra = state.extra as Map<String, dynamic>?;
            final cageName = extra?['cageName'] as String? ?? '';
            final cageId = extra?['cageId'] as String?;
            final taskId = extra?['taskId'] as String?;
            final fromTask = extra?['fromTask'] as bool? ?? false;
            final paramsFoodLog =
                extra?['paramsFoodLog'] as CreateFoodLogCubitParams?;
            final paramsHealthLog =
                extra?['paramsHealthLog'] as CreateHealthLogCubitParams?;
            final paramsVaccineLog =
                extra?['paramsVaccineLog'] as CreateVaccineLogCubitParams?;

            return _buildPageWithSlideTransition(CreateSymptomWidget(
              cageName: cageName,
              cageId: cageId,
              taskId: taskId,
              fromTask: fromTask,
              paramsFoodLog: paramsFoodLog,
              paramsHealthLog: paramsHealthLog,
              paramsVaccineLog: paramsVaccineLog,
            ));
          }),

      ///create-ticket-route
      GoRoute(
          path: RouteName.createTicket,
          pageBuilder: (context, builder) =>
              _buildPageWithSlideTransition(const CreateTicketWidget())),

      ///notification-route
      GoRoute(
          path: RouteName.notification,
          pageBuilder: (context, state) {
            final params = state.extra as Map<String, dynamic>?;
            final userId = params?['userId'] as String? ?? '';
            return _buildPageWithSlideTransition(
                NotificationWidget(userId: userId));
          }),

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

      ///user-profile-route
      GoRoute(
          path: RouteName.userProfile,
          pageBuilder: (context, state) =>
              _buildPageWithSlideTransition(const UserProfileWidget())),

      ///edit-user-profile-route
      GoRoute(
          path: RouteName.editUserProfile,
          pageBuilder: (context, state) =>
              _buildPageWithSlideTransition(const EditUserProfileWidget())),

      ///symptom-detail-route
      GoRoute(
          path: RouteName.symptomDetail,
          pageBuilder: (context, state) {
            final symptom = state.extra as Map<String, dynamic>;
            return _buildPageWithSlideTransition(SymptomDetailWidget(
              symptom: symptom['symptom'] as MedicalSymptomResponse,
            ));
          }),

      ///symptom-search-route
      GoRoute(
        path: RouteName.symptomSearch,
        pageBuilder: (context, state) =>
            _buildPageWithSlideTransition(const SymptomSearchWidget()),
      ),

      ///symptom-success-route
      GoRoute(
        path: RouteName.symptomSuccess,
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final fromTask = extra['fromTask'] as bool? ?? false;
          final taskId = extra['taskId'] as String?;

          return _buildPageWithSlideTransition(
            SymptomSuccessWidget(
              symptom: extra['symptom'] as MedicalSymptomResponse,
              cageName: extra['cageName'] as String,
              fromTask: fromTask,
              taskId: taskId,
            ),
          );
        },
      ),

      ///security-route
      GoRoute(
        path: RouteName.security,
        pageBuilder: (context, state) =>
            _buildPageWithSlideTransition(const SecurityWidget()),
      ),

      ///test-notification-route
      GoRoute(
          path: RouteName.testNotification,
          pageBuilder: (context, state) {
            return _buildPageWithSlideTransition(
                const TestNotificationWidget());
          }),

      ///task-qr-code-route
      GoRoute(
        path: RouteName.taskQRCode,
        pageBuilder: (context, state) {
          CageOption cage = state.extra as CageOption;
          return _buildPageWithSlideTransition(TaskQRCodeWidget(cage: cage));
        },
      ),

      GoRoute(
          path: RouteName.testWidget,
          pageBuilder: (context, state) {
            return _buildPageWithSlideTransition(const TaskDemoWidget());
          }),

      GoRoute(
          path: RouteName.forgotPassword,
          pageBuilder: (context, state) {
            return _buildPageWithSlideTransition(const ForgotPasswordScreen());
          }),

      GoRoute(
          path: RouteName.otpVerification,
          pageBuilder: (context, state) {
            final params = state.extra as Map<String, dynamic>;
            final email = params['email'] as String;
            final username = params['username'] as String;
            // 0: forgot password, 1: change password newbie, 2: change password, 3: verify_account
            final otpType = params['otpType'] as int;
            final oldPassword = params['oldPassword'] as String?;
            final newPassword = params['newPassword'] as String?;
            return _buildPageWithSlideTransition(OtpVerifyScreen(
              email: email,
              username: username,
              otpType: otpType,
              oldPassword: oldPassword,
              newPassword: newPassword,
            ));
          }),

      GoRoute(
          path: RouteName.changePasswordNewbie,
          pageBuilder: (context, state) {
            return _buildPageWithSlideTransition(
                const ChangePasswordNewbieScreen());
          }),

      GoRoute(
          path: RouteName.changePassword,
          pageBuilder: (context, state) {
            final params = state.extra as Map<String, dynamic>;
            final username = params['username'] as String;
            return _buildPageWithSlideTransition(
              ChangePasswordScreen(username: username),
            );
          }),

      GoRoute(
          path: RouteName.timeSetting,
          pageBuilder: (context, state) {
            return _buildPageWithSlideTransition(const TimeSettingWidget());
          }),

      GoRoute(
          path: RouteName.taskReport,
          pageBuilder: (context, state) {
            final params = state.extra as Map<String, dynamic>;
            final task = params['task'] as TaskHaveCageName;
            final source = params['source'] as String?;
            return _buildPageWithSlideTransition(TaskReportScreen(
              task: task,
              taskId: task.id,
              source: source,
            ));
          }),
    ]);
