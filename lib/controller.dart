import 'package:get/get.dart';
import 'package:the_one_world_test/switching.dart';

class SwitchController extends GetxController {
  SwitchController() {
    allList.addAll([
      Switching(id: 1, title: "LIGHT", subtitle: "tubelight", status: false),
      Switching(id: 2, title: "LIGHT2", subtitle: "tubelight", status: false),
      Switching(id: 3, title: "LIGHT3", subtitle: "tubelight", status: false),
      Switching(id: 4, title: "LIGHT4", subtitle: "tubelight", status: false),
      Switching(id: 5, title: "LIGHT5", subtitle: "tubelight", status: false),
      Switching(id: 6, title: "LIGHT6", subtitle: "tubelight", status: false),
      Switching(id: 7, title: "LIGHT7", subtitle: "tubelight", status: false)
    ]);
  }

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
  final RxList<Switching> allList = <Switching>[].obs;
  final RxList<Switching> enabledList = <Switching>[].obs;

  void toggleEnabled(Switching switching) {
    if (enabledList.contains(switching)) {
      allList
          .firstWhere(
            (element) => element.id == switching.id,
          )
          .status = false;
      enabledList.remove(switching);
    } else {
      allList
          .firstWhere(
            (element) => element.id == switching.id,
          )
          .status = true;
      switching.status = true;
      enabledList.add(switching);
    }
  }
}
