import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/route_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../shared/widgets/primary_gradient_button.dart';
import '../../../../shared/widgets/input_workspace_field.dart';

class ElectricityScreen extends StatelessWidget {
  const ElectricityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: Text('Meter Reading', style: AppTextStyles.titleLarge),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add electricity reading for Arjun Kumar (Room 1)',
                style: AppTextStyles.bodyMedium.copyWith(color: AppColors.onSurfaceVariant),
              ),
              const SizedBox(height: 32),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Previous Reading', style: AppTextStyles.bodyMedium),
                  Text('4,520 kWh', style: AppTextStyles.dataMedium),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Current Rate', style: AppTextStyles.bodyMedium),
                  Text('₹8.50/unit', style: AppTextStyles.dataMedium),
                ],
              ),
              const SizedBox(height: 32),
              
              InputWorkspaceField(
                label: 'Current Meter Reading (kWh)',
                hintText: 'e.g. 4680',
                keyboardType: TextInputType.number,
                controller: TextEditingController(),
              ),
              
              const SizedBox(height: 64),
              PrimaryGradientButton(
                text: 'Calculate Bill',
                onPressed: () => context.push(kBillReviewRoute),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
