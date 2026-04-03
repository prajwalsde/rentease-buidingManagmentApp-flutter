import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

enum OrbType { success, error, warning, neutral }

class StatusBadgeOrb extends StatelessWidget {
  final OrbType type;
  final String text;

  const StatusBadgeOrb({
    super.key,
    required this.type,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    Color orbColor;
    
    switch (type) {
      case OrbType.success:
        orbColor = AppColors.tertiary; // Mint
        break;
      case OrbType.error:
        orbColor = AppColors.error; // Coral
        break;
      case OrbType.warning:
        orbColor = AppColors.primaryContainer; // Amber-ish / Accent
        break;
      case OrbType.neutral:
        orbColor = AppColors.outlineVariant;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: orbColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: orbColor,
              boxShadow: [
                BoxShadow(
                  color: orbColor.withValues(alpha: 0.5),
                  blurRadius: 4,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: AppTextStyles.labelMedium.copyWith(
              color: AppColors.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
