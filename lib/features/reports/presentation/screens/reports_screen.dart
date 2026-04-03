import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  String _selectedTab = 'Rent';

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
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: Text(
                  'AM',
                  style: AppTextStyles.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            title: Text(
              'Good morning, Alex',
              style: AppTextStyles.titleMedium.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryContainer,
              ),
            ),
            centerTitle: false,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none_rounded,
                  color: AppColors.primaryContainer,
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),

          // Main Content
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reports',
                            style: AppTextStyles.headlineMedium.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Property performance and financial insights',
                            style: AppTextStyles.labelMedium.copyWith(color: AppColors.onSurfaceVariant),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Filters
                  Row(
                    children: [
                      _buildDropdownFilter('2024'),
                      const SizedBox(width: 12),
                      _buildDropdownFilter('September'),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // Tabs
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildTab('Rent'),
                        const SizedBox(width: 32),
                        _buildTab('Electricity'),
                        const SizedBox(width: 32),
                        _buildTab('Overview'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Donut Chart Card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 220,
                          height: 220,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Background Track
                              SizedBox(
                                width: 220,
                                height: 220,
                                child: CircularProgressIndicator(
                                  value: 1.0,
                                  strokeWidth: 16,
                                  color: AppColors.surfaceContainerHighest,
                                  strokeCap: StrokeCap.round,
                                ),
                              ),
                              // Segments
                              SizedBox(
                                width: 220,
                                height: 220,
                                child: CircularProgressIndicator(
                                  value: 0.75,
                                  strokeWidth: 16,
                                  color: AppColors.tertiary,
                                  strokeCap: StrokeCap.round,
                                ),
                              ),
                              SizedBox(
                                width: 220,
                                height: 220,
                                child: Transform.translate(
                                  offset: const Offset(0, 0),
                                  child: const CircularProgressIndicator(
                                    value: 0.15,
                                    strokeWidth: 16,
                                    color: AppColors.error,
                                  ),
                                ),
                              ),
                              // Inner Text
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'TOTAL COLLECTED',
                                    style: AppTextStyles.labelSmall.copyWith(
                                      color: AppColors.onSurfaceVariant,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5,
                                      fontSize: 10,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '₹1,14,000',
                                    style: AppTextStyles.headlineSmall.copyWith(
                                      fontFamily: 'JetBrains Mono',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildLegendItem('Paid', AppColors.tertiary),
                            _buildLegendItem('Pending', AppColors.error),
                            _buildLegendItem('Overdue', AppColors.errorContainer),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Trend Bar Chart Card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '6-Month Trend',
                              style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.surfaceContainerHigh,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: const BoxDecoration(
                                      color: AppColors.primaryContainer,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'COLLECTION IN LACS',
                                    style: AppTextStyles.labelSmall.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        SizedBox(
                          height: 180,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              _buildBar('APR', 0.6, false),
                              _buildBar('MAY', 0.75, false),
                              _buildBar('JUN', 0.45, false),
                              _buildBar('JUL', 0.85, false),
                              _buildBar('AUG', 0.7, false),
                              _buildBar('SEP', 0.95, true),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Transaction List
                  Container(
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Recent Payments',
                                style: AppTextStyles.titleLarge.copyWith(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: AppColors.surfaceContainerHigh,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.ios_share_rounded, size: 20),
                                  ),
                                  const SizedBox(width: 12),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [AppColors.primaryContainer, AppColors.secondaryContainer],
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.primaryContainer.withValues(alpha: 0.3),
                                          blurRadius: 12,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.picture_as_pdf_outlined, color: AppColors.onPrimaryContainer, size: 20),
                                        const SizedBox(width: 8),
                                        Text(
                                          'Export as PDF',
                                          style: AppTextStyles.labelLarge.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.onPrimaryContainer,
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
                        
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width),
                            child: DataTable(
                              headingTextStyle: AppTextStyles.labelSmall.copyWith(
                                color: AppColors.onSurfaceVariant,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                              ),
                              dataTextStyle: AppTextStyles.bodyMedium,
                              columnSpacing: 32,
                              horizontalMargin: 32,
                              dividerThickness: 0.2,
                              columns: const [
                                DataColumn(label: Text('TENANT')),
                                DataColumn(label: Text('UNIT')),
                                DataColumn(label: Text('AMOUNT')),
                                DataColumn(label: Text('STATUS')),
                                DataColumn(label: Text('PAID DATE')),
                              ],
                              rows: [
                                _buildDataRow('RK', 'Rahul Kapoor', 'B-402', '₹24,500', 'Paid', '05 SEP'),
                                _buildDataRow('PS', 'Priya Sharma', 'A-101', '₹18,000', 'Paid', '08 SEP'),
                                _buildDataRow('AM', 'Arjun Mehta', 'C-205', '₹32,000', 'Pending', '—'),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100), // Spacing for bottom nav bar
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownFilter(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.expand_more_rounded, size: 20, color: AppColors.outline),
        ],
      ),
    );
  }

  Widget _buildTab(String label) {
    final bool isSelected = _selectedTab == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = label;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: AppTextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
              color: isSelected ? AppColors.primary : AppColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: isSelected ? label.length * 8.0 : 0,
            height: 3,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(1.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.5),
                blurRadius: 8,
              )
            ],
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: AppTextStyles.labelMedium.copyWith(color: AppColors.onSurfaceVariant),
        ),
      ],
    );
  }

  Widget _buildBar(String label, double fillPct, bool isHighlighted) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 40,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                gradient: isHighlighted
                    ? const LinearGradient(
                        colors: [AppColors.primaryContainer, AppColors.secondaryContainer],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                    : null,
                color: isHighlighted ? null : AppColors.surfaceContainerHighest,
                boxShadow: isHighlighted
                    ? [
                        BoxShadow(
                          color: AppColors.primaryContainer.withValues(alpha: 0.3),
                          blurRadius: 20,
                        )
                      ]
                    : null,
              ),
              child: FractionallySizedBox(
                heightFactor: fillPct,
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                    color: isHighlighted ? null : AppColors.surfaceContainerHighest,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          label,
          style: AppTextStyles.labelSmall.copyWith(
            fontFamily: 'JetBrains Mono',
            color: isHighlighted ? AppColors.primary : AppColors.onSurfaceVariant,
            fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  DataRow _buildDataRow(String avatar, String name, String unit, String amount, String status, String date) {
    Color statusColor = status == 'Paid' ? AppColors.tertiary : AppColors.error;
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  avatar,
                  style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                name,
                style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              unit,
              style: AppTextStyles.labelMedium.copyWith(fontFamily: 'JetBrains Mono'),
            ),
          ),
        ),
        DataCell(
          Text(
            amount,
            style: AppTextStyles.titleMedium.copyWith(
              fontFamily: 'JetBrains Mono',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        DataCell(
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: statusColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: statusColor.withValues(alpha: 0.5), blurRadius: 8),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                status,
                style: AppTextStyles.labelMedium.copyWith(color: statusColor, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        DataCell(
          Text(
            date,
            style: AppTextStyles.labelMedium.copyWith(
              fontFamily: 'JetBrains Mono',
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}
