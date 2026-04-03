import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/route_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class Step3AddRoomsScreen extends StatefulWidget {
  const Step3AddRoomsScreen({super.key});

  @override
  State<Step3AddRoomsScreen> createState() => _Step3AddRoomsScreenState();
}

class _Step3AddRoomsScreenState extends State<Step3AddRoomsScreen> {
  int selectedTab = 0;
  bool markAsOccupied = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  children: [
                    _buildIllustrationSection(),
                    _buildTitleSection(),
                    const SizedBox(height: 32),
                    _buildBuildingTabs(),
                    const SizedBox(height: 32),
                    _buildAddRoomCard(),
                    const SizedBox(height: 32),
                    _buildAddedRoomsSection(),
                    const SizedBox(height: 32),
                    _buildBulkHint(),
                    const SizedBox(height: 16),
                    _buildSkipAction(),
                    const SizedBox(height: 140), // Space for bottom floating nav
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildFloatingFooter(context),
      extendBody: true, // Let the scroll view go behind the floating footer
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'STEP 3 OF 5',
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
              _buildProgressPill(isActive: true),
              const SizedBox(width: 4),
              _buildProgressPill(isActive: true),
              const SizedBox(width: 4),
              _buildProgressPill(isActive: true),
              const SizedBox(width: 4),
              _buildProgressPill(isActive: false),
              const SizedBox(width: 4),
              _buildProgressPill(isActive: false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressPill({required bool isActive}) {
    return Container(
      width: 24,
      height: 6,
      decoration: BoxDecoration(
        color: isActive ? null : AppColors.surfaceContainerHighest,
        gradient: isActive
            ? const LinearGradient(colors: [AppColors.primaryContainer, AppColors.secondaryContainer])
            : null,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  Widget _buildIllustrationSection() {
    return Container(
      width: double.infinity,
      height: 120,
      margin: const EdgeInsets.only(bottom: 24),
      child: Center(
        child: Opacity(
          opacity: 0.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildIconBox(Icons.meeting_room_rounded, false),
              const SizedBox(width: 12),
              _buildIconBox(Icons.bedroom_parent_rounded, true), // Primary box
              const SizedBox(width: 12),
              _buildIconBox(Icons.apartment_rounded, false),
              const SizedBox(width: 12),
              _buildIconBox(Icons.door_front_door_rounded, false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconBox(IconData icon, bool isPrimary) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: isPrimary ? AppColors.primary.withValues(alpha: 0.2) : AppColors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
        border: isPrimary ? Border.all(color: AppColors.primary.withValues(alpha: 0.1)) : null,
      ),
      child: Center(
        child: Icon(icon, color: isPrimary ? AppColors.primary : AppColors.outline, size: 28),
      ),
    );
  }

  Widget _buildTitleSection() {
    return Column(
      children: [
        Text(
          'Set up your rooms',
          style: AppTextStyles.displayMedium.copyWith(fontSize: 26, height: 1.2),
        ),
        const SizedBox(height: 8),
        Text(
          'Add rooms for each building you created',
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.onSurfaceVariant),
        ),
      ],
    );
  }

  Widget _buildBuildingTabs() {
    return SizedBox(
      height: 48,
      child: ListView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        children: [
          _buildTabButton('Skyline Heights', 0),
          const SizedBox(width: 12),
          _buildTabButton('Greenwood Villas', 1),
          const SizedBox(width: 12),
          _buildTabButton('Urban Loft B', 2),
        ],
      ),
    );
  }

  Widget _buildTabButton(String text, int index) {
    bool isSelected = selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => selectedTab = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryContainer : AppColors.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.labelLarge.copyWith(
              color: isSelected ? AppColors.onPrimaryContainer : AppColors.onSurfaceVariant,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddRoomCard() {
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
                filter: ColorFilter.mode(AppColors.background.withValues(alpha: 0.8), BlendMode.srcOver),
                child: Container(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.add_circle_rounded, color: AppColors.primary, size: 24),
                    const SizedBox(width: 8),
                    Text('Add New Room', style: AppTextStyles.headlineSmall.copyWith(fontSize: 20)),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(child: _buildFormField('Room No.', 'e.g. 402')),
                    const SizedBox(width: 16),
                    Expanded(child: _buildFormField('Floor', '4th Floor')),
                  ],
                ),
                const SizedBox(height: 16),
                _buildDropdownField('Room Type', '1BHK Premium'),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: _buildCurrencyField('Monthly Rent', '24,000')),
                    const SizedBox(width: 16),
                    Expanded(child: _buildCurrencyField('Security', '50,000')),
                  ],
                ),
                const SizedBox(height: 24),
                
                // Switch Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Mark as Occupied', style: AppTextStyles.titleSmall),
                        Text('Skip tenant onboarding for now', style: AppTextStyles.labelSmall.copyWith(color: AppColors.onSurfaceVariant)),
                      ],
                    ),
                    Switch(
                      value: markAsOccupied,
                      onChanged: (val) => setState(() => markAsOccupied = val),
                      activeColor: AppColors.onPrimaryContainer,
                      activeTrackColor: AppColors.primaryContainer,
                      inactiveTrackColor: AppColors.surfaceContainerHighest,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [AppColors.primaryContainer, AppColors.secondaryContainer]),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          'Save Room',
                          style: AppTextStyles.headlineSmall.copyWith(color: AppColors.onPrimaryContainer, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            label.toUpperCase(),
            style: const TextStyle(fontFamily: 'Plus Jakarta Sans', fontSize: 10, fontWeight: FontWeight.w800, color: AppColors.onSurfaceVariant, letterSpacing: 1.5),
          ),
        ),
        Container(
          height: 52,
          decoration: BoxDecoration(color: AppColors.surfaceContainerHighest, borderRadius: BorderRadius.circular(12)),
          child: TextField(
            style: AppTextStyles.bodyMedium,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.outline.withValues(alpha: 0.5)),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ),
      ],
    );
  }
  
  Widget _buildDropdownField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            label.toUpperCase(),
            style: const TextStyle(fontFamily: 'Plus Jakarta Sans', fontSize: 10, fontWeight: FontWeight.w800, color: AppColors.onSurfaceVariant, letterSpacing: 1.5),
          ),
        ),
        Container(
          height: 52,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(color: AppColors.surfaceContainerHighest, borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(hint, style: AppTextStyles.bodyMedium),
              const Icon(Icons.expand_more_rounded, color: AppColors.outlineVariant),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCurrencyField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            label.toUpperCase(),
            style: const TextStyle(fontFamily: 'Plus Jakarta Sans', fontSize: 10, fontWeight: FontWeight.w800, color: AppColors.onSurfaceVariant, letterSpacing: 1.5),
          ),
        ),
        Container(
          height: 52,
          decoration: BoxDecoration(color: AppColors.surfaceContainerHighest, borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16, right: 8),
                child: Text('₹', style: TextStyle(fontFamily: 'JetBrains Mono', color: AppColors.outline, fontSize: 16)),
              ),
              Expanded(
                child: TextField(
                  style: const TextStyle(fontFamily: 'JetBrains Mono', fontSize: 14),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: TextStyle(fontFamily: 'JetBrains Mono', color: AppColors.outline.withValues(alpha: 0.5), fontSize: 14),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(bottom: 2), // Align with ₹
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAddedRoomsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 4, height: 4, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)),
            const SizedBox(width: 8),
            Text(
              'ADDED ROOMS (2)',
              style: AppTextStyles.labelSmall.copyWith(fontFamily: 'Plus Jakarta Sans', letterSpacing: 2.0, color: AppColors.onSurfaceVariant, fontWeight: FontWeight.bold, fontSize: 10),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildRoomItemCard(unit: '101', type: '1BHK Studio', rent: '₹18,500', isOccupied: false),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildRoomItemCard(unit: '102', type: '1BHK Deluxe', rent: '₹22,000', isOccupied: true),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildRoomItemCard({required String unit, required String type, required String rent, required bool isOccupied}) {
    final statusColor = isOccupied ? AppColors.error : AppColors.tertiary;
    final statusBgColor = isOccupied ? AppColors.errorContainer : AppColors.tertiaryContainer;
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Unit', style: AppTextStyles.labelSmall.copyWith(color: AppColors.onSurfaceVariant, fontWeight: FontWeight.bold, fontSize: 10)),
                  const SizedBox(height: 4),
                  Text(unit, style: const TextStyle(fontFamily: 'JetBrains Mono', fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.primary)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusBgColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: statusBgColor.withValues(alpha: 0.1)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6, height: 6,
                      decoration: BoxDecoration(
                        color: statusColor, shape: BoxShape.circle,
                        boxShadow: [BoxShadow(color: statusColor.withValues(alpha: 0.5), blurRadius: 4)],
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      isOccupied ? 'OCCUPIED' : 'VACANT',
                      style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: statusColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(type, style: AppTextStyles.labelSmall.copyWith(color: AppColors.onSurfaceVariant, fontSize: 11)),
          const SizedBox(height: 2),
          Text(rent, style: const TextStyle(fontFamily: 'JetBrains Mono', fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.onSurface)),
        ],
      ),
    );
  }

  Widget _buildBulkHint() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow.withValues(alpha: 0.5),
        border: Border.all(color: AppColors.outlineVariant.withValues(alpha: 0.1)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info_outline_rounded, color: AppColors.primaryContainer, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: AppTextStyles.bodyMedium.copyWith(color: AppColors.onSurfaceVariant, fontSize: 13, height: 1.4),
                children: [
                  const TextSpan(text: 'Have many rooms? You can also '),
                  TextSpan(text: 'import via a template', style: TextStyle(color: AppColors.primaryFixedDim, fontWeight: FontWeight.bold)),
                  const TextSpan(text: ' after completing the basic setup.'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSkipAction() {
    return Center(
      child: TextButton(
        onPressed: () => context.go(kOnboardingStep4Route),
        child: Text(
          "I'll add rooms later",
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.onSurfaceVariant, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildFloatingFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 56,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [AppColors.primaryContainer, AppColors.secondaryContainer]),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(28),
                onTap: () => context.go(kOnboardingStep4Route),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Continue', style: AppTextStyles.headlineSmall.copyWith(color: AppColors.onPrimaryContainer, fontSize: 16)),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward_rounded, color: AppColors.onPrimaryContainer, size: 20),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () => context.pop(),
            child: Text('Back', style: AppTextStyles.labelLarge.copyWith(color: AppColors.onSurfaceVariant)),
          ),
        ],
      ),
    );
  }
}
