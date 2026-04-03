import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/route_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class Step4ElectricitySettingsScreen extends StatefulWidget {
  const Step4ElectricitySettingsScreen({super.key});

  @override
  State<Step4ElectricitySettingsScreen> createState() => _Step4ElectricitySettingsScreenState();
}

class _Step4ElectricitySettingsScreenState extends State<Step4ElectricitySettingsScreen> {
  bool applyToAll = true;
  int meteringConfig = 0; // 0 for sub-meter, 1 for shared

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Decorative Gradients
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryContainer.withValues(alpha: 0.1),
                boxShadow: [BoxShadow(color: AppColors.primaryContainer.withValues(alpha: 0.1), blurRadius: 120, spreadRadius: 60)],
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            right: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondaryContainer.withValues(alpha: 0.05),
                boxShadow: [BoxShadow(color: AppColors.secondaryContainer.withValues(alpha: 0.05), blurRadius: 120, spreadRadius: 60)],
              ),
            ),
          ),
          
          SafeArea(
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
        ],
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
            'STEP 4 OF 5',
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
              _buildProgressPill(isActive: true),
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
        SizedBox(
          width: double.infinity,
          height: 120,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Glow
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryContainer.withValues(alpha: 0.2),
                  boxShadow: [BoxShadow(color: AppColors.primaryContainer.withValues(alpha: 0.2), blurRadius: 40)],
                ),
              ),
              // Main Icon
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: AppColors.surfaceContainerHighest,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 20)],
                ),
                child: const Center(
                  child: Icon(Icons.bolt_rounded, size: 48, color: AppColors.primaryContainer),
                ),
              ),
              // Floating elements
              Positioned(
                top: 16,
                right: 48,
                child: Transform.rotate(
                  angle: 0.2,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerHigh,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
                    ),
                    child: const Center(child: Icon(Icons.offline_bolt_rounded, color: AppColors.tertiary, size: 16)),
                  ),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 48,
                child: Transform.rotate(
                  angle: -0.1,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: AppColors.surfaceContainerHigh,
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
                    ),
                    child: const Center(child: Icon(Icons.electric_meter_rounded, color: AppColors.onSurfaceVariant, size: 20)),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Configure electricity billing',
          style: AppTextStyles.displayMedium.copyWith(fontSize: 27, height: 1.2),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Set your default rate — you can always change it per building',
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
        Row(
          children: [
            Expanded(child: _buildCurrencyField('Electricity rate (per kWh)', '8.50', isDecimal: true)),
            const SizedBox(width: 16),
            Expanded(child: _buildCurrencyField('Fixed monthly charge', '150')),
          ],
        ),
        const SizedBox(height: 24),
        
        _buildIconField('Billing cycle day (1-28)', '1', Icons.calendar_today_rounded),
        const SizedBox(height: 32),

        // Toggles Section
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: AppColors.surfaceContainer, borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Apply same rate to all buildings', style: AppTextStyles.titleSmall),
                    const SizedBox(height: 2),
                    Text('Consistency across your entire portfolio', style: AppTextStyles.labelSmall.copyWith(color: AppColors.onSurfaceVariant)),
                  ],
                ),
              ),
              Switch(
                value: applyToAll,
                onChanged: (val) => setState(() => applyToAll = val),
                activeColor: AppColors.onPrimaryContainer,
                activeTrackColor: AppColors.primaryContainer,
                inactiveTrackColor: AppColors.surfaceContainerHighest,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Metering Config
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: AppColors.surfaceContainer, borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Metering Configuration', style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.w700)),
              const SizedBox(height: 16),
              _buildRadioOption(
                index: 0,
                title: 'Sub-meter per room',
                subtitle: 'Precise consumption tracking per unit',
                recommended: true,
              ),
              const SizedBox(height: 12),
              _buildRadioOption(
                index: 1,
                title: 'Shared meter with manual split',
                subtitle: 'Split total bill based on square footage or flat fee',
                recommended: false,
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),

        // Hint Card
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(16),
            border: const Border(left: BorderSide(color: AppColors.secondaryContainer, width: 4)), // Simulate the before: element
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.info_outline_rounded, color: AppColors.secondaryContainer, size: 24),
              const SizedBox(width: 16),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: AppTextStyles.bodyMedium.copyWith(color: AppColors.onSurfaceVariant, fontSize: 13, height: 1.5),
                    children: [
                      const TextSpan(text: 'These settings '),
                      TextSpan(text: 'auto-calculate bills', style: TextStyle(color: AppColors.onSurface, fontWeight: FontWeight.bold)),
                      const TextSpan(text: ' when you enter meter readings, reducing manual math and preventing errors.'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCurrencyField(String label, String hint, {bool isDecimal = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            label.toUpperCase(),
            style: const TextStyle(fontFamily: 'Plus Jakarta Sans', fontSize: 10, fontWeight: FontWeight.w800, color: AppColors.onSurfaceVariant, letterSpacing: 1.0),
          ),
        ),
        Container(
          height: 52,
          decoration: BoxDecoration(color: AppColors.surfaceContainerHighest, borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16, right: 8),
                child: Text('₹', style: TextStyle(fontFamily: 'JetBrains Mono', color: AppColors.primary, fontSize: 16)),
              ),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: isDecimal),
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

  Widget _buildIconField(String label, String hint, IconData icon) {
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
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontFamily: 'JetBrains Mono', fontSize: 14),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: TextStyle(fontFamily: 'JetBrains Mono', color: AppColors.outline.withValues(alpha: 0.5), fontSize: 14),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Icon(icon, color: AppColors.outlineVariant, size: 20),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRadioOption({required int index, required String title, required String subtitle, bool recommended = false}) {
    bool isSelected = meteringConfig == index;
    return GestureDetector(
      onTap: () => setState(() => meteringConfig = index),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.surfaceContainerHigh : AppColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(16),
          border: isSelected ? Border.all(color: AppColors.primary.withValues(alpha: 0.3)) : Border.all(color: Colors.transparent),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 2),
              width: 20, height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: isSelected ? AppColors.primary : AppColors.outline, width: 2),
                color: isSelected ? AppColors.primary : Colors.transparent,
              ),
              child: isSelected ? const Center(child: Icon(Icons.circle, color: AppColors.surfaceContainerHighest, size: 8)) : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(title, style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.w600)),
                      if (recommended) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(color: AppColors.secondaryContainer.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            'RECOMMENDED',
                            style: TextStyle(fontSize: 8, color: AppColors.secondaryContainer, fontWeight: FontWeight.bold, letterSpacing: 0.5),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(subtitle, style: AppTextStyles.labelSmall.copyWith(color: AppColors.onSurfaceVariant)),
                ],
              ),
            ),
          ],
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
              boxShadow: [BoxShadow(color: AppColors.primaryContainer.withValues(alpha: 0.3), blurRadius: 16, offset: const Offset(0, 8))],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(28),
                onTap: () => context.go(kOnboardingStep5Route),
                child: Center(
                  child: Text('Continue', style: AppTextStyles.headlineSmall.copyWith(color: AppColors.onPrimaryContainer, fontSize: 16)),
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
