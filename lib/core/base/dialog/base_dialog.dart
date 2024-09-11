import 'package:flutter/material.dart';
import 'package:flutter_core/core.dart';
import 'package:quran_kareem/core/base/dialog/base_dialog_view_model.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final BaseDialogViewModel viewModel = Get.find();

    return GestureDetector(
      onTap: () => viewModel.dismiss(),
      child: Container(
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () {},
          child: Dialog(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: viewModel.coreDialogError.value ? Colors.red : Colors.white,
              ),
              child: Flexible(
                child: Row(
                  children: [
                    Obx(() => Visibility(visible: viewModel.coreDialogLoading.value == true, child: const CircularProgressIndicator())),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Obx(
                          () => Flexible(
                            child: Text(
                              viewModel.coreDialogError.value ? 'Error: ${viewModel.coreDialodMessage}' : '${viewModel.coreDialodMessage}',
                              style: TextStyle(color: viewModel.coreDialogError.value ? Colors.white : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
