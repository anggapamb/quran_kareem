import 'package:flutter_core/base/viewmodel/core_view_model.dart';
import 'package:flutter_core/core.dart';
import 'package:quran_kareem/core/base/dialog/base_dialog_view_model.dart';

class BaseViewModel extends CoreViewModel {
  final BaseDialogViewModel _dialogViewModel = Get.put(BaseDialogViewModel());

  @override
  showDialog({required String? message, bool loading = false, bool isError = false}) async {
    _dialogViewModel.showDialog(message, loading, isError);
  }

  @override
  dismissDialog() => _dialogViewModel.dismiss();
}
