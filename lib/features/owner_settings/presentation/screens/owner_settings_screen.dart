import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class OwnerSettingsScreen extends StatefulWidget {
  const OwnerSettingsScreen({super.key});

  @override
  State<OwnerSettingsScreen> createState() => _OwnerSettingsScreenState();
}

class _OwnerSettingsScreenState extends State<OwnerSettingsScreen> {
  bool _rentReminders = true;
  bool _overdueAlerts = true;
  bool _paymentAlerts = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // Glassmorphism App Bar
          SliverAppBar(
            pinned: true,
            backgroundColor: AppColors.background.withValues(alpha: 0.6),
            surfaceTintColor: Colors.transparent,
            flexibleSpace: ClipRRect(
              child: BackdropFilter(
                filter: ColorFilter.mode(
                  AppColors.background.withValues(alpha: 0.6),
                  BlendMode.srcOver,
                ),
                child: const SizedBox.expand(),
              ),
            ),
            elevation: 0,
            leadingWidth: 72,
            leading: Center(
              child: InkWell(
                onTap: () => context.pop(),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.arrow_back,
                    color: AppColors.onSurfaceVariant,
                    size: 24,
                  ),
                ),
              ),
            ),
            title: Text(
              'Settings',
              style: AppTextStyles.titleMedium.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            centerTitle: false,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none_rounded,
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              Container(
                width: 32,
                height: 32,
                margin: const EdgeInsets.only(right: 24, left: 8),
                decoration: const BoxDecoration(
                  color: AppColors.secondaryContainer,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  'AM',
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.onSecondaryContainer,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  // Profile Hero Section
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.surfaceContainerHighest,
                                width: 4,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.2),
                                  blurRadius: 24,
                                )
                              ],
                              color: AppColors.surfaceContainerHighest,
                            ),
                            child: const Icon(
                              Icons.person_rounded,
                              size: 64,
                              color: AppColors.outline,
                            ),
                          ),
                          Positioned(
                            bottom: 4,
                            right: 4,
                            child: Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                color: AppColors.primaryContainer,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.2),
                                    blurRadius: 8,
                                  )
                                ],
                              ),
                              child: const Icon(
                                Icons.edit_rounded,
                                size: 16,
                                color: AppColors.onPrimaryContainer,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Alex Mehta',
                              style: AppTextStyles.headlineMedium.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Mehta Properties',
                              style: AppTextStyles.titleSmall.copyWith(
                                color: AppColors.secondary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),

                  // Property Settings
                  _buildSettingsSection(
                    icon: Icons.domain_rounded,
                    title: 'PROPERTY',
                    children: [
                      _buildSettingsRow(
                        label: 'Default rate',
                        trailingValue: '₹45,000',
                        isMono: true,
                        valueColor: AppColors.tertiary,
                      ),
                      _buildSettingsRow(
                        label: 'Due date',
                        trailingValue: '05th of Month',
                        isMono: true,
                      ),
                      _buildSettingsRow(
                        label: 'Grace period',
                        trailingValue: '3 Days',
                        isMono: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Notifications
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: BackdropFilter(
                      filter: ColorFilter.mode(AppColors.surfaceContainerHigh.withValues(alpha: 0.5), BlendMode.srcOver),
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainerHigh.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.notifications_active_rounded, color: AppColors.primary, size: 20),
                                const SizedBox(width: 8),
                                Text(
                                  'NOTIFICATIONS',
                                  style: AppTextStyles.labelSmall.copyWith(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2.0,
                                    color: AppColors.outline,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            _buildToggleRow('Rent reminders', _rentReminders, (v) => setState(() => _rentReminders = v)),
                            const SizedBox(height: 24),
                            _buildToggleRow('Overdue alerts', _overdueAlerts, (v) => setState(() => _overdueAlerts = v)),
                            const SizedBox(height: 24),
                            _buildToggleRow('Payment alerts', _paymentAlerts, (v) => setState(() => _paymentAlerts = v)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Account Settings
                  _buildSettingsSection(
                    icon: Icons.manage_accounts_rounded,
                    title: 'ACCOUNT',
                    children: [
                      _buildAccountActionRow('Edit profile', Icons.person_rounded),
                      _buildAccountActionRow('Change password', Icons.lock_rounded),
                      _buildAccountActionRow(
                        'Language',
                        Icons.language_rounded,
                        trailingValue: 'ENGLISH (US)',
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // Danger Zone
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      width: double.infinity,
                      height: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.error.withValues(alpha: 0.3), width: 2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.logout_rounded, color: AppColors.error, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            'Log out',
                            style: AppTextStyles.titleMedium.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.error,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(16),
                    child: SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.delete_forever_rounded, color: AppColors.error.withValues(alpha: 0.6), size: 20),
                          const SizedBox(width: 8),
                          Text(
                            'Delete account',
                            style: AppTextStyles.titleMedium.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.error.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 100), // spacing for bottom nav tab
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection({
    required IconData icon,
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.primary, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: AppTextStyles.labelSmall.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  color: AppColors.outline,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ...children.expand((widget) => [widget, const SizedBox(height: 20)]).toList()..removeLast(),
        ],
      ),
    );
  }

  Widget _buildSettingsRow({
    required String label,
    required String trailingValue,
    bool isMono = false,
    Color? valueColor,
  }) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyles.titleSmall.copyWith(
              color: AppColors.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              Text(
                trailingValue,
                style: AppTextStyles.titleSmall.copyWith(
                  fontFamily: isMono ? 'JetBrains Mono' : null,
                  fontWeight: FontWeight.bold,
                  color: valueColor ?? AppColors.onSurface,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.chevron_right_rounded, color: AppColors.outlineVariant, size: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildToggleRow(String label, bool value, ValueChanged<bool> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.titleSmall.copyWith(
            color: AppColors.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.primary,
          activeTrackColor: AppColors.primaryContainer,
          inactiveTrackColor: AppColors.surfaceVariant,
          trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ],
    );
  }

  Widget _buildAccountActionRow(String label, IconData icon, {String? trailingValue}) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyles.titleSmall.copyWith(
              color: AppColors.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              if (trailingValue != null) ...[
                Text(
                  trailingValue,
                  style: AppTextStyles.labelSmall.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    color: AppColors.outline,
                  ),
                ),
                const SizedBox(width: 8),
              ],
              Icon(icon, color: AppColors.outlineVariant, size: 20),
            ],
          ),
        ],
      ),
    );
  }
}
