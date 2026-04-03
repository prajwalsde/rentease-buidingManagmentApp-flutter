import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/route_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class Step1OwnerProfileScreen extends StatelessWidget {
  const Step1OwnerProfileScreen({super.key});

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
                    _buildTitleSection(),
                    const SizedBox(height: 48),
                    _buildProfileUpload(),
                    const SizedBox(height: 32),
                    _buildFormFields(),
                    const SizedBox(height: 100), // Space for sticky bottom nav
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildStickyFooter(context),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'STEP 1 OF 5',
                style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.primary,
                  fontFamily: 'JetBrains Mono',
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 120,
                height: 6,
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: 0.2, // Step 1
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColors.primaryContainer, AppColors.secondaryContainer],
                      ),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
            ],
          ),
          TextButton.icon(
            onPressed: () => context.go(kLoginRoute),
            icon: const Icon(Icons.close_rounded, size: 16, color: AppColors.onSurfaceVariant),
            label: Text(
              'Exit',
              style: AppTextStyles.bodyMedium.copyWith(color: AppColors.onSurfaceVariant, fontWeight: FontWeight.w600),
            ),
            style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: const Size(0, 0), tapTargetSize: MaterialTapTargetSize.shrinkWrap),
          ),
        ],
      ),
    );
  }

  Widget _buildIllustrationSection() {
    return Container(
      width: double.infinity,
      height: 120,
      constraints: const BoxConstraints(maxWidth: 280),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primaryContainer, AppColors.secondaryContainer],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Abstract glows
          Positioned(
            bottom: -16,
            left: -16,
            child: Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.1),
                boxShadow: [BoxShadow(color: Colors.white.withValues(alpha: 0.1), blurRadius: 20)],
              ),
            ),
          ),
          Positioned(
            top: -16,
            right: -16,
            child: Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondaryContainer.withValues(alpha: 0.3),
                boxShadow: [BoxShadow(color: AppColors.secondaryContainer.withValues(alpha: 0.3), blurRadius: 20)],
              ),
            ),
          ),
          // Icons
          Transform.translate(
            offset: const Offset(0, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(Icons.person_rounded, size: 64, color: Colors.white),
                const SizedBox(width: 12),
                Icon(Icons.domain_rounded, size: 48, color: Colors.white.withValues(alpha: 0.7)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleSection() {
    return Column(
      children: [
        Text(
          'Tell us about yourself',
          style: AppTextStyles.displayMedium.copyWith(fontSize: 28, height: 1.2),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'This helps personalize your property management experience',
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.onSurfaceVariant),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildProfileUpload() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerHighest,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.outlineVariant, width: 2, style: BorderStyle.solid), // Dashed borders need custom painters, using solid.
              ),
              child: ClipOval(
                child: Image.network(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuCmnVEsty2RVjFH3_K5jAE11ARoWoHgTAnX6Qr3jfjeesH2tUHQTrC07HrsfE2YHKYxIZUs_tGjGX1gBBHL7vrRKGXQazrmW1t0R_UL91lMaK24Kj-bcIe_wdy9s7boA7-RpCUnHMN-oXfGnOQXYep-BcfYu9jt4iPFgqIT5MzJI7HUfOyxAIpG371cHheTOJ0DlGM_9MEV7FBMcn3RlYqzayaRgmJt-Bln3bkU8XwM3a-_QYPxKsDXeBok1eMTG5o538A1X238fhc',
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.person, size: 48, color: AppColors.outline),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 32,
                height: 32,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [AppColors.primaryContainer, AppColors.secondaryContainer]),
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.background, width: 4),
                  boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))],
                ),
                child: const Icon(Icons.add_rounded, size: 16, color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'UPLOAD PROFILE PHOTO',
          style: AppTextStyles.labelSmall.copyWith(
            fontFamily: 'JetBrains Mono',
            color: AppColors.outline,
            fontSize: 10,
            letterSpacing: 2.0,
          ),
        )
      ],
    );
  }

  Widget _buildFormFields() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isPhone = constraints.maxWidth < 600;
        final List<Widget> fields = [
          _buildFieldLayout(label: 'Display Name', child: _buildTextField('Alex Mitchell', icon: Icons.edit_rounded)),
          if (isPhone) const SizedBox(height: 24),
          _buildFieldLayout(label: 'Business / Property Name', child: _buildTextField('e.g. Skyline Apartments')),
          if (isPhone) const SizedBox(height: 24),
          _buildFieldLayout(label: 'City', child: _buildTextField('Search city...', icon: Icons.location_on_rounded, iconAlignLeft: true)),
          if (isPhone) const SizedBox(height: 24),
          _buildFieldLayout(label: 'State / Province', child: _buildDropdownField('Select State')),
          if (isPhone) const SizedBox(height: 24),
          _buildFieldLayout(label: 'Preferred Language', child: _buildDropdownField('English (US)', icon: Icons.language_rounded), isFullWidth: true),
        ];

        if (isPhone) {
          return Column(children: fields);
        } else {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(child: fields[0]),
                  const SizedBox(width: 24),
                  Expanded(child: fields[2]),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(child: fields[4]),
                  const SizedBox(width: 24),
                  Expanded(child: fields[6]),
                ],
              ),
              const SizedBox(height: 24),
              fields[8], // Preferred language full width
            ],
          );
        }
      },
    );
  }
  
  Widget _buildFieldLayout({required String label, required Widget child, bool isFullWidth = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            label.toUpperCase(),
            style: const TextStyle(
              fontFamily: 'JetBrains Mono',
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.outline,
              letterSpacing: 2.0,
            ),
          ),
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }

  Widget _buildTextField(String hint, {IconData? icon, bool iconAlignLeft = false}) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        style: AppTextStyles.bodyMedium,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.outlineVariant),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          prefixIcon: iconAlignLeft && icon != null ? Icon(icon, color: AppColors.outlineVariant, size: 20) : null,
          suffixIcon: !iconAlignLeft && icon != null ? Icon(icon, color: AppColors.onSurfaceVariant, size: 20) : null,
        ),
      ),
    );
  }

  Widget _buildDropdownField(String hint, {IconData? icon}) {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(hint, style: AppTextStyles.bodyMedium),
          Icon(icon ?? Icons.expand_more_rounded, color: AppColors.outlineVariant, size: 20),
        ],
      ),
    );
  }

  Widget _buildStickyFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow.withValues(alpha: 0.9),
        border: Border(top: BorderSide(color: AppColors.outlineVariant.withValues(alpha: 0.1))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              'Back',
              style: AppTextStyles.bodyMedium.copyWith(color: AppColors.onSurfaceVariant, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: 52,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [AppColors.primaryContainer, AppColors.secondaryContainer]),
              borderRadius: BorderRadius.circular(26),
              boxShadow: [
                BoxShadow(color: AppColors.primaryContainer.withValues(alpha: 0.2), blurRadius: 10, offset: const Offset(0, 4)),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(26),
                onTap: () => context.go(kOnboardingStep2Route),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    children: [
                      Text(
                        'Continue',
                        style: AppTextStyles.headlineSmall.copyWith(color: AppColors.onPrimaryContainer, fontSize: 14),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward_rounded, color: AppColors.onPrimaryContainer, size: 18),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
