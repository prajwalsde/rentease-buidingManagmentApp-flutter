import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class TenantProfileScreen extends StatelessWidget {
  const TenantProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: Text('Settings', style: AppTextStyles.headlineMedium),
        backgroundColor: AppColors.surface,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 36,
                backgroundColor: AppColors.surfaceContainerHigh,
                child: Icon(Icons.person_rounded, size: 36, color: AppColors.outlineVariant),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Arjun Kumar', style: AppTextStyles.headlineSmall),
                  Text('arjunk@example.com', style: AppTextStyles.bodyMedium.copyWith(color: AppColors.onSurfaceVariant)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 48),
          
          Text('General', style: AppTextStyles.titleLarge),
          const SizedBox(height: 16),
          _SettingsTile(icon: Icons.notifications_rounded, title: 'Notifications', onTap: () {}),
          _SettingsTile(icon: Icons.dark_mode_rounded, title: 'Appearance', onTap: () {}),
          _SettingsTile(icon: Icons.support_agent_rounded, title: 'Contact Landlord', onTap: () {}),
          
          const SizedBox(height: 32),
          Text('Account', style: AppTextStyles.titleLarge),
          const SizedBox(height: 16),
          _SettingsTile(icon: Icons.security_rounded, title: 'Privacy Settings', onTap: () {}),
          _SettingsTile(icon: Icons.logout_rounded, title: 'Sign Out', onTap: () {}, isDestructive: true),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isDestructive;
  final VoidCallback onTap;

  const _SettingsTile({
    required this.icon,
    required this.title,
    this.isDestructive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isDestructive ? AppColors.error.withValues(alpha: 0.1) : AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: isDestructive ? AppColors.error : AppColors.onSurface,
        ),
      ),
      title: Text(
        title,
        style: AppTextStyles.titleMedium.copyWith(
          color: isDestructive ? AppColors.error : AppColors.onSurface,
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: AppColors.outlineVariant),
    );
  }
}
