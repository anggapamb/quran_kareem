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
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.primary,
              ),
              child: Center(
                child: Assets.images.icLogo.image(
                  width: 150,
                  height: 150,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline, color: AppColors.primary),
              title: const Text('About App',
                  style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
              onTap: () {
                Get.back();
                showAboutDialog(
                  context: context,
                  applicationName: 'Quran Kareem',
                  applicationVersion: '1.0.0',
                  applicationIcon: Assets.images.appLogo.image(width: 50, height: 50),
                  children: [
                    const Text(
                        'A comprehensive Quran application for reading and reciting the Holy Quran.'),
                    const SizedBox(height: 10),
                    const Text('Developed using Flutter.'),
                  ],
                );
              },
            ),
          ],
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
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.transparent,
              leading: InkWell(
                onTap: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  margin: const EdgeInsets.only(left: 20),
                  child: Assets.images.icMenu.image(),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: const BoxDecoration(color: AppColors.primary),
                ),
              ),
              actions: const [],
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
                      final callback = await Get.toNamed(DetailScreen.routeName,
                          arguments: viewModel.surat.value[index]);
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
