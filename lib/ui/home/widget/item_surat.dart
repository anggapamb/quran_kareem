import 'package:flutter/material.dart';
import 'package:quran_kareem/core/data/model/surat/surat.dart';
import 'package:quran_kareem/core/utils/app_colors.dart';
import 'package:quran_kareem/gen/assets.gen.dart';

class ItemSurat extends StatelessWidget {
  final Surat surat;
  final Function onTap;
  const ItemSurat({super.key, required this.surat, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap.call(),
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 12),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Assets.images.icNumber.image().image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                  child: Text(
                    '${surat.nomor}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.textBlue,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          surat.namaLatin ?? '',
                          style: const TextStyle(
                            color: AppColors.textBlue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${surat.tempatTurun} - ${surat.jumlahAyat} Ayat',
                          style: const TextStyle(
                            color: AppColors.textGrey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  surat.nama ?? '',
                  style: const TextStyle(
                    color: AppColors.textBlue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Container(
              height: 1,
              margin: const EdgeInsets.only(top: 12),
              width: double.infinity,
              color: AppColors.textGrey,
            )
          ],
        ),
      ),
    );
  }
}
