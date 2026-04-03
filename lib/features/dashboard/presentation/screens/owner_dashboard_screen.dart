import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/route_constants.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class OwnerDashboardScreen extends StatelessWidget {
  const OwnerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Content
          CustomScrollView(
            slivers: [
              // Use SliverToBoxAdapter for padding to ensure content goes under AppBar
              SliverToBoxAdapter(child: SizedBox(height: MediaQuery.of(context).padding.top + 80)),
              
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      _buildResumeBanner(),
                      const SizedBox(height: 32),
                      _buildSummaryMetricCards(),
                      const SizedBox(height: 32),
                      _buildYourBuildingsSection(context),
                      const SizedBox(height: 32),
                      _buildRecentActivitySection(),
                      const SizedBox(height: 120), // BottomNav padding
                    ],
                  ),
                ),
              ),
            ],
          ),
          
          // Fixed Top App Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _buildTopAppBar(context),
          ),
        ],
      ),
      floatingActionButton: _buildFAB(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildTopAppBar(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: Container(
          padding: EdgeInsets.fromLTRB(24, MediaQuery.of(context).padding.top + 16, 24, 16),
          color: AppColors.background.withValues(alpha: 0.6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () => context.push(kOwnerSettingsRoute),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryContainer,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          'AM',
                          style: AppTextStyles.headlineSmall.copyWith(
                            color: AppColors.onPrimaryContainer,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Good morning, Aditya Mehta 👋',
                    style: AppTextStyles.headlineSmall.copyWith(fontSize: 16),
                  ),
                ],
              ),
              Stack(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_rounded, color: AppColors.outline),
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.error,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResumeBanner() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [AppColors.primaryContainer, AppColors.secondaryContainer],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Decorative glow element
          Positioned(
            right: -40,
            bottom: -40,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.1),
                boxShadow: [
                  BoxShadow(color: Colors.white.withValues(alpha: 0.1), blurRadius: 40),
                ],
              ),
            ),
          ),
          // Content
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ONBOARDING',
                      style: AppTextStyles.labelSmall.copyWith(
                        color: AppColors.onPrimaryContainer.withValues(alpha: 0.8),
                        letterSpacing: 2,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Complete your setup — 2 steps remaining',
                      style: AppTextStyles.headlineSmall.copyWith(
                        color: AppColors.onPrimaryContainer,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.onPrimaryContainer,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  elevation: 0,
                ),
                child: const Text('Resume', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSummaryMetricCards() {
    return SizedBox(
      height: 120, // explicitly sizing the height for the horizontal ListView
      child: ListView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        children: [
          // Card 1
          Container(
            width: 180,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total collected', style: AppTextStyles.bodyMedium.copyWith(color: AppColors.onSurfaceVariant, fontSize: 12, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 4),
                    const Text('₹1,14,000', style: TextStyle(fontFamily: 'JetBrains Mono', fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.tertiary)),
                  ],
                ),
                Text('MARCH 2025', style: AppTextStyles.labelSmall.copyWith(color: AppColors.onSurfaceVariant.withValues(alpha: 0.6), fontSize: 10, letterSpacing: 2.0, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Card 2
          Container(
            width: 180,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pending', style: AppTextStyles.bodyMedium.copyWith(color: AppColors.onSurfaceVariant, fontSize: 12, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 4),
                    const Text('₹24,000', style: TextStyle(fontFamily: 'JetBrains Mono', fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFFFFB300))),
                  ],
                ),
                Row(
                  children: [
                    Container(width: 6, height: 6, decoration: BoxDecoration(shape: BoxShape.circle, color: const Color(0xFFFFB300), boxShadow: [BoxShadow(color: const Color(0xFFFFB300).withValues(alpha: 0.5), blurRadius: 8)])),
                    const SizedBox(width: 6),
                    Text('8 TENANTS', style: AppTextStyles.labelSmall.copyWith(color: AppColors.onSurfaceVariant.withValues(alpha: 0.6), fontSize: 10, letterSpacing: 2.0, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Card 3
          Container(
            width: 180,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(24),
              border: const Border(left: BorderSide(color: AppColors.error, width: 4)), // Adjusting error/20 as solid left border
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Overdue', style: AppTextStyles.bodyMedium.copyWith(color: AppColors.onSurfaceVariant, fontSize: 12, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 4),
                    const Text('₹12,000', style: TextStyle(fontFamily: 'JetBrains Mono', fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.error)),
                  ],
                ),
                Row(
                  children: [
                    Container(width: 6, height: 6, decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.error, boxShadow: [BoxShadow(color: AppColors.error.withValues(alpha: 0.5), blurRadius: 8)])),
                    const SizedBox(width: 6),
                    Text('4 TENANTS', style: AppTextStyles.labelSmall.copyWith(color: AppColors.onSurfaceVariant.withValues(alpha: 0.6), fontSize: 10, letterSpacing: 2.0, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildYourBuildingsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('Your buildings', style: AppTextStyles.headlineSmall.copyWith(fontSize: 20)),
            GestureDetector(
              onTap: () => context.go(kBuildingsRoute),
              child: Text('Manage', style: AppTextStyles.titleSmall.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(32),
          ),
          child: InkWell(
            onTap: () => context.push(kBuildingDetailRoute),
            borderRadius: BorderRadius.circular(32),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: AppColors.surfaceVariant,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(Icons.domain_rounded, color: AppColors.primary, size: 32),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Sunrise Residency', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.onSurface)),
                          const SizedBox(height: 2),
                          Text('Hitech City, Hyderabad', style: AppTextStyles.bodyMedium.copyWith(color: AppColors.onSurfaceVariant, fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                  const Icon(Icons.chevron_right_rounded, color: AppColors.outline),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Occupancy', style: AppTextStyles.labelSmall.copyWith(color: AppColors.onSurfaceVariant, fontSize: 12)),
                            const Text('14/18 rooms', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.onSurface)),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Container(
                          height: 8,
                          width: double.infinity,
                          decoration: BoxDecoration(color: AppColors.surfaceVariant, borderRadius: BorderRadius.circular(4)),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: 0.77,
                            child: Container(decoration: BoxDecoration(color: AppColors.primaryContainer, borderRadius: BorderRadius.circular(4))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 32),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Collection', style: AppTextStyles.labelSmall.copyWith(color: AppColors.onSurfaceVariant, fontSize: 12)),
                            const Text('₹42k/₹54k', style: TextStyle(fontFamily: 'JetBrains Mono', fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.tertiary)),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Container(
                          height: 8,
                          width: double.infinity,
                          decoration: BoxDecoration(color: AppColors.surfaceVariant, borderRadius: BorderRadius.circular(4)),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: 0.78,
                            child: Container(decoration: BoxDecoration(color: AppColors.tertiary, borderRadius: BorderRadius.circular(4))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
        ),
      ],
    );
  }

  Widget _buildRecentActivitySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recent activity', style: AppTextStyles.headlineSmall.copyWith(fontSize: 20)),
        const SizedBox(height: 8),
        _buildTransactionRow(initials: 'RK', name: 'Rohan Kapoor', room: 'Room 102', amount: '₹12,500', status: 'PAID', time: '2h ago', statusColor: AppColors.tertiary),
        _buildTransactionRow(initials: 'AS', name: 'Ananya Singh', room: 'Room 304', amount: '₹15,000', status: 'PAID', time: '5h ago', statusColor: AppColors.secondary), // Stitch HTML used secondary color here for icon but tertiary for text. Let's stick to spec.
        _buildTransactionRow(initials: 'VP', name: 'Vikram Patel', room: 'Room 201', amount: '₹10,000', status: 'PENDING', time: '1d ago', statusColor: const Color(0xFFFFB300), iconColor: AppColors.error), // Matching HTML spec for colors visually.
        _buildTransactionRow(initials: 'MJ', name: 'Meera Joshi', room: 'Room 405', amount: '₹18,000', status: 'PAID', time: '1d ago', statusColor: AppColors.tertiary, iconColor: AppColors.primary),
        _buildTransactionRow(initials: 'SM', name: 'Siddharth Malhotra', room: 'Room 105', amount: '₹12,500', status: 'PAID', time: '2d ago', statusColor: AppColors.tertiary, iconColor: AppColors.onSurfaceVariant),
        _buildTransactionRow(initials: 'AK', name: 'Arjun Khanna', room: 'Room 502', amount: '₹14,000', status: 'OVERDUE', time: '3d ago', statusColor: AppColors.error),
        _buildTransactionRow(initials: 'TN', name: 'Tara Nair', room: 'Room 205', amount: '₹11,000', status: 'PAID', time: '4d ago', statusColor: AppColors.tertiary),
        _buildTransactionRow(initials: 'PK', name: 'Pooja Kulkarni', room: 'Room 301', amount: '₹13,500', status: 'PAID', time: '5d ago', statusColor: AppColors.tertiary, iconColor: AppColors.secondary),
      ],
    );
  }

  Widget _buildTransactionRow(
      {required String initials, required String name, required String room, required String amount, required String status, required String time, required Color statusColor, Color? iconColor}) {
        
    final Color actualIconColor = iconColor ?? statusColor;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
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
                    color: actualIconColor.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      initials,
                      style: AppTextStyles.labelSmall.copyWith(color: actualIconColor, fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: AppTextStyles.titleSmall.copyWith(fontSize: 14)),
                    const SizedBox(height: 2),
                    Text(room.toUpperCase(), style: AppTextStyles.labelSmall.copyWith(color: AppColors.onSurfaceVariant, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(amount, style: const TextStyle(fontFamily: 'JetBrains Mono', fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.onSurface)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(status, style: AppTextStyles.labelSmall.copyWith(color: statusColor, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
                    const SizedBox(width: 4),
                    Text('•', style: TextStyle(color: AppColors.onSurfaceVariant.withValues(alpha: 0.4), fontSize: 10)),
                    const SizedBox(width: 4),
                    Text(time, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.onSurfaceVariant.withValues(alpha: 0.6), fontSize: 10)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAB(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 90), // Above the BottomNavBar
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [AppColors.primaryContainer, AppColors.secondaryContainer],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => context.push(kAddTenantRoute),
          child: const Center(
            child: Icon(Icons.add_rounded, color: Colors.white, size: 32),
          ),
        ),
      ),
    );
  }
}
