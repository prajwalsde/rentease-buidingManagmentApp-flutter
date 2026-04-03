class RoomEntity {
  final String id;
  final String buildingId;
  final String roomNumber;
  final double monthlyRent;

  const RoomEntity({
    required this.id,
    required this.buildingId,
    required this.roomNumber,
    required this.monthlyRent,
  });
}
