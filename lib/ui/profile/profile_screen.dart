import 'package:flutter/material.dart';
import 'package:flutter_core/base/screen/core_screen.dart';

import 'profile_view_model.dart';

class ProfileScreen extends CoreScreen<ProfileViewModel> {
  const ProfileScreen({super.key});
  static const routeName = '/profile-screen';

  @override
  Widget buildScreen(BuildContext context) {
    return const Scaffold();
  }
}
