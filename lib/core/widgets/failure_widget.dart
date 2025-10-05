import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Unable to load data',
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: AppColors.errorColor),
      ),
    );
  }
}
