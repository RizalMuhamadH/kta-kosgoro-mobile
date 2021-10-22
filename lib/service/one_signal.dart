import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalService extends GetxService {
  static OneSignalService get() => Get.find();
  Future<OneSignalService> init() async {
    OneSignal.shared.setAppId("80f72aa5-0a29-4b29-bf0e-46732c65720e");

    // OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.consentGranted(true);

    OneSignal.shared.setNotificationWillShowInForegroundHandler((event) {});

    OneSignal.shared.setNotificationOpenedHandler((openedResult) {});

    OneSignal.shared.setSubscriptionObserver((changes) {});
    return this;
  }
}
