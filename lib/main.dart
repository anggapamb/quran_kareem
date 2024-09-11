import 'package:flutter/material.dart';
import 'package:flutter_core/base/core_app.dart';
import 'package:flutter_core/core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:quran_kareem/core/di/app_binding.dart';
import 'package:quran_kareem/core/di/app_module.dart';
import 'package:quran_kareem/ui/detailQuran/detail_screen.dart';
import 'package:quran_kareem/ui/detailQuran/detail_view_model.dart';
import 'package:quran_kareem/ui/home/home_screen.dart';
import 'package:quran_kareem/ui/home/home_view_model.dart';
import 'package:quran_kareem/ui/welcome/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppModule.initService();
  await dotenv.load(fileName: ".env");
  runApp(const App());
}

class App extends CoreApp {
  const App({super.key});

  @override
  Widget initialScreen() => const WelcomeScreen();

  @override
  Bindings initialBinding() => AppBinding();

  @override
  List<GetPage> getPages() => [
        GetPage(
          name: HomeScreen.routeName,
          page: () => const HomeScreen(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => HomeViewModel());
          }),
        ),
        GetPage(
          name: DetailScreen.routeName,
          page: () => const DetailScreen(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => DetailViewModel());
          }),
        ),
      ].toList();
}
