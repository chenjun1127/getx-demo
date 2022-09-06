import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:getx_demo/controller/controller.dart';
import 'package:getx_demo/views/other.dart';
import 'package:getx_demo/views/page2.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controller c = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(title: const Text('GetX Demo')),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              GetBuilder<Controller>(init: c, builder: (c) => Text("Clicks: ${c.counter}")),
              ElevatedButton(
                onPressed: () => Get.to(Other()),
                child: const Text("page1"),
              ),
              ElevatedButton(
                onPressed: () => Get.to(const Page2()),
                child: const Text("page2"),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(child: const Icon(Icons.add), onPressed: c.increment),
    );
  }
}
