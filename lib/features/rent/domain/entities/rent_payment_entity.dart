class RentPaymentEntity {
  final String id;
  final String ownerId;
  final String tenantId;
  final double amount;
  final String status;
  final DateTime dueDate;

  const RentPaymentEntity({
    required this.id,
    required this.ownerId,
    required this.tenantId,
    required this.amount,
    required this.status,
    required this.dueDate,
  });
}
