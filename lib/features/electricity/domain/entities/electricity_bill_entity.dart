class ElectricityBillEntity {
  final String id;
  final String ownerId;
  final String tenantId;
  final double unitsConsumed;
  final double amount;
  final DateTime billingMonth;

  const ElectricityBillEntity({
    required this.id,
    required this.ownerId,
    required this.tenantId,
    required this.unitsConsumed,
    required this.amount,
    required this.billingMonth,
  });
}
