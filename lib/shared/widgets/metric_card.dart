import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final String? subtitle;
  final Widget? trailingIcon;
  final VoidCallback? onTap;
  final bool isMoney;

  const MetricCard({
    super.key,
    required this.title,
    required this.value,
    this.subtitle,
    this.trailingIcon,
    this.onTap,
    this.isMoney = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: AppTextStyles.labelMedium,
                ),
                if (trailingIcon != null) trailingIcon!,
              ],
            ),
            const SizedBox(height: 16),
            Text(
              isMoney ? '₹$value' : value,
              style: isMoney 
                  ? AppTextStyles.dataLarge.copyWith(color: AppColors.primary)
                  : AppTextStyles.headlineMedium,
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 4),
              Text(
                subtitle!,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
