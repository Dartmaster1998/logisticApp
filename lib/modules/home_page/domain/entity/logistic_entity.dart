class LogisticEntity {
  final String clientCode;
  final String idNumber;
  final String category;
  final int packageCount;
  final String status;
  final String? comment;

  LogisticEntity({
    required this.clientCode,
    required this.idNumber,
    required this.category,
    required this.packageCount,
    required this.status,
    required this.comment,
  });
}
