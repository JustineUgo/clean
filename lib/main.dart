import 'package:clean/app/di/binding.dart';
import 'package:clean/config/config.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/routes.dart';

void main() async {
  await Environment.init();

  runApp(
    const Clean(),
  );
}

class Clean extends StatelessWidget {
  const Clean({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Clean",
      initialBinding: AppBinding(), //injected dependencies
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
