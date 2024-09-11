/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/app_logo.png
  AssetGenImage get appLogo =>
      const AssetGenImage('assets/images/app_logo.png');

  /// File path: assets/images/bg_main.png
  AssetGenImage get bgMain => const AssetGenImage('assets/images/bg_main.png');

  /// File path: assets/images/bg_main_new.png
  AssetGenImage get bgMainNew =>
      const AssetGenImage('assets/images/bg_main_new.png');

  /// File path: assets/images/ic_bismillah.png
  AssetGenImage get icBismillah =>
      const AssetGenImage('assets/images/ic_bismillah.png');

  /// File path: assets/images/ic_book.png
  AssetGenImage get icBook => const AssetGenImage('assets/images/ic_book.png');

  /// File path: assets/images/ic_logo.png
  AssetGenImage get icLogo => const AssetGenImage('assets/images/ic_logo.png');

  /// File path: assets/images/ic_menu.png
  AssetGenImage get icMenu => const AssetGenImage('assets/images/ic_menu.png');

  /// File path: assets/images/ic_number.png
  AssetGenImage get icNumber =>
      const AssetGenImage('assets/images/ic_number.png');

  /// File path: assets/images/ic_quran.png
  AssetGenImage get icQuran =>
      const AssetGenImage('assets/images/ic_quran.png');

  /// File path: assets/images/ic_saved.png
  AssetGenImage get icSaved =>
      const AssetGenImage('assets/images/ic_saved.png');

  /// File path: assets/images/quran.png
  AssetGenImage get quran => const AssetGenImage('assets/images/quran.png');

  /// File path: assets/images/quran_detail.png
  AssetGenImage get quranDetail =>
      const AssetGenImage('assets/images/quran_detail.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        appLogo,
        bgMain,
        bgMainNew,
        icBismillah,
        icBook,
        icLogo,
        icMenu,
        icNumber,
        icQuran,
        icSaved,
        quran,
        quranDetail
      ];
}

class Assets {
  Assets._();

  static const String aEnv = '.env';
  static const $AssetsImagesGen images = $AssetsImagesGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
