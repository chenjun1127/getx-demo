import 'package:get/get.dart';
import 'package:getx_demo/entity/user_info.dart';

class Controller extends GetxController {
  int counter = 0;

  void increment() {
    counter++;
    update();
  }

  RxList<Rx<UserInfo>> userList = RxList<Rx<UserInfo>>();

  void updateList() {
    userList.add(Rx(UserInfo('jack', 20, '13456235214')));
  }

  void updateListByName(String name) {
    if (userList.isEmpty) {
      return;
    }
    Rx<UserInfo>? u = userList.firstWhereOrNull((Rx<UserInfo> info) => info.value.userName == name);
    if (u != null) {
      print("列表属性更新、触发页面刷新");
      u.update((UserInfo? val) {
        val?.tel = '13480682693';
      });
    }
  }
}
