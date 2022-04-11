import 'package:get/get.dart';
import 'package:kta/model/event.dart';
import 'package:kta/provider/event_provider.dart';
import 'package:logger/logger.dart';

class EventController extends GetxController {
  final EventProvider provider;

  EventController(this.provider);

  final events = <Data>[].obs;
  final data = Data().obs;

  @override
  void onInit() async {
    super.onInit();
    await getEvent();
  }

  getEvent() async {
    await provider.getEvent().then((value) {
      if (value.code == 200) {
        events.value = value.data ?? [];
      }
    }, onError: (e) {
      Logger().e(e);
    });
  }
}
