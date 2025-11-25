import 'package:cycleiq_saas_mobile/core/network/network_call/data/model/login_response.dart';
import 'package:cycleiq_saas_mobile/core/shared_pref/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../logger/app_logger.dart';

class PreferencesUtil {
  final SharedPreferences preferences;
  final AppLogger logger;

  PreferencesUtil({required this.preferences, required this.logger});

  // -----------------------------
  // GETTERS
  // -----------------------------

  getPreferencesData(String key) {
    return preferences.getString(key) ?? "";
  }

  getPreferencesListData(String key) {
    return preferences.getStringList(key) ?? [];
  }

  getPreferencesDoubleData(String key) {
    return preferences.getDouble(key) ?? 0.0;
  }

  getPreferencesIntData(String key) {
    return preferences.getInt(key) ?? 0;
  }

  getBoolPreferencesData(String key) {
    return preferences.getBool(key) ?? false;
  }

  bool containKey(String key) {
    return preferences.containsKey(key);
  }

  // -----------------------------
  // SETTERS (ASYNC)
  // -----------------------------

  Future<void> setPreferencesData(String key, String? value) async {
    logger.i('$runtimeType setPreferencesData KEY: $key');
    logger.i('$runtimeType setPreferencesData VALUE: $value');
    await preferences.setString(key, value ?? "");
  }

  Future<void> setPreferencesListData(String key, List<String> value) async {
    logger.i('$runtimeType setPreferencesListData KEY: $key');
    logger.i('$runtimeType setPreferencesListData VALUE: $value');
    await preferences.setStringList(key, value);
  }

  Future<void> setPreferencesDoubleData(String key, double? value) async {
    logger.i('$runtimeType setPreferencesDoubleData KEY: $key');
    logger.i('$runtimeType setPreferencesDoubleData VALUE: $value');
    await preferences.setDouble(key, value ?? 0.0);
  }

  Future<void> setPreferencesIntData(String key, int? value) async {
    logger.i('$runtimeType setPreferencesIntData KEY: $key');
    logger.i('$runtimeType setPreferencesIntData VALUE: $value');
    await preferences.setInt(key, value ?? 0);
  }

  Future<void> setBoolPreferencesData(String key, bool? value) async {
    logger.i('$runtimeType setBoolPreferencesData KEY: $key');
    logger.i('$runtimeType setBoolPreferencesData VALUE: $value');
    await preferences.setBool(key, value ?? false);
  }

  // -----------------------------
  // REMOVE & CLEAR
  // -----------------------------

  Future<void> removePreferencesData(String key) async {
    await preferences.remove(key);
  }

  Future<void> clearPreferencesData({List<String>? preserveKeys}) async {
    if (preserveKeys != null && preserveKeys.isNotEmpty) {
      final allKeys = preferences.getKeys();
      for (final key in allKeys) {
        if (!preserveKeys.contains(key)) {
          await preferences.remove(key);
          logger.i('$runtimeType clearPreferencesData REMOVED KEY: $key');
        }
      }
    } else {
      await preferences.clear();
      logger.i('$runtimeType clearPreferencesData CLEARED ALL');
    }
  }

  // -----------------------------
  // SAVE LOGIN DATA   (ASYNC)
  // -----------------------------

  Future<void> saveLoginData(LoginResponse data) async {
    logger.i("Saving login data...");

    await setPreferencesData(Constants.accessToken, data.token);

    final user = data.user;
    if (user != null) {
      await setPreferencesData(Constants.preCustomerIdKey, user.id);
      await setPreferencesData(Constants.prefNameKey, user.name);
      await setPreferencesData(Constants.prefEmailAddressKey, user.email);

      await setPreferencesIntData(Constants.prefPhoneNumberKey, user.phone);

      await setPreferencesData(Constants.prefAddressKey, user.address);
      await setBoolPreferencesData(Constants.prefIsLoggedIn, true);
    }
  }
}
