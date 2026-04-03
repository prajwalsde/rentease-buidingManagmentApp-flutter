import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/route_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Mock logic state to showcase the UI
  bool _termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Visual Polish: Ambient Glows
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryContainer.withValues(alpha: 0.1),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryContainer.withValues(alpha: 0.1),
                    blurRadius: 120,
                    spreadRadius: 60,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondaryContainer.withValues(alpha: 0.1),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.secondaryContainer.withValues(alpha: 0.1),
                    blurRadius: 120,
                    spreadRadius: 60,
                  )
                ],
              ),
            ),
          ),

          // Main Scrollable Area
          SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      // Back Button
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
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
                              child: const Icon(Icons.arrow_back_rounded, color: AppColors.onSurface, size: 20),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      
                      // Heading
                      Text(
                        'Create your account',
                        style: AppTextStyles.displayMedium.copyWith(fontSize: 26, letterSpacing: -0.5),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Let\'s get you set up as a property owner',
                        style: AppTextStyles.bodyMedium.copyWith(color: AppColors.secondaryFixedDim.withValues(alpha: 0.8), fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 32),

                      // Form Component: Full Name
                      _buildLabel('Full name'),
                      const SizedBox(height: 8),
                      _buildInputField(hint: 'Alex Mitchell'),
                      const SizedBox(height: 24),

                      // Form Component: Email Address
                      _buildLabel('Email address'),
                      const SizedBox(height: 8),
                      _buildInputField(hint: 'alex.mitchell@estate.com'),
                      const SizedBox(height: 24),

                      // Form Component: Phone Number (Country Picker Layout)
                      _buildLabel('Phone number'),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            height: 52,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: AppColors.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Text('+91', style: AppTextStyles.bodyMedium.copyWith(fontFamily: 'JetBrains Mono')),
                                const SizedBox(width: 8),
                                const Icon(Icons.expand_more_rounded, size: 18, color: AppColors.onSurface),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: _buildInputField(hint: '98765 43210', isMono: true),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Form Component: Password & Strength
                      _buildLabel('Password'),
                      const SizedBox(height: 8),
                      _buildInputField(hint: '••••••••', isPassword: true, isMono: true),
                      const SizedBox(height: 12),
                      
                      // Strength Meter
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(child: Container(height: 4, decoration: BoxDecoration(color: AppColors.tertiary, borderRadius: BorderRadius.circular(4)))),
                                const SizedBox(width: 4),
                                Expanded(child: Container(height: 4, decoration: BoxDecoration(color: AppColors.tertiary, borderRadius: BorderRadius.circular(4)))),
                                const SizedBox(width: 4),
                                Expanded(child: Container(height: 4, decoration: BoxDecoration(color: AppColors.tertiary, borderRadius: BorderRadius.circular(4)))),
                                const SizedBox(width: 4),
                                Expanded(child: Container(height: 4, decoration: BoxDecoration(color: AppColors.surfaceContainerHighest, borderRadius: BorderRadius.circular(4)))),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Good strength'.toUpperCase(),
                              style: AppTextStyles.labelSmall.copyWith(color: AppColors.tertiary, fontWeight: FontWeight.bold, fontSize: 11, letterSpacing: -0.5),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Form Component: Confirm Password
                      _buildLabel('Confirm password'),
                      const SizedBox(height: 8),
                      _buildInputField(hint: '••••••••', isPassword: true, showCheckmark: true, isMono: true),
                      const SizedBox(height: 24),

                      // Terms & Conditions
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Checkbox(
                              value: _termsAccepted,
                              onChanged: (val) {
                                setState(() {
                                  _termsAccepted = val ?? false;
                                });
                              },
                              activeColor: AppColors.primaryContainer,
                              checkColor: AppColors.onPrimaryContainer,
                              side: BorderSide.none,
                              fillColor: WidgetStateProperty.resolveWith((states) {
                                if (states.contains(WidgetState.selected)) {
                                  return AppColors.primaryContainer;
                                }
                                return AppColors.surfaceContainerHighest;
                              }),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(fontSize: 13, color: AppColors.onSurfaceVariant, height: 1.2),
                                children: [
                                  const TextSpan(text: 'I agree to '),
                                  TextSpan(
                                    text: 'Terms of Service',
                                    style: const TextStyle(color: AppColors.primaryContainer, fontWeight: FontWeight.w600),
                                  ),
                                  const TextSpan(text: ' and '),
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: const TextStyle(color: AppColors.primaryContainer, fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // Primary Action
                      Container(
                        height: 52,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppColors.primaryContainer, AppColors.secondaryContainer],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryContainer.withValues(alpha: 0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () => context.go(kOnboardingStep1Route),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Create account',
                                    style: AppTextStyles.headlineSmall.copyWith(color: AppColors.onPrimaryContainer, fontSize: 16),
                                  ),
                                  const SizedBox(width: 8),
                                  const Icon(Icons.arrow_forward_rounded, color: AppColors.onPrimaryContainer, size: 20),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 48),

                      // Footer Ghost Link
                      GestureDetector(
                        onTap: () => context.pop(),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.onSurfaceVariant, fontSize: 14),
                            children: [
                              const TextSpan(text: 'Already have an account? '),
                              TextSpan(
                                text: 'Sign in',
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.onSurfaceVariant,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String hint, 
    bool isPassword = false, 
    bool showCheckmark = false,
    bool isMono = false,
  }) {
    return TextField(
      obscureText: isPassword,
      style: AppTextStyles.bodyMedium.copyWith(
        fontFamily: isMono ? 'JetBrains Mono' : 'Manrope',
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.outline,
          fontFamily: isMono ? 'JetBrains Mono' : 'Manrope',
        ),
        filled: true,
        fillColor: AppColors.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        suffixIcon: isPassword 
          ? showCheckmark 
            ? const Icon(Icons.check_circle_rounded, color: AppColors.tertiary, size: 20)
            : const Icon(Icons.visibility_rounded, color: AppColors.onSurfaceVariant, size: 20)
          : null,
      ),
    );
  }
}
