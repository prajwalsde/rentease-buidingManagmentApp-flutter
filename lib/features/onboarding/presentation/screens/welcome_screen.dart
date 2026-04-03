import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/route_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final topHeight = constraints.maxHeight * 0.55;
          
          return Column(
            children: [
              // Top 55%: Visual Canvas
              SizedBox(
                height: topHeight,
                width: double.infinity,
                child: Stack(
                  children: [
                    // Background Illustration
                    Positioned.fill(
                      child: Opacity(
                        opacity: 0.6,
                        child: Image.network(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuAtJMofiIuJx6_SCZBE1j7Wt1qli87N5JelP7-_knxXvUYyDOGoN1PcWuFELec5FSfO6bjUoPM0DtE_-ngBPz4lVpzev_pRiIPDazQo6MERnDVMR5sPnDqqmd9xt347hYeQQCCU3oOI68Z2c4-l4YulvLf36yltwgEdXANcQyhRYd1J2o47EjPSiHV7RxQxMzTqZz7fLRABVJr--nyi-5YlzuwTkRwM_QEJqxasgD4zfc7KQooLr2tE2yVXERmEsYkkVIzRabVFuN8',
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const Center(
                            child: Icon(Icons.apartment_rounded, size: 100, color: AppColors.surfaceContainerHighest),
                          ),
                        ),
                      ),
                    ),
                    
                    // Depth Gradient
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.background.withValues(alpha: 0.2),
                              Colors.transparent,
                              AppColors.background.withValues(alpha: 0.8),
                            ],
                            stops: const [0.0, 0.4, 1.0],
                          ),
                        ),
                      ),
                    ),

                    // Branding Header
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        child: Text(
                          'RentEase',
                          style: AppTextStyles.headlineMedium.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                    ),

                    // Floating UI Accents
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48),
                        child: Opacity(
                          opacity: 0.4,
                          child: Row(
                            children: [
                              Expanded(
                                child: Transform.translate(
                                  offset: const Offset(0, 32),
                                  child: Transform.rotate(
                                    angle: -0.2,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                                        child: Container(
                                          height: 120,
                                          decoration: BoxDecoration(
                                            color: AppColors.primaryContainer.withValues(alpha: 0.2),
                                            border: Border.all(color: AppColors.outlineVariant.withValues(alpha: 0.1)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Transform.translate(
                                  offset: const Offset(0, -16),
                                  child: Transform.rotate(
                                    angle: 0.1,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                                        child: Container(
                                          height: 160,
                                          decoration: BoxDecoration(
                                            color: AppColors.secondaryContainer.withValues(alpha: 0.2),
                                            border: Border.all(color: AppColors.outlineVariant.withValues(alpha: 0.1)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Bottom 45%: Interaction Panel
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.surfaceContainerLow,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 30,
                        offset: Offset(0, -10),
                      )
                    ]
                  ),
                  child: SafeArea(
                    top: false,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 40.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Text Content
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Manage your properties effortlessly',
                                style: AppTextStyles.displayMedium.copyWith(fontSize: 28, height: 1.2),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Track rent, electricity bills, and tenants — all in one place.',
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.onSurfaceVariant,
                                  fontSize: 15,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                          
                          // Action Buttons
                          Column(
                            children: [
                              // Primary Action
                              Container(
                                height: 56,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [AppColors.primaryContainer, AppColors.secondaryContainer],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(16),
                                    onTap: () => context.go(kSignupRoute),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Get started as owner',
                                            style: AppTextStyles.headlineSmall.copyWith(
                                              color: AppColors.onPrimaryContainer,
                                              fontSize: 16,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          const Icon(Icons.arrow_forward_rounded, color: AppColors.onPrimaryContainer, size: 20),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              
                              // Secondary Action
                              Container(
                                height: 56,
                                decoration: BoxDecoration(
                                  color: AppColors.surfaceContainerHighest,
                                  border: Border.all(color: AppColors.outlineVariant.withValues(alpha: 0.2)),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(16),
                                    onTap: () => context.go(kLoginRoute),
                                    child: Center(
                                      child: Text(
                                        'I\'m a tenant — Sign in',
                                        style: AppTextStyles.headlineSmall.copyWith(
                                          color: AppColors.primary,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Footer Link
                          GestureDetector(
                            onTap: () => context.go(kLoginRoute),
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
