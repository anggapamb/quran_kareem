import 'package:flutter/material.dart';
import 'package:flutter_core/base/screen/core_screen.dart';
import 'package:flutter_core/core.dart';
import 'package:flutter_core/widget/collect/collect.dart';
import 'package:quran_kareem/core/utils/app_colors.dart';
import 'package:quran_kareem/gen/assets.gen.dart';
import 'package:quran_kareem/ui/detailQuran/widget/item_ayat.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'detail_view_model.dart';

class DetailScreen extends CoreScreen<DetailViewModel> {
  const DetailScreen({super.key});
  static const routeName = '/detail-screen';

  @override
  Widget buildScreen(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        Get.back(result: true);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: true,
          iconTheme: const IconThemeData(color: Colors.white),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(color: AppColors.primary),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Assets.images.bgMainNew.image().image,
              fit: BoxFit.cover,
            ),
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Collect(() {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeOutQuint,
                    decoration: viewModel.detailSuratLoading.value
                        ? null
                        : BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color.fromRGBO(101, 214, 252, 1), Color.fromRGBO(69, 94, 181, 1)],
                            ),
                          ),
                    margin: EdgeInsets.only(left: 20, right: 20, top: viewModel.detailSuratLoading.value ? 300 : 20, bottom: 20),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Visibility(
                          visible: !viewModel.detailSuratLoading.value,
                          child: Row(
                            children: [
                              Assets.images.quranDetail.image(
                                height: 150,
                                width: 150,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      viewModel.detailSurat.value?.nama ?? '',
                                      style: const TextStyle(
                                        fontSize: 26,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Gap(16),
                                    Text(
                                      viewModel.detailSurat.value?.arti ?? '',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Gap(4),
                                    Text(
                                      '${viewModel.detailSurat.value?.tempatTurun} - ${viewModel.detailSurat.value?.jumlahAyat} Ayat',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Visibility(
                          visible: viewModel.detailSuratLoading.value,
                          child: const CircularProgressIndicator(
                            color: AppColors.textBlue,
                          ),
                        )
                      ],
                    ),
                  );
                }),
              ),
              Collect(() {
                return SliverList.builder(
                  itemCount: viewModel.detailSurat.value?.ayat?.length ?? 0,
                  itemBuilder: (context, index) {
                    return VisibilityDetector(
                      key: viewModel.keyVisibilityDetector,
                      onVisibilityChanged: (info) {
                        if (info.visibleFraction > 0.0) {
                          viewModel.onVisibilityChanged(index, info.visibleFraction);
                        }
                      },
                      child: ItemAyat(
                        ayat: viewModel.detailSurat.value?.ayat?[index],
                        nameSurat: viewModel.detailSurat.value?.namaLatin,
                      ),
                    );
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
