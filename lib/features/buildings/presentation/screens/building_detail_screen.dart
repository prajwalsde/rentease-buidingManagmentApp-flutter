import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/route_constants.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class BuildingDetailScreen extends StatelessWidget {
  const BuildingDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: SizedBox(
                      height: MediaQuery.of(context).padding.top + 80)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      _buildHeaderCard(),
                      const SizedBox(height: 24),
                      _buildFilterChips(),
                      const SizedBox(height: 16),
                      _buildRoomGrid(context),
                      const SizedBox(height: 120), // Bottom nav / FAB spacing
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Top Navigation Bar
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
          padding: EdgeInsets.fromLTRB(
              16, MediaQuery.of(context).padding.top + 16, 16, 16),
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
                      color: AppColors.surfaceContainerHigh,
                      shape: BoxShape.circle,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () => context.pop(),
                        child: const Icon(Icons.arrow_back_rounded,
                            color: AppColors.onSurface),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Sunrise Residency',
                    style: AppTextStyles.headlineSmall.copyWith(fontSize: 18),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit_rounded,
                        color: AppColors.onSurfaceVariant),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert_rounded,
                        color: AppColors.onSurfaceVariant),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Gradient Circle Decoration (Top Right)
          Positioned(
            top: -40,
            right: -40,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withValues(alpha: 0.1),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      blurRadius: 40),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                'RESIDENTIAL',
                                style: AppTextStyles.labelSmall.copyWith(
                                    color: AppColors.primary,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.0),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.surfaceContainerHighest,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                '3 FLOORS',
                                style: AppTextStyles.labelSmall.copyWith(
                                    color: AppColors.onSurfaceVariant,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.0),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text('124, Skyline Avenue, Sector 4',
                            style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.onSurfaceVariant,
                                fontSize: 14)),
                        const SizedBox(height: 2),
                        const Text('Indore, MP',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: AppColors.onSurface)),
                      ],
                    ),
                  ),

                  // Occupancy Donut
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 70,
                          height: 70,
                          child: CircularProgressIndicator(
                            value: 1.0,
                            strokeWidth: 6,
                            color: AppColors.surfaceContainerHighest,
                          ),
                        ),
                        SizedBox(
                          width: 70,
                          height: 70,
                          child: CircularProgressIndicator(
                            value: 0.78,
                            strokeWidth: 6,
                            strokeCap: StrokeCap.round,
                            color: AppColors.primary,
                          ),
                        ),
                        Center(
                          child: Text('78%',
                              style: TextStyle(
                                  fontFamily: 'JetBrains Mono',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.onSurface)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Divider(
                  color: AppColors.outlineVariant, height: 1, thickness: 0.5),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('MONTHLY COLLECTION',
                          style: AppTextStyles.labelSmall.copyWith(
                              color: AppColors.onSurfaceVariant,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0)),
                      const SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(fontFamily: 'JetBrains Mono'),
                          children: [
                            TextSpan(
                                text: '₹42k ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: AppColors.onSurface)),
                            TextSpan(
                                text: '/ ₹54k',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.onSurfaceVariant)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: AppColors.tertiary,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color:
                                    AppColors.tertiary.withValues(alpha: 0.5),
                                blurRadius: 8)
                          ],
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text('HEALTHY',
                          style: AppTextStyles.labelSmall.copyWith(
                              color: AppColors.tertiary,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0)),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4))
              ],
            ),
            child: Text('All',
                style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.onPrimaryContainer,
                    fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text('Occupied',
                style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.onSurfaceVariant,
                    fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text('Vacant',
                style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.onSurfaceVariant,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildRoomGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 0.85,
      children: [
        // 101 - Occupied
        _buildRoomCard(
          context,
          roomNo: '101',
          isOccupied: true,
          tenantName: 'Ramesh Kumar',
          initials: 'RK',
          initialsColorBg: AppColors.secondaryContainer,
          initialsColorText: AppColors.onSecondaryContainer,
          status: 'PAID',
          statusColor: AppColors.tertiary,
          amount: '₹8,500',
        ),
        // 102 - Occupied
        _buildRoomCard(
          context,
          roomNo: '102',
          isOccupied: true,
          tenantName: 'Anita Singh',
          initials: 'AS',
          initialsColorBg: AppColors.primaryContainer,
          initialsColorText: AppColors.onPrimaryContainer,
          status: 'OVERDUE',
          statusColor: AppColors.error,
          amount: '₹9,200',
        ),
        // 103 - Vacant
        _buildRoomCard(context, roomNo: '103', isOccupied: false),
        // 201 - Occupied
        _buildRoomCard(
          context,
          roomNo: '201',
          isOccupied: true,
          tenantName: 'Suresh Raina',
          initials: 'SR',
          initialsColorBg: AppColors.surfaceContainerHighest,
          initialsColorText: AppColors.onSurfaceVariant,
          status: 'PAID',
          statusColor: AppColors.tertiary,
          amount: '₹8,500',
        ),
        // 202 - Vacant
        _buildRoomCard(context, roomNo: '202', isOccupied: false),
        // 203 - Occupied
        _buildRoomCard(
          context,
          roomNo: '203',
          isOccupied: true,
          tenantName: 'Vikram Seth',
          initials: 'VS',
          initialsColorBg: AppColors.secondaryContainer,
          initialsColorText: AppColors.onSecondaryContainer,
          status: 'PAID',
          statusColor: AppColors.tertiary,
          amount: '₹12,000',
        ),
      ],
    );
  }

  Widget _buildRoomCard(
    BuildContext context, {
    required String roomNo,
    required bool isOccupied,
    String? tenantName,
    String? initials,
    Color? initialsColorBg,
    Color? initialsColorText,
    String? status,
    Color? statusColor,
    String? amount,
  }) {
    if (isOccupied) {
      return GestureDetector(
        onTap: () => context.push(kOwnerTenantProfileRoute),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(roomNo,
                            style: const TextStyle(
                                fontFamily: 'JetBrains Mono',
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: AppColors.onSurface)),
                        const SizedBox(height: 2),
                        Text(tenantName!,
                            style: AppTextStyles.bodyMedium.copyWith(
                                fontSize: 12,
                                color: AppColors.onSurfaceVariant),
                            overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: initialsColorBg,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.background, width: 2),
                    ),
                    child: Center(
                      child: Text(initials!,
                          style: AppTextStyles.labelSmall.copyWith(
                              color: initialsColorText,
                              fontWeight: FontWeight.bold,
                              fontSize: 13)),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                              color: statusColor, shape: BoxShape.circle)),
                      const SizedBox(width: 6),
                      Text(status!,
                          style: TextStyle(
                              fontFamily: 'JetBrains Mono',
                              color: statusColor,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(amount!,
                      style: const TextStyle(
                          fontFamily: 'JetBrains Mono',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColors.primary)),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      // Vacant State
      return GestureDetector(
        onTap: () => context.push(kAddTenantRoute),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
                color: AppColors.outlineVariant.withValues(alpha: 0.1)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(roomNo,
                      style: const TextStyle(
                          fontFamily: 'JetBrains Mono',
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: AppColors.onSurfaceVariant)),
                  const SizedBox(height: 2),
                  const Text('Vacant',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 12,
                          color: AppColors.outline)),
                ],
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: AppColors.outlineVariant.withValues(alpha: 0.3)),
                ),
                child: Center(
                  child: Text(
                    'ASSIGN TENANT',
                    style: AppTextStyles.labelSmall.copyWith(
                        color: AppColors.onSurfaceVariant,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _buildFAB(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          bottom:
              90), // Just above the nav bar area even if it's rendered by the router
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [AppColors.primaryContainer, AppColors.secondaryContainer],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF508FF8).withValues(alpha: 0.4),
            blurRadius: 30,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => context.push(kAddTenantRoute),
          child: const Center(
            child: Icon(Icons.add_rounded,
                color: AppColors.onPrimaryContainer, size: 28),
          ),
        ),
      ),
    );
  }
}
