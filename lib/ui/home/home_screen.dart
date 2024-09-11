import 'package:flutter/material.dart';
import 'package:flutter_core/base/screen/core_screen.dart';
import 'package:flutter_core/core.dart';
import 'package:flutter_core/widget/collect/collect.dart';
import 'package:quran_kareem/core/utils/app_colors.dart';
import 'package:quran_kareem/gen/assets.gen.dart';
import 'package:quran_kareem/ui/detailQuran/detail_screen.dart';
import 'package:quran_kareem/ui/home/widget/item_surat.dart';

import 'home_view_model.dart';

class HomeScreen extends CoreScreen<HomeViewModel> {
  const HomeScreen({super.key});
  static const routeName = '/home-screen';

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.bgMainNew.image().image,
            fit: BoxFit.cover,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.transparent,
              leading: Container(
                height: 40,
                width: 40,
                margin: const EdgeInsets.only(left: 20),
                child: Assets.images.icMenu.image(),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: const BoxDecoration(color: AppColors.primary),
                ),
              ),
              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: CircleAvatar(
                    radius: 21,
                    backgroundColor: AppColors.textBlue,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: Image.network(
                        'https://randomuser.me/api/portraits/men/86.jpg',
                        loadingBuilder: (context, child, loadingProgress) => const CircularProgressIndicator(),
                        errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported),
                      ).image,
                    ),
                  ),
                )
              ],
            ),
            SliverToBoxAdapter(
              child: Collect(() {
                return Column(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeOutQuint,
                      margin: EdgeInsets.only(top: viewModel.suratLoading.value ? 200 : 0),
                      height: 180,
                      child: Assets.images.quran.image(),
                    ),
                    Visibility(
                      visible: viewModel.suratLoading.value,
                      child: const CircularProgressIndicator(
                        color: AppColors.textBlue,
                      ),
                    )
                  ],
                );
              }),
            ),
            SliverToBoxAdapter(
              child: Collect(() {
                return Visibility(
                  visible: !viewModel.suratLoading.value && viewModel.lastRead.value != null,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color.fromRGBO(101, 214, 252, 1), Color.fromRGBO(69, 94, 181, 1)],
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    transform: Matrix4.translationValues(0, -20, 0),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                          child: Assets.images.icBismillah.image(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: Assets.images.icBook.image(),
                            ),
                            const Gap(6),
                            const Text(
                              'Last Read',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${viewModel.lastRead.value?.namaSurat}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Ayat No: ${viewModel.lastRead.value?.nomorAyat}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                                width: 30,
                                child: Assets.images.icSaved.image(),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
            Collect(() {
              return SliverList.builder(
                itemCount: viewModel.surat.value.length,
                itemBuilder: (context, index) {
                  return ItemSurat(
                    surat: viewModel.surat.value[index],
                    onTap: () async {
                      final callback = await Get.toNamed(DetailScreen.routeName, arguments: viewModel.surat.value[index]);
                      if (callback != null) {
                        viewModel.getLastRead();
                      }
                    },
                  );
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
