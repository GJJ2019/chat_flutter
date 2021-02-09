import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/style.dart';

/// for showing side effects in apps like snack bar etc
class SideEffects {
  /// for showing error snackBar using [title] String
  static void showSnackBar(String title) => Get.snackbar(
        'Error:-',
        title,
        backgroundColor: Style.blackColor,
        colorText: Style.whiteColor,
        margin: const EdgeInsets.all(20),
        snackPosition: SnackPosition.BOTTOM,
      );

  /// for showing yes no dialog for confirmation
  /// using [title] , [onNoPressed], [onYesPressed]
  static void showDialog({
    @required String title,
    @required VoidCallback onNoPressed,
    @required VoidCallback onYesPressed,
  }) =>
      Get.dialog(
        AlertDialog(
          contentPadding: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(title, style: medium, textAlign: TextAlign.center),
          actions: <Widget>[
            GestureDetector(
              onTap: onNoPressed,
              child: Text(
                'No\n',
                style: semiBoldMedium.copyWith(color: Style.greenColor),
              ),
            ),
            const SizedBox(width: 30),
            GestureDetector(
              onTap: onYesPressed,
              child: Text(
                'Yes\n',
                style: semiBoldMedium.copyWith(color: Style.accentColor),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      );
}
