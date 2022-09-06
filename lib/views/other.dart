import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:getx_demo/controller/controller.dart';

class Other extends StatelessWidget {
  Other({Key? key}) : super(key: key);

  //通过Get.find()找到另一个页面的控制器
  final Controller c = Get.find();

  @override
  Widget build(context) {
    //显示更新后的count值
    return Scaffold(
      appBar: AppBar(
        title: const Text('other'),
      ),
      body: Center(child: Text("${c.counter}")),
    );
  }
}
