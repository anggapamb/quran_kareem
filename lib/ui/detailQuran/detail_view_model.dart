import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_core/api/api_observer.dart';
import 'package:flutter_core/core.dart';
import 'package:flutter_core/data/collectable.dart';
import 'package:flutter_core/data/core_session.dart';
import 'package:quran_kareem/core/base/viewModel/base_view_model.dart';
import 'package:quran_kareem/core/config/config.dart';
import 'package:quran_kareem/core/data/model/detailSurat/ayat.dart';
import 'package:quran_kareem/core/data/model/detailSurat/detail_surat.dart';
import 'package:quran_kareem/core/data/model/surat/surat.dart';
import 'package:quran_kareem/core/data/source/api/api_service.dart';

class DetailViewModel extends BaseViewModel {
  final ApiService _apiService = Get.find();
  final CoreSession _session = Get.find();

  final Key keyVisibilityDetector = const Key('visibilit_detector');
  final Collectable<DetailSurat?> detailSurat = Collectable(null);
  final Collectable<bool> detailSuratLoading = Collectable(false);

  getDetailSurat(int nomor) {
    detailSuratLoading.value = true;
    ApiObserver.withCallback<DetailSurat>(
      api: () => _apiService.detailSurat(nomor),
      onSuccess: (response) {
        detailSurat.value = response.data;
        detailSuratLoading.value = false;
      },
      onError: (response) {
        detailSuratLoading.value = false;
        showDialog(message: response.message, isError: true);
      },
    );
  }

  void onVisibilityChanged(int index, double visibleFraction) async {
    var visiblePercentage = visibleFraction * 100;
    // Jika lebih dari 50% item terlihat di viewport
    if (visiblePercentage > 60) {
      Ayat? ayat = detailSurat.value?.ayat?[index];
      ayat?.namaSurat = detailSurat.value?.namaLatin;
      String savedAyat = jsonEncode(ayat);
      await _session.write<String>(Config.lastRead, savedAyat);
    }
  }

  @override
  void onInit() {
    final surat = Get.arguments as Surat;
    getDetailSurat(surat.nomor ?? 0);
    super.onInit();
  }
}
