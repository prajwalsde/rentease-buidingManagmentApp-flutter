import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class TenantBillsScreen extends StatelessWidget {
  const TenantBillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: Text('Payment History', style: AppTextStyles.headlineMedium),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(24),
          itemCount: 5,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final isCurrent = index == 0;
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isCurrent ? AppColors.surfaceContainerLowest : AppColors.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(16),
                border: isCurrent ? Border.all(color: AppColors.outlineVariant.withValues(alpha: 0.3)) : null,
              ),
              child: Row(
                children: [
                  Icon(
                    isCurrent ? Icons.schedule_rounded : Icons.check_circle_rounded, 
                    color: isCurrent ? AppColors.primaryContainer : AppColors.tertiary,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(isCurrent ? 'Sept Rent + Electricity' : 'Aug Rent + Electricity', style: AppTextStyles.titleMedium),
                        Text(isCurrent ? 'Due: Oct 1' : 'Paid: Sept 1', style: AppTextStyles.bodySmall),
                      ],
                    ),
                  ),
                  Text('₹13,360', style: AppTextStyles.dataLarge.copyWith(color: isCurrent ? AppColors.primary : AppColors.onSurface)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
