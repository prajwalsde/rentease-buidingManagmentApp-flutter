import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class TenantProfileScreen extends StatefulWidget {
  const TenantProfileScreen({super.key});

  @override
  State<TenantProfileScreen> createState() => _TenantProfileScreenState();
}

class _TenantProfileScreenState extends State<TenantProfileScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: CustomScrollView(
        slivers: [
          // Glassmorphism App Bar
          SliverAppBar(
            pinned: true,
            backgroundColor: AppColors.surface.withValues(alpha: 0.6),
            surfaceTintColor: Colors.transparent,
            flexibleSpace: ClipRRect(
              child: BackdropFilter(
                filter: ColorFilter.mode(
                  AppColors.surface.withValues(alpha: 0.6),
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
              'Ramesh Kumar',
              style: AppTextStyles.headlineSmall.copyWith(
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
                fontSize: 18,
              ),
            ),
            centerTitle: false,
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.more_vert_rounded,
                  color: AppColors.onSurfaceVariant,
                ),
                onPressed: () {},
              ),
              const SizedBox(width: 8),
            ],
          ),

          // Body Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0, bottom: 40.0),
              child: Column(
                children: [
                  _buildProfileHeaderCard(),
                  const SizedBox(height: 32),
                  _buildStatsStrip(),
                  const SizedBox(height: 32),
                  _buildTabsNavigation(),
                  const SizedBox(height: 24),
                  _buildTabContent(),
                  const SizedBox(height: 120), // Bottom padding for navigation
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeaderCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryContainer.withValues(alpha: 0.2),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    )
                  ],
                  gradient: const LinearGradient(
                    colors: [AppColors.primaryContainer, AppColors.secondaryContainer],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  'RK',
                  style: AppTextStyles.headlineMedium.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.onPrimaryContainer,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              // Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ramesh Kumar',
                      style: AppTextStyles.headlineMedium.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.domain_rounded,
                          size: 16,
                          color: AppColors.onSurfaceVariant,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Room 101 • Sunrise Residency',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.onSurfaceVariant,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Tenant since 12 Jan 2024',
                      style: AppTextStyles.labelSmall.copyWith(
                        color: AppColors.onSurfaceVariant.withValues(alpha: 0.6),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Action Buttons
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 52,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.outlineVariant.withValues(alpha: 0.15),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.call_rounded,
                          color: AppColors.primary,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Call',
                          style: AppTextStyles.titleSmall.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 52,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.outlineVariant.withValues(alpha: 0.15),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.chat_bubble_rounded,
                          color: AppColors.tertiary,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'WhatsApp',
                          style: AppTextStyles.titleSmall.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatsStrip() {
    return Row(
      children: [
        _buildStatBox(
          label: 'TOTAL PAID',
          value: '₹48,000',
          valueColor: AppColors.primary,
        ),
        const SizedBox(width: 12),
        _buildStatBox(
          label: 'ON TIME',
          value: '04 Mon',
          valueColor: AppColors.tertiary,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Text(
                  'STATUS',
                  style: AppTextStyles.labelSmall.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    color: AppColors.onSurfaceVariant.withValues(alpha: 0.6),
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppColors.tertiary,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.tertiary.withValues(alpha: 0.5),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Paid',
                      style: AppTextStyles.titleMedium.copyWith(
                        color: AppColors.tertiary,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatBox({required String label, required String value, required Color valueColor}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainer,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: AppTextStyles.labelSmall.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                color: AppColors.onSurfaceVariant.withValues(alpha: 0.6),
                fontSize: 10,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              value,
              style: AppTextStyles.titleMedium.copyWith(
                fontFamily: 'JetBrains Mono',
                fontWeight: FontWeight.w600,
                color: valueColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabsNavigation() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.outlineVariant.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          _buildTabItem('Rent history', 0),
          const SizedBox(width: 32),
          _buildTabItem('Electricity', 1),
          const SizedBox(width: 32),
          _buildTabItem('Info', 2),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, int index) {
    final bool isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppColors.primary : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          title,
          style: AppTextStyles.titleSmall.copyWith(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected ? AppColors.primary : AppColors.onSurfaceVariant,
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    if (_selectedTabIndex == 0) {
      return _buildRentHistoryTab();
    } else if (_selectedTabIndex == 1) {
      return const Center(child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Text('Utility Data Placeholder', style: TextStyle(color: AppColors.outline)),
      ));
    } else {
      return _buildInfoTab();
    }
  }

  Widget _buildRentHistoryTab() {
    return Column(
      children: [
        _buildRentHistoryRow(
          month: 'May 2024',
          statusText: '3 days overdue',
          amount: '12,000',
          isOverdue: true,
          iconData: Icons.warning_rounded,
        ),
        const SizedBox(height: 16),
        _buildRentHistoryRow(
          month: 'April 2024',
          statusText: 'Paid on 02 Apr · UPI',
          amount: '12,000',
          isOverdue: false,
          iconData: Icons.payments_rounded,
        ),
        const SizedBox(height: 16),
        _buildRentHistoryRow(
          month: 'March 2024',
          statusText: 'Paid on 05 Mar · NEFT',
          amount: '12,000',
          isOverdue: false,
          iconData: Icons.account_balance_rounded,
        ),
        const SizedBox(height: 16),
        _buildRentHistoryRow(
          month: 'February 2024',
          statusText: 'Paid on 01 Feb · Cash',
          amount: '12,000',
          isOverdue: false,
          iconData: Icons.payments_rounded,
        ),
      ],
    );
  }

  Widget _buildRentHistoryRow({
    required String month,
    required String statusText,
    required String amount,
    required bool isOverdue,
    required IconData iconData,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isOverdue ? AppColors.surfaceContainerLow : AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
        border: isOverdue
            ? const Border(left: BorderSide(color: AppColors.error, width: 4))
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isOverdue ? AppColors.error.withValues(alpha: 0.1) : AppColors.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Icon(
                  iconData,
                  color: isOverdue ? AppColors.error : AppColors.onSurfaceVariant,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    month,
                    style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    statusText,
                    style: AppTextStyles.labelMedium.copyWith(
                      color: isOverdue ? AppColors.error : AppColors.onSurfaceVariant.withValues(alpha: 0.8),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '₹$amount',
                style: AppTextStyles.titleLarge.copyWith(
                  fontFamily: 'JetBrains Mono',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 4),
              if (isOverdue)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.errorContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'PENDING',
                    style: AppTextStyles.labelSmall.copyWith(
                      color: AppColors.onErrorContainer,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      letterSpacing: 0.5,
                    ),
                  ),
                )
              else
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: AppColors.tertiary,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.tertiary.withValues(alpha: 0.5),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'PAID',
                      style: AppTextStyles.labelSmall.copyWith(
                        color: AppColors.tertiary,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PERSONAL DETAILS',
          style: AppTextStyles.labelSmall.copyWith(
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: AppColors.onSurfaceVariant.withValues(alpha: 0.6),
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              _buildInfoRow(
                icon: Icons.mail_rounded,
                label: 'Email',
                value: 'ramesh.k@gmail.com',
                isMono: false,
              ),
              _buildInfoRow(
                icon: Icons.phone_iphone_rounded,
                label: 'Phone',
                value: '+91 98765 43210',
                isMono: true,
                isAlt: true,
              ),
              _buildInfoRow(
                icon: Icons.payments_rounded,
                label: 'Security Deposit',
                value: '₹24,000',
                isMono: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    required bool isMono,
    bool isAlt = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: isAlt ? AppColors.surfaceContainer.withValues(alpha: 0.3) : Colors.transparent,
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 24),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.onSurfaceVariant.withValues(alpha: 0.6),
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: AppTextStyles.titleSmall.copyWith(
                  fontFamily: isMono ? 'JetBrains Mono' : 'Manrope',
                  fontWeight: isMono ? FontWeight.bold : FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
