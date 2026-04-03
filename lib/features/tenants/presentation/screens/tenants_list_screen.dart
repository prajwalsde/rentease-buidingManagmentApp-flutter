import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/route_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../shared/widgets/status_badge_orb.dart';

class TenantsListScreen extends StatelessWidget {
  const TenantsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: Text('Tenants', style: AppTextStyles.headlineMedium),
        actions: [
          IconButton(
            onPressed: () => context.push(kAddTenantRoute),
            icon: const Icon(Icons.person_add_rounded, color: AppColors.primary),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 120),
        itemCount: 4,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final isPending = index == 1;
          final isAlert = index == 3;
          final orbType = isAlert 
              ? OrbType.error 
              : isPending 
                  ? OrbType.warning 
                  : OrbType.success;
          
          return InkWell(
            onTap: () => context.push(kOwnerTenantProfileRoute),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                   CircleAvatar(
                     radius: 24,
                     backgroundColor: AppColors.surfaceContainerHighest,
                     child: Text(
                       'T${index + 1}',
                       style: AppTextStyles.titleMedium,
                     ),
                   ),
                   const SizedBox(width: 16),
                   Expanded(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           'Arjun Kumar',
                           style: AppTextStyles.titleMedium,
                         ),
                         const SizedBox(height: 4),
                         Text(
                           'The Grand Palace • Room ${index + 1}',
                           style: AppTextStyles.bodySmall.copyWith(color: AppColors.onSurfaceVariant),
                         ),
                       ],
                     ),
                   ),
                   const SizedBox(width: 8),
                   StatusBadgeOrb(
                     type: orbType,
                     text: orbType == OrbType.success ? 'Paid' : orbType == OrbType.warning ? 'Pending' : 'Overdue',
                   ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
