import 'package:test_app/modules/home_page/domain/entity/logistic_entity.dart';

class LogisticModel extends LogisticEntity {
  LogisticModel({
    required super.clientCode,
    required super.idNumber,
    required super.category,
    required super.packageCount,
    required super.status,
    required super.comment,
  });
  factory LogisticModel.fromJson(Map<String, dynamic> json) {
    return LogisticModel(
      clientCode: json["clientCode"] ?? "",
      idNumber: json["idNumber"] ?? "",
      category: json["category"] ?? "",
      packageCount: json["packageCount"] ?? 0,
      status: json["status"],
      comment: json["comment"],
    );
  }
}
