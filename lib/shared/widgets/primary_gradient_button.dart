import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class PrimaryGradientButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  const PrimaryGradientButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: onPressed == null
            ? null
            : const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primaryActionStart,
                  AppColors.primaryActionEnd,
                ],
              ),
        color: onPressed == null ? AppColors.surfaceContainerHigh : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: isLoading ? null : onPressed,
          child: Center(
            child: isLoading
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: AppColors.onPrimaryContainer,
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    text,
                    style: AppTextStyles.labelLarge.copyWith(
                      color: onPressed == null
                          ? AppColors.onSurfaceVariant
                          : AppColors.onPrimaryContainer,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
