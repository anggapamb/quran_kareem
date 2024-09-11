import 'package:flutter_core/core.dart';
import 'package:flutter_core/data/core_session.dart';
import 'package:quran_kareem/core/config/config.dart';
import 'package:quran_kareem/core/data/source/api/api_service.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

class AppModule {
  static Future<void> initService() async {
    Get.lazyPut(() => CoreSession(), fenix: true);
    Get.lazyPut(() {
      final dio = Dio(
        BaseOptions(
          baseUrl: Config.baseUrl,
          sendTimeout: Config.networkTimeout,
          connectTimeout: Config.networkTimeout,
          receiveTimeout: Config.networkTimeout,
        ),
      );
      dio.interceptors.add(
        TalkerDioLogger(
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printResponseHeaders: true,
            printResponseMessage: true,
          ),
        ),
      );
      return dio;
    }, fenix: true);
    Get.lazyPut(() => ApiService(Get.find()), fenix: true);
  }
}
