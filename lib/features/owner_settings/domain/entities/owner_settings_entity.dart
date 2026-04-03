class OwnerSettingsEntity {
  final String ownerId;
  final String currencyCode;
  final double electricityRate;
  final bool notificationsEnabled;

  const OwnerSettingsEntity({
    required this.ownerId,
    required this.currencyCode,
    required this.electricityRate,
    required this.notificationsEnabled,
  });
}
