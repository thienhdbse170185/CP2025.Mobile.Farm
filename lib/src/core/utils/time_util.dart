class TimeUtils {
  static DateTime Function() customNow = () => DateTime.now();

  static int getCurrentSession() {
    final now = TimeUtils.customNow();
    final hour = now.hour;
    int currentSession;

    if (hour >= 6 && hour < 12) {
      currentSession = 1;
    } else if (hour >= 12 && hour < 14) {
      currentSession = 2;
    } else if (hour >= 14 && hour < 18) {
      currentSession = 3;
    } else if (hour >= 18 && hour < 23) {
      currentSession = 4;
    } else {
      currentSession = -1;
    }

    return currentSession;
  }

  static String getCurrentSessionName() {
    int currentSession = TimeUtils.getCurrentSession();
    switch (currentSession) {
      case 1:
        return 'Buổi sáng';
      case 2:
        return 'Buổi trưa';
      case 3:
        return 'Buổi chiều';
      case 4:
        return 'Buổi tối';
      default:
        return 'Buổi khuya';
    }
  }

  static String getCurrentSessionPathImage() {
    int currentSession = TimeUtils.getCurrentSession();
    String imagePath = '';
    switch (currentSession) {
      case 1:
        imagePath = 'assets/images/morning.png';
      case 2:
        imagePath = 'assets/images/noon.png';
      case 3:
        imagePath = 'assets/images/afternoon.png';
      case 4:
        imagePath = 'assets/images/moon.png';
      default:
        imagePath = 'assets/images/moon.png';
    }
    return imagePath;
  }

  static bool isCurrentSession(DateTime time) {
    final int currentSession = getCurrentSession();
    final int timeSession = getSessionFromTime(time);

    return currentSession == timeSession;
  }

  static int getSessionFromTime(DateTime time) {
    final hour = time.hour;

    if (hour >= 6 && hour < 12) {
      return 1;
    } else if (hour >= 12 && hour < 14) {
      return 2;
    } else if (hour >= 14 && hour < 18) {
      return 3;
    } else if (hour >= 18 && hour < 23) {
      return 4;
    } else {
      return -1;
    }
  }
}
