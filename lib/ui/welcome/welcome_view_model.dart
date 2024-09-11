import 'package:flutter_core/base/viewmodel/core_view_model.dart';
import 'package:flutter_core/core.dart';
import 'package:quran_kareem/ui/home/home_screen.dart';

class WelcomeViewModel extends CoreViewModel {
  _waitingSplashScreen() async {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(HomeScreen.routeName);
    });
  }

  @override
  void onInit() {
    super.onInit();
    _waitingSplashScreen();
  }
}
