import 'package:flutter/material.dart';
import 'package:flutter_core/base/screen/core_screen.dart';
import 'package:quran_kareem/gen/assets.gen.dart';

import 'welcome_view_model.dart';

class WelcomeScreen extends CoreScreen<WelcomeViewModel> {
  const WelcomeScreen({super.key});
  static const routeName = '/welcome-screen';

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.bgMain.image().image,
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: Assets.images.icLogo.image(),
      ),
    );
  }
}
