import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:getx_demo/controller/controller.dart';
import 'package:getx_demo/entity/user_info.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final Controller c = Get.find();

  @override
  void initState() {
    super.initState();
    c.updateList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('列表更新'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          Rx<UserInfo> userInfo = c.userList[index];
          return ListTile(
            title: Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xff623521)),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  c.updateListByName('jack');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Text("$index"),
                    ),
                    Expanded(child: Text(userInfo.value.userName ?? '')),
                    Expanded(child: Obx(() => Text(userInfo.value.tel ?? ''))),
                    const Expanded(child: Text('点击整个列表title更新数据')),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: c.userList.length,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    c.userList.clear();
  }
}
