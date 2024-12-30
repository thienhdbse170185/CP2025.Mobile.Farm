import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LinearIcons {
  static final Widget settingIconGreen = SvgPicture.asset(
    'assets/icons/setting.svg',
    semanticsLabel: 'Setting',
    colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),
  );

  static final Widget settingIconNormal = SvgPicture.asset(
    'assets/icons/setting.svg',
    semanticsLabel: 'Setting',
  );

  static final Widget bellIconGreen = SvgPicture.asset(
    'assets/icons/bell.svg',
    semanticsLabel: 'Bell',
    colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),
  );

  static final Widget bellIconNormal = SvgPicture.asset(
    'assets/icons/bell.svg',
    semanticsLabel: 'Bell',
  );

  static final Widget helpIcon = SvgPicture.asset(
    'assets/icons/help.svg',
    semanticsLabel: 'Help',
    colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),
  );

  static final Widget aboutIcon = SvgPicture.asset(
    'assets/icons/information.svg',
    semanticsLabel: 'About',
    colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),
  );

  static final Widget historyIcon = SvgPicture.asset(
    'assets/icons/history.svg',
    semanticsLabel: 'History',
    colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),
  );

  static final Widget logoutIcon = SvgPicture.asset(
    'assets/icons/logout.svg',
    semanticsLabel: 'Logout',
    colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
  );

  static final Widget warningAboutIcon = SvgPicture.asset(
    'assets/icons/information.svg',
    semanticsLabel: 'Warning',
    colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
    width: 32,
    height: 32,
  );

  static final Widget chevronRightIcon = SvgPicture.asset(
    'assets/icons/chevron_right.svg',
    semanticsLabel: 'Chevron Right',
  );

  static final Widget chevronRightThinIcon = SvgPicture.asset(
    'assets/icons/chevron_right_thin.svg',
    semanticsLabel: 'Chevron Right Thin',
  );

  static final Widget arrowBackIcon = SvgPicture.asset(
    'assets/icons/arrow-back.svg',
    semanticsLabel: 'Arrow Back',
    width: 30,
    height: 30,
  );

  static final Widget healthIconGreen = SvgPicture.asset(
    'assets/icons/health.svg',
    semanticsLabel: 'Health',
    colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),
  );

  static final Widget phoneCallingIconGreen = SvgPicture.asset(
    'assets/icons/call-calling.svg',
    semanticsLabel: 'Phone Calling',
    colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),
  );

  static final Widget addCircleIcon = SvgPicture.asset(
    'assets/icons/add-circle.svg',
    semanticsLabel: 'Add Circle',
  );

  static final Widget caretDownIcon = SvgPicture.asset(
    'assets/icons/caret-down.svg',
    semanticsLabel: 'Caret Down',
    width: 24,
    height: 24,
  );

  static final Widget pendingTaskIcon = SvgPicture.asset(
    'assets/icons/pending-task.svg',
    semanticsLabel: 'Pending Task',
  );

  static final Widget inprogressTaskIcon = SvgPicture.asset(
    'assets/icons/inprogress-task.svg',
    semanticsLabel: 'Inprogress Task',
  );

  static final Widget doneTaskIcon = SvgPicture.asset(
    'assets/icons/done-task.svg',
    semanticsLabel: 'Done Task',
  );

  static final Widget calendarIcon = SvgPicture.asset(
    'assets/icons/calendar-search.svg',
    semanticsLabel: 'Calendar',
  );

  static final Widget farmHouseIcon = SvgPicture.asset(
    'assets/icons/farm-house.svg',
    semanticsLabel: 'Farm House',
    width: 24,
    height: 24,
  );

  static final Widget chickenIcon = SvgPicture.asset(
    'assets/icons/chicken.svg',
    semanticsLabel: 'Chicken',
    width: 24,
    height: 24,
  );

  static final Widget exportIcon = SvgPicture.asset(
    'assets/icons/export.svg',
    semanticsLabel: 'Export',
    colorFilter: ColorFilter.mode(Colors.redAccent, BlendMode.srcIn),
  );

  static final Widget refreshIcon = SvgPicture.asset('assets/icons/refresh.svg',
      semanticsLabel: 'Import', width: 20, height: 20);

  static final Widget deadlineIcon = SvgPicture.asset(
    'assets/icons/deadline.svg',
    semanticsLabel: 'Deadline',
  );

  static final Widget homeHashtagIcon = SvgPicture.asset(
    'assets/icons/home-hashtag.svg',
    semanticsLabel: 'Home Hashtag',
  );
}
