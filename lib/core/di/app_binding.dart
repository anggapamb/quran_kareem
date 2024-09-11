import 'package:flutter_core/core.dart';
import 'package:quran_kareem/ui/detailQuran/detail_view_model.dart';
import 'package:quran_kareem/ui/home/home_view_model.dart';
import 'package:quran_kareem/ui/welcome/welcome_view_model.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomeViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => DetailViewModel());
  }
}
