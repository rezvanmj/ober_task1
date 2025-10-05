import 'package:flutter/material.dart';

import '../constants/app_styles.dart';

class AppUtils {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showMessage({
    String? title,
    required String message,
    required BuildContext context,
    required bool isShowingError,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.all(10),
        backgroundColor: isShowingError
            ? Theme.of(context).colorScheme.error.withOpacity(0.7)
            : Theme.of(context).hintColor,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                message,
                style: AppStyles.bodyMedium.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
