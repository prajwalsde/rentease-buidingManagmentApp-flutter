import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../shared/widgets/input_workspace_field.dart';

class AddEditTenantScreen extends StatefulWidget {
  const AddEditTenantScreen({super.key});

  @override
  State<AddEditTenantScreen> createState() => _AddEditTenantScreenState();
}

class _AddEditTenantScreenState extends State<AddEditTenantScreen> {
  bool _sendViaSms = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: CustomScrollView(
        slivers: [
          // Glassmorphism App Bar
          SliverAppBar(
            pinned: true,
            backgroundColor: AppColors.surface.withValues(alpha: 0.6),
            surfaceTintColor: Colors.transparent,
            flexibleSpace: ClipRRect(
              child: BackdropFilter(
                filter: ColorFilter.mode(
                  AppColors.surface.withValues(alpha: 0.6),
                  BlendMode.srcOver,
                ),
                child: const SizedBox.expand(),
              ),
            ),
            elevation: 0,
            leadingWidth: 72,
            leading: Center(
              child: InkWell(
                onTap: () => context.pop(),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: AppColors.onSurfaceVariant,
                    size: 20,
                  ),
                ),
              ),
            ),
            title: Text(
              'Add tenant',
              style: AppTextStyles.headlineSmall.copyWith(
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
              ),
            ),
            centerTitle: false,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppColors.tertiary,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.tertiary.withValues(alpha: 0.5),
                            blurRadius: 8,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'LIVE SYSTEM',
                      style: AppTextStyles.labelSmall.copyWith(
                        fontFamily: 'JetBrains Mono',
                        color: AppColors.tertiary,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          // Body Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0, bottom: 40.0),
              child: Column(
                children: [
                  _buildPersonalDetailsSection(),
                  const SizedBox(height: 32),
                  _buildRoomAssignmentSection(),
                  const SizedBox(height: 32),
                  _buildRentDetailsSection(),
                  const SizedBox(height: 32),
                  _buildLoginCredentialsSection(),
                  const SizedBox(height: 48),
                  _buildCTAButton(),
                  const SizedBox(height: 120), // Bottom padding for navigation
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: AppTextStyles.labelSmall.copyWith(
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: AppColors.primary.withValues(alpha: 0.8),
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 32,
          height: 2,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildPersonalDetailsSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Personal details'),
          
          // Photo Picker
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerHighest,
                    shape: BoxShape.circle,
                    // Dotted border approximation
                    border: Border.all(
                      color: AppColors.outlineVariant,
                      width: 2,
                      style: BorderStyle.solid, 
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add_a_photo_outlined,
                      color: AppColors.outline,
                      size: 28,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -4,
                  right: -4,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        )
                      ],
                    ),
                    child: const Icon(
                      Icons.edit,
                      color: AppColors.onPrimary,
                      size: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          
          InputWorkspaceField(
            label: 'Full name',
            hintText: 'e.g. Alexander Mitchell',
            controller: TextEditingController(),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: InputWorkspaceField(
                  label: 'Phone number',
                  hintText: '+91 00000 00000',
                  keyboardType: TextInputType.phone,
                  textStyle: AppTextStyles.bodyLarge.copyWith(fontFamily: 'JetBrains Mono'),
                  controller: TextEditingController(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: InputWorkspaceField(
                  label: 'Email',
                  hintText: 'alex@example.com',
                  keyboardType: TextInputType.emailAddress,
                  controller: TextEditingController(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRoomAssignmentSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Room assignment'),
          
          InputWorkspaceField(
            label: 'Select building',
            hintText: 'Skyline Residency',
            suffixIcon: const Icon(Icons.expand_more, color: AppColors.outline),
            controller: TextEditingController(),
          ),
          const SizedBox(height: 20),
          InputWorkspaceField(
            label: 'Select room',
            hintText: 'Room 402 (Vacant)',
            suffixIcon: const Icon(Icons.filter_list, color: AppColors.outline),
            controller: TextEditingController(),
          ),
          const SizedBox(height: 20),
          InputWorkspaceField(
            label: 'Move-in date',
            hintText: 'YYYY-MM-DD',
            textStyle: AppTextStyles.bodyLarge.copyWith(fontFamily: 'JetBrains Mono'),
            suffixIcon: const Icon(Icons.calendar_today, color: AppColors.outline, size: 18),
            controller: TextEditingController(),
          ),
          const SizedBox(height: 20),
          InputWorkspaceField(
            label: 'Security deposit',
            hintText: '25,000',
            keyboardType: TextInputType.number,
            textStyle: AppTextStyles.bodyLarge.copyWith(fontFamily: 'JetBrains Mono'),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 12.0),
              child: Text(
                '₹',
                style: AppTextStyles.bodyLarge.copyWith(
                  fontFamily: 'JetBrains Mono',
                  color: AppColors.onSurfaceVariant,
                ),
              ),
            ),
            controller: TextEditingController(),
          ),
        ],
      ),
    );
  }

  Widget _buildRentDetailsSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Rent details'),
          
          InputWorkspaceField(
            label: 'Monthly rent',
            hintText: '12,500',
            keyboardType: TextInputType.number,
            textStyle: AppTextStyles.bodyLarge.copyWith(
              fontFamily: 'JetBrains Mono', 
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 12.0),
              child: Text(
                '₹',
                style: AppTextStyles.bodyLarge.copyWith(
                  fontFamily: 'JetBrains Mono',
                  color: AppColors.onSurfaceVariant,
                ),
              ),
            ),
            controller: TextEditingController(text: '12500'),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: InputWorkspaceField(
                  label: 'Rent due date',
                  hintText: '5',
                  keyboardType: TextInputType.number,
                  textStyle: AppTextStyles.bodyLarge.copyWith(fontFamily: 'JetBrains Mono'),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Text(
                      'OF MO.',
                      style: AppTextStyles.labelSmall.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.outline,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  controller: TextEditingController(),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: InputWorkspaceField(
                  label: 'Grace period',
                  hintText: '3',
                  keyboardType: TextInputType.number,
                  textStyle: AppTextStyles.bodyLarge.copyWith(fontFamily: 'JetBrains Mono'),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Text(
                      'DAYS',
                      style: AppTextStyles.labelSmall.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.outline,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  controller: TextEditingController(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoginCredentialsSection() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          // Purple Signature Gradient Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryContainer, AppColors.secondaryContainer],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.lock_rounded,
                  color: AppColors.onPrimaryContainer,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Text(
                  'Login credentials',
                  style: AppTextStyles.titleMedium.copyWith(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.bold,
                    color: AppColors.onPrimaryContainer,
                  ),
                ),
              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                _buildCredentialField('Username', '9876543210@rentease.app'),
                const SizedBox(height: 20),
                _buildCredentialField('Temp password', 'RE-8219-XM'),
                const SizedBox(height: 24),
                
                // Toggle
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.secondaryContainer.withValues(alpha: 0.2),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.sms_rounded,
                            color: AppColors.secondary,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Send credentials via SMS',
                          style: AppTextStyles.titleSmall.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Switch(
                      value: _sendViaSms,
                      onChanged: (val) {
                        setState(() { _sendViaSms = val; });
                      },
                      activeColor: AppColors.primary,
                      activeTrackColor: AppColors.primary.withValues(alpha: 0.3),
                      inactiveTrackColor: AppColors.surfaceContainerHighest,
                      trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCredentialField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.labelMedium,
        ),
        const SizedBox(height: 8),
        Container(
          height: 52,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontFamily: 'JetBrains Mono',
                ),
              ),
              InkWell(
                onTap: () {}, // copy logic
                child: const Icon(
                  Icons.content_copy_rounded,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCTAButton() {
    return Container(
      width: double.infinity,
      height: 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryContainer.withValues(alpha: 0.2),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
        gradient: const LinearGradient(
          colors: [AppColors.primaryContainer, AppColors.secondaryContainer],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            // ScaffoldMessenger.of(context).showSnackBar(...);
            context.pop();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Create tenant account',
                style: AppTextStyles.titleMedium.copyWith(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w800,
                  color: AppColors.onPrimaryContainer,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(width: 12),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.onPrimaryContainer,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
