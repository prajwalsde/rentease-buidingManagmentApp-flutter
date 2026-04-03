import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/route_constants.dart';
import '../../core/theme/app_colors.dart';
import 'glass_container.dart';

class ScaffoldWithTenantNavBar extends StatelessWidget {
  final Widget child;

  const ScaffoldWithTenantNavBar({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Stack(
        children: [
          Positioned.fill(child: child),
          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: _buildGlassNavBar(context),
          ),
        ],
      ),
    );
  }

  Widget _buildGlassNavBar(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    
    int getIndex() {
      if (location.startsWith(kTenantBillsRoute)) return 1;
      if (location.startsWith(kTenantProfileRoute)) return 2;
      return 0; // Home
    }

    final currentIndex = getIndex();

    void onTab(int index) {
      if (index == currentIndex) return;
      switch (index) {
        case 0:
          context.go(kTenantHomeRoute);
          break;
        case 1:
          context.go(kTenantBillsRoute);
          break;
        case 2:
          context.go(kTenantProfileRoute);
          break;
      }
    }

    return GlassContainer(
      blurRadius: 24,
      opacity: 0.6,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      borderRadius: BorderRadius.circular(32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _NavItem(icon: Icons.home_rounded, label: 'Home', isActive: currentIndex == 0, onTap: () => onTab(0)),
          _NavItem(icon: Icons.receipt_long_rounded, label: 'Bills', isActive: currentIndex == 1, onTap: () => onTab(1)),
          _NavItem(icon: Icons.person_rounded, label: 'Profile', isActive: currentIndex == 2, onTap: () => onTab(2)),
        ],
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
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primaryContainer : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive ? AppColors.onPrimaryContainer : AppColors.onSurfaceVariant,
              size: 24,
            ),
            if (isActive) ...[
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: AppColors.onPrimaryContainer,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
