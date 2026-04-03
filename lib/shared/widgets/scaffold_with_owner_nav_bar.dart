import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/route_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class ScaffoldWithOwnerNavBar extends StatelessWidget {
  final Widget child;

  const ScaffoldWithOwnerNavBar({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned.fill(child: child),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildGlassNavBar(context),
          ),
        ],
      ),
      extendBody: true, // Allow content to flow under the translucent nav bar
    );
  }

  Widget _buildGlassNavBar(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    int getIndex() {
      if (location.startsWith(kBuildingsRoute)) return 1;
      if (location.startsWith(kRentRoute)) return 2;
      if (location.startsWith(kElectricityRoute)) return 3;
      if (location.startsWith(kReportsRoute)) return 4;
      if (location == kOwnerDashboardRoute) return 0;
      return -1; // No tab highlighted for settings or tenants profile
    }

    final currentIndex = getIndex();

    void onTab(int index) {
      if (index == currentIndex) return;
      switch (index) {
        case 0:
          context.go(kOwnerDashboardRoute);
          break;
        case 1:
          context.go(kBuildingsRoute);
          break;
        case 2:
          context.go(kRentRoute);
          break;
        case 3:
          context.go(kElectricityRoute);
          break;
        case 4:
          context.go(kReportsRoute);
          break;
      }
    }

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.background.withValues(alpha: 0.6),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.12),
                blurRadius: 30,
                offset: const Offset(0, -8),
              ),
            ],
          ),
          padding: EdgeInsets.fromLTRB(16, 12, 16, MediaQuery.of(context).padding.bottom + 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavItem(icon: Icons.dashboard_rounded, label: 'Home', isActive: currentIndex == 0, onTap: () => onTab(0)),
              _NavItem(icon: Icons.domain_rounded, label: 'Buildings', isActive: currentIndex == 1, onTap: () => onTab(1)),
              _NavItem(icon: Icons.payments_rounded, label: 'Rent', isActive: currentIndex == 2, onTap: () => onTab(2)),
              _NavItem(icon: Icons.bolt_rounded, label: 'Electricity', isActive: currentIndex == 3, onTap: () => onTab(3)),
              _NavItem(icon: Icons.analytics_rounded, label: 'Reports', isActive: currentIndex == 4, onTap: () => onTab(4)),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? const Color(0xFF4F8EF7) : AppColors.onSurfaceVariant.withValues(alpha: 0.7),
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label.toUpperCase(),
            style: AppTextStyles.labelSmall.copyWith(
              color: isActive ? const Color(0xFF4F8EF7) : AppColors.onSurfaceVariant.withValues(alpha: 0.7),
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 10,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.0,
            ),
          ),
          if (isActive) ...[
            const SizedBox(height: 2),
            const Text(
              '•',
              style: TextStyle(
                color: Color(0xFF4F8EF7),
                fontSize: 12,
                fontWeight: FontWeight.w900,
              ),
            ),
          ] else ...[
            const SizedBox(height: 14), // Maintain height when dot is absent
          ]
        ],
      ),
    );
  }
}
