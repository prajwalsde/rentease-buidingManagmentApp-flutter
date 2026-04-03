import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/route_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class Step5AllSetScreen extends StatelessWidget {
  const Step5AllSetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Ambient Background Spotlights
          Positioned(
            top: -50,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withValues(alpha: 0.05),
                boxShadow: [BoxShadow(color: AppColors.primary.withValues(alpha: 0.05), blurRadius: 120, spreadRadius: 60)],
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondaryContainer.withValues(alpha: 0.05),
                boxShadow: [BoxShadow(color: AppColors.secondaryContainer.withValues(alpha: 0.05), blurRadius: 100, spreadRadius: 60)],
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                _buildHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    child: Column(
                      children: [
                        const SizedBox(height: 32),
                        _buildCelebrationVisual(),
                        const SizedBox(height: 24),
                        _buildSuccessMessage(),
                        const SizedBox(height: 48),
                        _buildSummaryCard(),
                        const SizedBox(height: 48),
                        _buildQuickActions(),
                        const SizedBox(height: 120), // Bottom nav space
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildFloatingFooter(context),
      extendBody: true,
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'STEP 5 OF 5',
            style: AppTextStyles.labelSmall.copyWith(
              color: AppColors.onSurfaceVariant,
              fontFamily: 'Plus Jakarta Sans',
              letterSpacing: 2.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < 5; i++) ...[
                Container(
                  width: 24,
                  height: 6,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [AppColors.primaryContainer, AppColors.secondaryContainer]),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                if (i < 4) const SizedBox(width: 4),
              ]
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCelebrationVisual() {
    return Center(
      child: SizedBox(
        width: 140,
        height: 140,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Ambient glow
            Transform.scale(
              scale: 1.5,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.tertiary.withValues(alpha: 0.2),
                  boxShadow: [BoxShadow(color: AppColors.tertiary.withValues(alpha: 0.4), blurRadius: 60)],
                ),
              ),
            ),
            // Checkmark Circle
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerHigh,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.tertiary.withValues(alpha: 0.3), width: 1.5),
              ),
              child: const Center(
                child: Icon(Icons.check_circle_rounded, color: AppColors.tertiary, size: 72),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessMessage() {
    return Column(
      children: [
        Text(
          "You're all set!",
          style: AppTextStyles.displayMedium.copyWith(fontSize: 32, height: 1.2),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Your property workspace is ready.',
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.onSurfaceVariant, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(colors: [AppColors.primaryContainer, AppColors.secondaryContainer]),
              ),
              child: BackdropFilter(
                filter: ColorFilter.mode(AppColors.background.withValues(alpha: 0.85), BlendMode.srcOver),
                child: Container(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                _buildSummaryRow('Buildings added', '02'),
                _buildDivider(),
                _buildSummaryRow('Rooms added', '18'),
                _buildDivider(),
                _buildSummaryRow('Electricity rate', '₹8.50/unit', hasOrb: true, isCurrency: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool hasOrb = false, bool isCurrency = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.onSurfaceVariant)),
          Row(
            children: [
              if (hasOrb) ...[
                Container(
                  width: 8, height: 8,
                  decoration: BoxDecoration(
                    color: AppColors.tertiary,
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: AppColors.tertiary.withValues(alpha: 0.6), blurRadius: 8)],
                  ),
                ),
                const SizedBox(width: 8),
              ],
              Text(
                value,
                style: TextStyle(
                  fontFamily: isCurrency ? 'JetBrains Mono' : 'JetBrains Mono', // Both use mono
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isCurrency ? AppColors.onSurface : AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Divider(color: AppColors.outlineVariant.withValues(alpha: 0.1), height: 1),
    );
  }

  Widget _buildQuickActions() {
    return SizedBox(
      height: 140,
      child: ListView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        children: [
          _buildActionCard(
            icon: Icons.person_add_rounded,
            title: 'Add tenant',
            iconColor: AppColors.primary,
            iconBgColor: AppColors.primary.withValues(alpha: 0.1),
          ),
          const SizedBox(width: 16),
          _buildActionCard(
            icon: Icons.bolt_rounded,
            title: 'Enter readings',
            iconColor: AppColors.tertiary,
            iconBgColor: AppColors.tertiary.withValues(alpha: 0.1),
          ),
          const SizedBox(width: 16),
          _buildActionCard(
            icon: Icons.grid_view_rounded,
            title: 'View dashboard',
            iconColor: AppColors.secondary,
            iconBgColor: AppColors.secondaryContainer.withValues(alpha: 0.2),
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required String title,
    required Color iconColor,
    required Color iconBgColor,
  }) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(color: iconBgColor, borderRadius: BorderRadius.circular(16)),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const Spacer(),
          Text(title, style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.w600, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildFloatingFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.8),
      ),
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [AppColors.primaryContainer, AppColors.secondaryContainer]),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => context.go(kOwnerDashboardRoute),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Go to dashboard', style: AppTextStyles.headlineSmall.copyWith(color: AppColors.onPrimaryContainer, fontSize: 16)),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward_rounded, color: AppColors.onPrimaryContainer, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
