class OnboardingProgressEntity {
  final String ownerId;
  final int currentStep;
  final bool isCompleted;

  const OnboardingProgressEntity({
    required this.ownerId,
    required this.currentStep,
    required this.isCompleted,
  });
}
