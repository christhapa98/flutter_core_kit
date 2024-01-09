import 'package:in_app_update/in_app_update.dart';

class AndroidAppUpdate {
  static String? error;
  static AppUpdateInfo? updateInfo;
  performUpdateAction(AppUpdateInfo info) {
    if (info.updateAvailability == UpdateAvailability.updateAvailable) {
      InAppUpdate.performImmediateUpdate().catchError((e) {
        return AppUpdateResult.inAppUpdateFailed;
      });
    }
  }

  Future<void> checkForUpdate(
      {required Function(AppUpdateInfo info) onSuccess,
      required Function(dynamic) onError}) {
    return InAppUpdate.checkForUpdate().then((AppUpdateInfo info) {
      updateInfo = info;
      return onSuccess(info);
    }).catchError((e) {
      error = e.toString();
      return onError(e);
    });
  }
}
