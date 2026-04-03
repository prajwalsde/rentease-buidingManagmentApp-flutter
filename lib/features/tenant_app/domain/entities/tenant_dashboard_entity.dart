class TenantDashboardEntity {
  final String tenantId;
  final double rentDue;
  final double electricityDue;
  final DateTime lastUpdated;

  const TenantDashboardEntity({
    required this.tenantId,
    required this.rentDue,
    required this.electricityDue,
    required this.lastUpdated,
  });
}
