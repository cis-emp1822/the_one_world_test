import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_one_world_test/controller.dart';
import 'package:the_one_world_test/switching.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: GetX<SwitchController>(
      init: SwitchController(),
      builder: (controller) {
        log(controller.allList.toString());
        return DefaultTabController(
          length: 4,
          child: Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
                bottom: const TabBar(
                  tabs: [
                    Tab(icon: Text("Hall")),
                    Tab(icon: Text("Dining")),
                    Tab(icon: Text("Bathroom")),
                    Tab(icon: Text("Kitchen")),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: controller.allList.length,
                      itemBuilder: (context, index) {
                        return CardFromSwitch(
                          switching: controller.allList[index],
                          ontoggle: (on) => controller
                              .toggleEnabled(controller.allList[index]),
                        );
                      }),
                  GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: controller.enabledList.length,
                      itemBuilder: (context, index) {
                        return CardFromSwitch(
                          switching: controller.enabledList[index],
                          ontoggle: (on) => controller
                              .toggleEnabled(controller.enabledList[index]),
                        );
                      }),
                  GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: controller.allList.length,
                      itemBuilder: (context, index) {
                        return CardFromSwitch(
                          switching: controller.allList[index],
                          ontoggle: (on) => controller
                              .toggleEnabled(controller.allList[index]),
                        );
                      }),
                  GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: controller.enabledList.length,
                      itemBuilder: (context, index) {
                        return CardFromSwitch(
                          switching: controller.enabledList[index],
                          ontoggle: (on) => controller
                              .toggleEnabled(controller.enabledList[index]),
                        );
                      }),
                ],
              )),
        );
      },
    ));
  }
}

class CardFromSwitch extends StatelessWidget {
  const CardFromSwitch({Key? key, this.switching, this.ontoggle})
      : super(key: key);
  final Switching? switching;
  final Function(bool)? ontoggle;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  switching!.title!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  switching!.subtitle!,
                  style: const TextStyle(fontWeight: FontWeight.w100),
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  switching!.status! ? 'On' : 'Off',
                  style: const TextStyle(fontWeight: FontWeight.w100),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.check_circle),
                const SizedBox(
                  height: 14,
                ),
                Switch(value: switching!.status!, onChanged: ontoggle)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
