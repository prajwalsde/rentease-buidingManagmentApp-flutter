class TenantEntity {
  final String id;
  final String ownerId;
  final String buildingId;
  final String roomId;
  final String fullName;
  final String phone;

  const TenantEntity({
    required this.id,
    required this.ownerId,
    required this.buildingId,
    required this.roomId,
    required this.fullName,
    required this.phone,
  });
}
