import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../widgets/mark_rent_paid_sheet.dart';

class RentCollectionScreen extends StatefulWidget {
  const RentCollectionScreen({super.key});

  @override
  State<RentCollectionScreen> createState() => _RentCollectionScreenState();
}

class _RentCollectionScreenState extends State<RentCollectionScreen> {
  String _selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // Standard Glass App Bar
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
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.primaryContainer,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'AM',
                      style: AppTextStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.onPrimaryContainer,
                      ),
                    ),
                  ),
                ),
                title: Text(
                  'Good morning, Alex',
                  style: AppTextStyles.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.onSurface,
                  ),
                ),
                centerTitle: false,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none_rounded,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),

              // Title & Month Selector
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Rent',
                        style: AppTextStyles.headlineLarge.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainerHigh,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.chevron_left_rounded, color: AppColors.outline),
                            const SizedBox(width: 8),
                            Text(
                              'March 2025',
                              style: AppTextStyles.titleMedium.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.chevron_right_rounded, color: AppColors.outline),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              // Summary Strip (Horizontal List)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 32.0, bottom: 24.0),
                  child: SizedBox(
                    height: 80,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      children: [
                        _buildSummaryCard(
                          label: 'Paid 38',
                          amount: '₹1,14,000',
                          color: AppColors.tertiary,
                        ),
                        const SizedBox(width: 12),
                        _buildSummaryCard(
                          label: 'Pending 8',
                          amount: '₹24,000',
                          color: AppColors.secondary,
                        ),
                        const SizedBox(width: 12),
                        _buildSummaryCard(
                          label: 'Overdue 4',
                          amount: '₹12,000',
                          color: AppColors.error,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Filter Chips
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                  child: Row(
                    children: [
                      _buildFilterChip('All'),
                      _buildFilterChip('Paid'),
                      _buildFilterChip('Pending'),
                      _buildFilterChip('Overdue'),
                    ],
                  ),
                ),
              ),

              // Property Group 1
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPropertyGroupHeader('Sunrise Residency'),
                      const SizedBox(height: 16),
                      _buildTenantRow(
                        avatar: 'RK',
                        name: 'Rajesh Kumar',
                        unit: 'Room 402',
                        building: 'Sunrise Residency',
                        amount: '12,500',
                        status: 'Overdue',
                      ),
                      const SizedBox(height: 12),
                      _buildTenantRow(
                        avatar: 'AS',
                        name: 'Ananya Singh',
                        unit: 'Room 105',
                        building: 'Sunrise Residency',
                        amount: '15,000',
                        status: 'Paid',
                      ),
                    ],
                  ),
                ),
              ),

              // Property Group 2
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPropertyGroupHeader('Krishna Tower'),
                      const SizedBox(height: 16),
                      _buildTenantRow(
                        avatar: 'VM',
                        name: 'Vikram Mehta',
                        unit: 'Unit 12B',
                        building: 'Krishna Tower',
                        amount: '22,000',
                        status: 'Pending',
                      ),
                    ],
                  ),
                ),
              ),

              // Swiping Hint
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Opacity(
                    opacity: 0.4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            MarkRentPaidSheet.show(
                              context,
                              tenantName: 'Rajesh Kumar',
                              roomInfo: 'Room 402 · Sunrise Residency',
                              amount: '12500',
                              isOverdue: true,
                            );
                          },
                          child: Row(
                            children: [
                              const Icon(Icons.keyboard_double_arrow_right_rounded, color: AppColors.tertiary, size: 16),
                              const SizedBox(width: 8),
                              Text(
                                'MARK PAID',
                                style: AppTextStyles.labelSmall.copyWith(
                                  color: AppColors.tertiary,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.0,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 32),
                        Row(
                          children: [
                            Text(
                              'REMIND',
                              style: AppTextStyles.labelSmall.copyWith(
                                color: AppColors.secondary,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0,
                                fontSize: 10,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.keyboard_double_arrow_left_rounded, color: AppColors.secondary, size: 16),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 160)), // large bottom padding for FAB
            ],
          ),

          // Floating Action Button
          Positioned(
            bottom: 112, // Above the navigation bar
            right: 24,
            child: InkWell(
              onTap: () {
                MarkRentPaidSheet.show(
                  context,
                  tenantName: 'Ananya Singh',
                  roomInfo: 'Room 105 · Sunrise Residency',
                  amount: '15000',
                  isOverdue: false,
                );
              },
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: 180,
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryContainer.withValues(alpha: 0.3),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    )
                  ],
                  gradient: const LinearGradient(
                    colors: [AppColors.primaryContainer, AppColors.secondaryContainer],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.add_rounded, color: AppColors.onPrimaryContainer),
                    const SizedBox(width: 8),
                    Text(
                      'Record payment',
                      style: AppTextStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.onPrimaryContainer,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard({required String label, required String amount, required Color color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        border: Border.all(color: color.withValues(alpha: 0.2)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.8),
                  blurRadius: 8,
                )
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label.toUpperCase(),
                style: AppTextStyles.labelSmall.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: color.withValues(alpha: 0.8),
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                amount,
                style: AppTextStyles.titleMedium.copyWith(
                  fontFamily: 'JetBrains Mono',
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    final bool isSelected = _selectedFilter == label;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedFilter = label;
          });
        },
        borderRadius: BorderRadius.circular(24),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : AppColors.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Text(
            label,
            style: AppTextStyles.titleSmall.copyWith(
              fontWeight: FontWeight.bold,
              color: isSelected ? AppColors.onPrimaryContainer : AppColors.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPropertyGroupHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.titleLarge.copyWith(fontWeight: FontWeight.bold),
        ),
        const Icon(Icons.expand_more_rounded, color: AppColors.outline),
      ],
    );
  }

  Widget _buildTenantRow({
    required String avatar,
    required String name,
    required String unit,
    required String building,
    required String amount,
    required String status,
  }) {
    Color statusColor;
    if (status == 'Overdue') {
      statusColor = AppColors.error;
    } else if (status == 'Paid') {
      statusColor = AppColors.tertiary;
    } else {
      statusColor = AppColors.secondary;
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: status == 'Overdue'
            ? const Border(left: BorderSide(color: AppColors.error, width: 4))
            : null,
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: AppColors.surfaceContainerHighest,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    avatar,
                    style: AppTextStyles.titleMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      color: statusColor,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '$unit • $building',
                        style: AppTextStyles.labelMedium.copyWith(
                          color: AppColors.onSurfaceVariant,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '₹$amount',
                      style: AppTextStyles.titleLarge.copyWith(
                        fontFamily: 'JetBrains Mono',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: statusColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            status.toUpperCase(),
                            style: AppTextStyles.labelSmall.copyWith(
                              color: statusColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
