import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/route_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class BuildingsListScreen extends StatelessWidget {
  const BuildingsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: MediaQuery.of(context).padding.top + 80)),
              
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      _buildSearchBar(),
                      const SizedBox(height: 24),
                      _buildBuildingCard(
                        context: context,
                        name: 'Skyview Residency',
                        type: 'Residential',
                        location: '12th Avenue, High Street, Mumbai',
                        rooms: 18,
                        occupied: 14,
                        vacant: 4,
                        collected: '₹42,000',
                        total: '₹54,000',
                        progress: 0.77,
                        isCommercial: false,
                        hasVacantBadge: true,
                      ),
                      const SizedBox(height: 16),
                      _buildBuildingCard(
                        context: context,
                        name: 'Nexus Hub',
                        type: 'Commercial',
                        location: 'Tech Park North, Bangalore',
                        rooms: 42,
                        occupied: 42,
                        vacant: 0,
                        collected: '₹1,24,000',
                        total: '₹1,24,000',
                        progress: 1.0,
                        isCommercial: true,
                        hasVacantBadge: false,
                      ),
                      const SizedBox(height: 16),
                      _buildBuildingCard(
                        context: context,
                        name: 'Serene Heights',
                        type: 'Residential',
                        location: '7th Cross, Whitefield',
                        rooms: 24,
                        occupied: 12,
                        vacant: 12,
                        collected: '₹12,000',
                        total: '₹34,000',
                        progress: 0.35,
                        isCommercial: false,
                        hasVacantBadge: true,
                      ),
                      const SizedBox(height: 120), // Bottom nav space
                    ],
                  ),
                ),
              ),
            ],
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _buildTopAppBar(context),
          ),
        ],
      ),
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
                  Container(
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
                  const SizedBox(width: 12),
                  Text(
                    'Buildings',
                    style: AppTextStyles.headlineSmall.copyWith(fontSize: 18),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerHigh,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {},
                        child: const Icon(Icons.add_rounded, color: AppColors.primary),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_rounded, color: AppColors.outline),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.search_rounded, color: AppColors.outline),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              style: AppTextStyles.bodyMedium,
              decoration: InputDecoration(
                hintText: 'Search buildings...',
                hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.outline),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBuildingCard({
    required BuildContext context,
    required String name,
    required String type,
    required String location,
    required int rooms,
    required int occupied,
    required int vacant,
    required String collected,
    required String total,
    required double progress,
    required bool isCommercial,
    required bool hasVacantBadge,
  }) {
    final typeColor = isCommercial ? AppColors.primary : AppColors.secondary;
    final typeBg = isCommercial ? AppColors.primaryContainer : AppColors.secondaryContainer;

    return GestureDetector(
      onTap: () => context.push(kBuildingDetailRoute),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          children: [
            if (hasVacantBadge)
              Positioned(
                top: 0,
                right: 32,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Colors.orange.withValues(alpha: 0.6), blurRadius: 8)],
                  ),
                ),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(name, style: AppTextStyles.headlineSmall.copyWith(fontSize: 18)),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: typeBg.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  type.toUpperCase(),
                                  style: AppTextStyles.labelSmall.copyWith(color: typeColor, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.0),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.location_on_rounded, color: AppColors.onSurfaceVariant, size: 14),
                              const SizedBox(width: 4),
                              Text(location, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.onSurfaceVariant, fontSize: 13)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right_rounded, color: AppColors.outline),
                  ],
                ),
                const SizedBox(height: 24),
                // Stats Row
                Row(
                  children: [
                    _buildStatChip(value: rooms.toString(), label: 'Rooms', valueColor: AppColors.onSurface),
                    const SizedBox(width: 8),
                    _buildStatChip(value: occupied.toString(), label: 'Occupied', valueColor: AppColors.tertiary),
                    const SizedBox(width: 8),
                    _buildStatChip(value: vacant.toString(), label: 'Vacant', valueColor: vacant > 0 ? AppColors.error : AppColors.onSurfaceVariant),
                  ],
                ),
                const SizedBox(height: 24),
                // Collection Bar
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Collection status', style: AppTextStyles.bodyMedium.copyWith(color: AppColors.onSurfaceVariant, fontSize: 12)),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(fontFamily: 'JetBrains Mono', fontSize: 12),
                            children: [
                              TextSpan(text: collected, style: const TextStyle(color: AppColors.tertiary, fontWeight: FontWeight.bold)),
                              TextSpan(text: ' / $total', style: const TextStyle(color: AppColors.outline)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 6,
                      width: double.infinity,
                      decoration: BoxDecoration(color: AppColors.surfaceContainerHighest, borderRadius: BorderRadius.circular(3)),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: progress,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.tertiary,
                            borderRadius: BorderRadius.circular(3),
                            boxShadow: [BoxShadow(color: AppColors.tertiary.withValues(alpha: 0.3), blurRadius: 10)],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatChip({required String value, required String label, required Color valueColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.outlineVariant.withValues(alpha: 0.1)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(value, style: TextStyle(fontFamily: 'JetBrains Mono', fontWeight: FontWeight.bold, fontSize: 12, color: valueColor)),
          const SizedBox(width: 4),
          Text(label, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.onSurfaceVariant, fontSize: 12)),
        ],
      ),
    );
  }
}
