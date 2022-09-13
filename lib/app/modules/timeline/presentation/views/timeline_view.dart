import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/timeline_controller.dart';

class TimelineView extends GetView<TimelineController> {
  const TimelineView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => controller.fetchPosts(),
          child: const Text(
            'Fetch Posts',
          ),
        ),
      ),
    );
  }
}
