import 'dart:convert';

import 'package:flutter_core/api/api_observer.dart';
import 'package:flutter_core/core.dart';
import 'package:flutter_core/data/collectable.dart';
import 'package:flutter_core/data/core_session.dart';
import 'package:quran_kareem/core/base/viewModel/base_view_model.dart';
import 'package:quran_kareem/core/config/config.dart';
import 'package:quran_kareem/core/data/model/detailSurat/ayat.dart';
import 'package:quran_kareem/core/data/model/surat/surat.dart';
import 'package:quran_kareem/core/data/source/api/api_service.dart';

class HomeViewModel extends BaseViewModel {
  final ApiService _apiService = Get.find();
  final CoreSession _session = Get.find();

  final Collectable<List<Surat>> surat = Collectable(List.empty());
  final Collectable<bool> suratLoading = Collectable(false);
  Collectable<Ayat?> lastRead = Collectable(null);

  void _getSurat() async {
    suratLoading.value = true;
    final response = await ApiObserver.withFuture<List<Surat>>(api: () => _apiService.surat());
    if (response.isSuccessful) {
      surat.value = response.data ?? List.empty();
      suratLoading.value = false;
    } else {
      suratLoading.value = false;
      showDialog(message: response.message, isError: true);
    }
  }

  void getLastRead() async {
    String? lastReadString = await _session.read<String>(Config.lastRead);
    Ayat? savedAyat = Ayat.fromJson(jsonDecode(lastReadString ?? ''));
    lastRead.value = savedAyat;
  }

  @override
  void onInit() {
    _getSurat();
    getLastRead();
    super.onInit();
  }
}
