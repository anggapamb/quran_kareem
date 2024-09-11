import 'package:flutter/material.dart';
import 'package:flutter_core/core.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_kareem/core/data/model/detailSurat/ayat.dart';
import 'package:quran_kareem/core/utils/app_colors.dart';
import 'package:share_extend/share_extend.dart';

enum AudioState { play, idle, loading }

class ItemAyat extends StatefulWidget {
  final Ayat? ayat;
  final String? nameSurat;
  const ItemAyat({super.key, required this.ayat, required this.nameSurat});

  @override
  State<ItemAyat> createState() => _ItemAyatState();
}

class _ItemAyatState extends State<ItemAyat> {
  final player = AudioPlayer();
  AudioState audioState = AudioState.idle;

  _playAudio() async {
    player.stop();
    player.setUrl(widget.ayat?.audio?.audio01 ?? '');
    await player.play();
  }

  _listenAudio() {
    player.playerStateStream.listen((event) {
      switch (event.processingState) {
        case ProcessingState.idle:
          audioState = AudioState.idle;
        case ProcessingState.loading:
          audioState = AudioState.loading;
        case ProcessingState.buffering:
          audioState = AudioState.loading;
        case ProcessingState.ready:
          audioState = AudioState.play;
        case ProcessingState.completed:
          audioState = AudioState.idle;
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    _listenAudio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: const Color.fromRGBO(10, 32, 96, 1)),
            child: Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: AppColors.textBlue,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    '${widget.ayat?.nomorAyat}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          ShareExtend.share(
                              '${widget.nameSurat} ayat ${widget.ayat?.nomorAyat}\n${widget.ayat?.teksArab}\nArtinya: ${widget.ayat?.teksIndonesia}', "text");
                        },
                        child: const Icon(Icons.share_outlined, color: AppColors.textBlue, size: 30),
                      ),
                      const Gap(16),
                      audioState == AudioState.loading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(color: AppColors.textBlue),
                            )
                          : InkWell(
                              onTap: () {
                                if (audioState == AudioState.play) {
                                  player.stop();
                                  return;
                                }
                                _playAudio();
                              },
                              child: Icon(
                                audioState == AudioState.idle ? Icons.play_arrow_outlined : Icons.pause,
                                color: AppColors.textBlue,
                                size: 30,
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Gap(16),
          SizedBox(
            width: double.infinity,
            child: Text(
              widget.ayat?.teksArab ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.end,
            ),
          ),
          const Gap(12),
          SizedBox(
            width: double.infinity,
            child: Text(
              widget.ayat?.teksIndonesia ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          const Gap(4)
        ],
      ),
    );
  }
}
