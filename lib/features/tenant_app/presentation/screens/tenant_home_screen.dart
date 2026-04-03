import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../shared/widgets/primary_gradient_button.dart';
import '../../../../shared/widgets/status_badge_orb.dart';

class TenantHomeScreen extends StatelessWidget {
  const TenantHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome back,', style: AppTextStyles.bodyMedium),
              Text('Arjun Kumar', style: AppTextStyles.headlineLarge),
              
              const SizedBox(height: 48),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Text('Total Due', style: AppTextStyles.labelLarge),
                    const SizedBox(height: 8),
                    Text('₹13,360', style: AppTextStyles.displayLarge.copyWith(color: AppColors.primary)),
                    const SizedBox(height: 16),
                    StatusBadgeOrb(type: OrbType.warning, text: 'Due in 2 days'),
                    const SizedBox(height: 32),
                    PrimaryGradientButton(
                      text: 'Pay Now',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 48),
              Text('Your Residence', style: AppTextStyles.titleLarge),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerLowest,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.apartment_rounded, color: AppColors.onSurface),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('The Grand Palace', style: AppTextStyles.titleMedium),
                          Text('Room 3A', style: AppTextStyles.labelMedium.copyWith(color: AppColors.onSurfaceVariant)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
