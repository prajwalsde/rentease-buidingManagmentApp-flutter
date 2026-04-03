class DashboardSummaryEntity {
  final int totalBuildings;
  final int totalRooms;
  final int totalTenants;
  final double pendingRentAmount;

  const DashboardSummaryEntity({
    required this.totalBuildings,
    required this.totalRooms,
    required this.totalTenants,
    required this.pendingRentAmount,
  });
}
