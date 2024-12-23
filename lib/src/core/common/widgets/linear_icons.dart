import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LinearIcons {
  static final Widget settingIcon = SvgPicture.asset(
    'assets/icons/setting.svg',
    semanticsLabel: 'Setting',
    colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),
  );

  static final Widget bellIcon = SvgPicture.asset(
    'assets/icons/bell.svg',
    semanticsLabel: 'Bell',
    colorFilter: ColorFilter.mode(Colors.green, BlendMode.srcIn),
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
}
