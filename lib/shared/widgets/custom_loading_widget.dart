import 'package:flutter/material.dart';

import '../../core/resources/colors.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({ super.key});


  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(
          backgroundColor: AppColors.white),
    );
  }
}
