import 'package:get/get.dart';

import 'package:clean/app/modules/timeline/presentation/views/timeline_view.dart';

import '../modules/todo/views/todo_view.dart';

abstract class _Paths {
  static const TIMELINE = '/timeline';
  static const TODO = '/todo';
}

class AppPages {
  AppPages._();
  // static get Initial => _Paths.TIMELINE;

  static const INITIAL = _Paths.TIMELINE;

  static final routes = [
    GetPage(
      name: _Paths.TIMELINE,
      page: () => const TimelineView(),
    ),
    GetPage(
      name: _Paths.TODO,
      page: () => const TodoView(),
    ),
  ];
}
