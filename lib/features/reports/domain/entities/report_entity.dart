class ReportEntity {
  final String id;
  final String ownerId;
  final String reportType;
  final DateTime generatedAt;

  const ReportEntity({
    required this.id,
    required this.ownerId,
    required this.reportType,
    required this.generatedAt,
  });
}
