import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/route_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class Step2AddBuildingScreen extends StatefulWidget {
  const Step2AddBuildingScreen({super.key});

  @override
  State<Step2AddBuildingScreen> createState() => _Step2AddBuildingScreenState();
}

class _Step2AddBuildingScreenState extends State<Step2AddBuildingScreen> {
  int floors = 1;
  int rooms = 4;
  int selectedBuildingType = 0; // 0: Residential, 1: Commercial, 2: Mixed

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
                    const SizedBox(height: 32),
                    _buildFormFields(),
                    const SizedBox(height: 120), // Floating bottom nav space
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildFloatingFooter(context),
      extendBody: true,
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'STEP 2 OF 5',
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
              _buildProgressPill(isActive: false),
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
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Glow
              Transform.rotate(
                angle: 0.2,
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: AppColors.primaryContainer.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [BoxShadow(color: AppColors.primaryContainer.withValues(alpha: 0.2), blurRadius: 20)],
                  ),
                ),
              ),
              // Building Block
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.outlineVariant.withValues(alpha: 0.2)),
                  boxShadow: const [BoxShadow(color: Colors.black38, blurRadius: 30, offset: Offset(0, 10))],
                ),
                child: const Center(
                  child: Icon(Icons.domain_rounded, size: 48, color: AppColors.primary),
                ),
              ),
              // Floating badge
              Positioned(
                bottom: -8,
                right: -8,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryContainer,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                    boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))],
                  ),
                  child: const Center(
                    child: Icon(Icons.add_business_rounded, color: Colors.white, size: 24),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Add your first building',
          style: AppTextStyles.displayMedium.copyWith(fontSize: 27, height: 1.2),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'You can add more buildings anytime after setup',
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.onSurfaceVariant),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildFormFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildLabel('Building name'),
        const SizedBox(height: 8),
        _buildTextField('e.g., Sunrise Apartments'),
        const SizedBox(height: 24),
        
        _buildLabel('Full address'),
        const SizedBox(height: 8),
        _buildTextArea('Enter street name and number'),
        const SizedBox(height: 24),
        
        _buildLabel('City'),
        const SizedBox(height: 8),
        Container(
          height: 52,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('San Francisco', style: AppTextStyles.bodyMedium.copyWith(color: AppColors.outlineVariant)),
              const Icon(Icons.lock_rounded, color: AppColors.outlineVariant, size: 16),
            ],
          ),
        ),
        const SizedBox(height: 24),

        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel('Number of floors'),
                  const SizedBox(height: 8),
                  _buildStepper(
                    value: floors,
                    onDecrement: () => setState(() { if(floors > 1) floors--; }),
                    onIncrement: () => setState(() { floors++; }),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel('Total rooms'),
                  const SizedBox(height: 8),
                  _buildStepper(
                    value: rooms,
                    onDecrement: () => setState(() { if(rooms > 1) rooms--; }),
                    onIncrement: () => setState(() { rooms++; }),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        _buildLabel('Building type'),
        const SizedBox(height: 8),
        Container(
          height: 48,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(16)),
          child: Row(
            children: [
              _buildSegment('Residential', 0),
              _buildSegment('Commercial', 1),
              _buildSegment('Mixed', 2),
            ],
          ),
        ),
        const SizedBox(height: 24),

        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.secondaryContainer.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(16),
            border: const Border(left: BorderSide(color: AppColors.secondaryContainer, width: 4)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.info_outline_rounded, color: AppColors.secondaryContainer, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  "Don't worry — you'll add individual rooms and tenants in the next steps.",
                  style: AppTextStyles.bodyMedium.copyWith(color: AppColors.onSurfaceVariant, height: 1.4, fontSize: 13),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add_circle_rounded, color: AppColors.primary, size: 18),
            label: Text('+ Add another building', style: AppTextStyles.labelLarge.copyWith(color: AppColors.primary)),
            style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: const Size(0, 0), tapTargetSize: MaterialTapTargetSize.shrinkWrap),
          ),
        ),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          fontFamily: 'Plus Jakarta Sans',
          fontSize: 10,
          fontWeight: FontWeight.w800,
          color: AppColors.onSurfaceVariant,
          letterSpacing: 2.0,
        ),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return Container(
      height: 52,
      decoration: BoxDecoration(color: AppColors.surfaceContainerHighest, borderRadius: BorderRadius.circular(12)),
      child: TextField(
        style: AppTextStyles.bodyMedium,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.outlineVariant),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }

  Widget _buildTextArea(String hint) {
    return Container(
      decoration: BoxDecoration(color: AppColors.surfaceContainerHighest, borderRadius: BorderRadius.circular(12)),
      child: TextField(
        style: AppTextStyles.bodyMedium,
        maxLines: 3,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.outlineVariant),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }

  Widget _buildStepper({required int value, required VoidCallback onDecrement, required VoidCallback onIncrement}) {
    return Container(
      height: 52,
      decoration: BoxDecoration(color: AppColors.surfaceContainerHighest, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.remove_rounded, color: AppColors.primary, size: 20),
            onPressed: onDecrement,
            padding: const EdgeInsets.all(12),
          ),
          Text('$value', style: AppTextStyles.headlineSmall.copyWith(fontFamily: 'JetBrains Mono', fontSize: 18)),
          IconButton(
            icon: const Icon(Icons.add_rounded, color: AppColors.primary, size: 20),
            onPressed: onIncrement,
            padding: const EdgeInsets.all(12),
          ),
        ],
      ),
    );
  }

  Widget _buildSegment(String title, int index) {
    final isSelected = selectedBuildingType == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedBuildingType = index),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.surfaceContainerHigh : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            boxShadow: isSelected ? const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))] : null,
          ),
          child: Text(
            title,
            style: AppTextStyles.labelLarge.copyWith(
              color: isSelected ? AppColors.primaryFixed : AppColors.onSurfaceVariant,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
      decoration: BoxDecoration(color: AppColors.background.withValues(alpha: 0.8)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 52,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [AppColors.primaryContainer, AppColors.secondaryContainer]),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: AppColors.primaryContainer.withValues(alpha: 0.2), blurRadius: 10, offset: const Offset(0, 4))],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => context.go(kOnboardingStep3Route),
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
          TextButton.icon(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_rounded, size: 16, color: AppColors.onSurfaceVariant),
            label: Text('Back', style: AppTextStyles.labelLarge.copyWith(color: AppColors.onSurfaceVariant)),
          ),
        ],
      ),
    );
  }
}
