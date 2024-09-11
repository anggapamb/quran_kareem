import 'package:flutter_core/core.dart';
import 'package:quran_kareem/core/base/dialog/base_dialog.dart';

class BaseDialogViewModel extends GetxController {
  var coreDialogLoading = false.obs;
  var coreDialodMessage = ''.obs;
  var coreDialogError = false.obs;

  showDialog(String? message, bool loading, bool isError) {
    coreDialogLoading.value = loading;
    coreDialodMessage.value = message ?? 'unknown';
    coreDialogError.value = isError;
    _showDialog();
  }

  _showDialog() {
    if (Get.isDialogOpen == false) {
      Get.dialog(const BaseDialog(), barrierDismissible: false);
    }
  }

  dismiss() {
    if (Get.isDialogOpen == true && coreDialogLoading.value == false) {
      Get.back();
    }
  }
}
