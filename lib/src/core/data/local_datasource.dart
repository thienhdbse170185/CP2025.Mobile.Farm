import 'package:hive/hive.dart';
import 'package:smart_farm/src/core/constants/auth_data_constant.dart';

class LocalDataSource {
  static Future<void> saveAccessToken(String? token) async {
    var box = await Hive.openBox(AuthDataConstant.authBoxName);
    await box.put(AuthDataConstant.accessTokenKey, token);
  }

  static Future<String?> getAccessToken() async {
    var box = await Hive.openBox(AuthDataConstant.authBoxName);
    return box.get(AuthDataConstant.accessTokenKey);
  }

  static Future<void> deleteAccessToken() async {
    var box = await Hive.openBox(AuthDataConstant.authBoxName);
    await box.delete(AuthDataConstant.accessTokenKey);
  }
}
